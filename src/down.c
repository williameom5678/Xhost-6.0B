////////////////////////////////////////////////////////////////////////
//´Ù¿î °ü·Ã ·çÆ¾
////////////////////////////////////////////////////////////////////////
#include "bbs.h"
#include <unistd.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä
#include <dirent.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä

BBS abbs[102];


//°Ô½ÃÆÇ ´Ù¿î		mode==2:SEE  mode=3:pr
bbs_down(int mode)
{
	FILE *fp;
	char buff[200];
	char buff2[200];
	char newdir[100];
	char filename[200];
	char filename2[200];
	char ch;
	BBS oldbbs;
	int old_down=pf.down;
	int i,n,i2,key,count,ret,tsize;
	int body_no;
	char mail_mode=No;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];
	char table_name[100],mailcmd[100];

	oldbbs=bbs;

	if (bit(bcfg.modelist,21)&&!bbs_man(pf.id)) {
		mess("´Ù¿î¸í·ÉÀÌ ±ÝÁöµÇ¾ú½À´Ï´Ù.");
		return No;
	}

	re_print=Yes;

	sprintf(buff,"forum/%s/logo/%s.ndn",club_go.code,go.code);
	if (is_file(buff)) {view(buff);goto _fail;}
	sprintf(buff,"forum/%s/logo/all.ndn",club_go.code);
	if (is_file(buff)) {view(buff);goto _fail;}

	sprintf(filename,"forum/%s/logo/%s.lir",club_go.code,go.code);

	if (is_same(go.code,"rmail")||is_same(go.code,"mbox")||is_same(go.code,"dbox")||is_same(go.code,"cmail")) {
		set_stat(8,bbs.title);	   //´Ù¿îÁßÀÓ
		mail_down();
		set_stat(1,"");     //´Ù¿îÁßÀÓ
		return Yes;
	}
	else if (bit(bcfg.modelist,5)&&!in_file2(filename,pf.id)) return No; //ÁöÁ¤µÈ ID¸¸ °¡´ÉÇÑ°¡?
	else if (is_same(go.code,"bbs_all"));
	else if (mode!=3&&is_typepds) return pds_down(mode);  //ÀÚ·á½ÇÀÌ¸é ÆÄÀÏ´Ù¿îÀ¸·Î..  prÀÎ°æ¿ì ¹«½Ã


	key=No;  //ÀÎÅÍ³Ý¶óÀÎ

	view("forum/main/frm/down/bbsdown.log");

	//È­¸é Ãâ·Â¸ðµåÀÏ¶§ dn¸¸ ´©¸§
	if (list_mode&&mmn[1]==0) mmn[1]=bbs.num;
	if (mmn[1]==0) {
		_input2:
		view("forum/main/frm/down/nonumbbs.log");
		lineinput(buff,160);check_han(buff);printf("\n");
		check_cmd(buff);
		if (mmn[0]==0) {
			view("forum/main/frm/down/nonumbbs.err");
			if (yesno2("",Yes)==No) goto _input2;
			goto _fail;
		}
	}
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));check_dir(newdir);

	//¹ÞÀ» ÆÄÀÏ¸í
	if (bbsdownnum<0) bbsdownnum+=1000;
	sprintf(filename,"%s.%d",pf.id,bbsdownnum%1000);
	sprintf(filename2,"%s/%s",newdir,filename);
	strcpy(g_buff1,filename);
	view("forum/main/frm/down/filename.log");
	lineinput(buff,12);printf("\n");
	if (strlen(buff)>0) strcpy(filename,buff);
	del_space(filename);del_esc3(filename);
	sprintf(filename2,"%s/%s",newdir,filename);

	count=0;  //´Ù¿î¹ÞÀ» È­ÀÏ¼ö
	tsize=0;  //´Ù¿î¹Þ´Â ¿ë·®
	count=0;

	strcpy(db_name,DB_CM);
	sprintf(table_name,"%s_%s",club_go.code,go.code);
	if ((is_same(go.code,"rmail")||is_same(go.code,"wmail")||is_same(go.code,"mbox")||is_same(go.code,"dbox")||is_same(go.code,"cmail"))) {
		mail_mode=Yes;
		strcpy(db_name,DB_MAIL);
		sprintf(table_name,"mail%s",pf.id);
		if (is_same(go.code,"rmail")) strcpy(mailcmd,"mail");
		if (is_same(go.code,"mbox")) strcpy(mailcmd,"save");
		if (is_same(go.code,"cmail")) strcpy(mailcmd,"send");
		if (is_same(go.code,"dbox")) strcpy(mailcmd,"delete");
	}

	//DB¿¡¼­ ÀÐ±â
	if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {printf("## ERR 2401: %s\n",mysql_error(sock));return No;}
	if ((mysql_select_db(sock, db_name)) == -1) {printf("## ERR 2402: %s\n",mysql_error(sock));return No;}

	if ((fp=fopen(filename2,"w+"))==NULL) goto _fail;

	for (i=1;i<100;i++) {
		int num=mmn[i];
		if (num==0) continue;
		if (mail_mode) sprintf(query,"SELECT * FROM %s where num=%d and tcode='%s' and del!='D'",table_name,num,mailcmd);
		else sprintf(query,"SELECT * FROM %s where num=%d and del!='D'",table_name,num);
		if (mysql_query(sock, query) == -1) {
		   printf("## ÇØ´çµÇ´Â #%d ¹ø °Ô½Ã¹°(%s)À» ÀÐÀ»¼ö ¾ø½À´Ï´Ù. %s\n",num,go.code,mysql_error(sock));
		   continue;
		}
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))==NULL) {  //Ã£±â½ÇÆÐ
			printf("## ÇØ´çµÇ´Â ¹øÈ£(%d)¸¦ Ã£À»¼ö ¾ø½À´Ï´Ù.\n",num);
			mysql_free_result(qres);
			continue;
		}
		qrow2bbs(qrow);
		if (bbs.del=='D') continue;
		body_no=fnobbs("body");

		if (mode==2&&!stristr(bbs.filename,".jpg")) continue;
		//¾ÏÈ£°¡ ÁöÁ¤µÇ¾î ÀÖÀ»¶§
		if (!bit(bcfg.mode,31)&&strlen(bbs.passwd)>0&&!check_pass(bbs.passwd,4,"ÀÌ ÀÚ·á´Â ¾ÏÈ£°¡ ÁöÁ¤µÇ¾î ÀÖ½À´Ï´Ù.")) continue;
		printf(".");fflush(stdout);
		fprintf(fp,"¹ø  È£ : %d\n",bbs.num);
		fprintf(fp,"°Ô½ÃÀÚ : %-8s (%-8s)\n",bbs.id,bbs.name);
		fprintf(fp,"µî·ÏÀÏ : %s\n",datestr(8,bbs.date));
		fprintf(fp,"Á¦  ¸ñ : %s\n",bbs.title);
		fprintf(fp,"\n");
		if (qrow[body_no]!=NULL&&strlen(qrow[body_no])) {
			fprintf(fp,"%s\n",qrow[body_no]);
		}
		count++;
	}
	mysql_close(sock);
	printf("\n");
	fclose(fp);

	if (count<1) {
		printf(" ÇØ´çµÇ´Â ÀÚ·á°¡ ¾ø½À´Ï´Ù\n");
		goto _fail;
	}
	tsize=file_size(filename2);

	//´Ù¿îºÒ°¡´É Á¶°Ç
	ret=No;
	if (guest_mode&&bit(cfg.downmode,6)==1)   pf.down=100000000;
		 if (is_char("gy",go.type))           ret=Yes;
	else if (bit(cfg.infomode,3))			  ret=Yes;
	else if (count==0)						  printf("\n### ÇØ´çµÇ´Â È­ÀÏÀÌ ¾ø½À´Ï´Ù.");
	else if (club_mode&&pf.type>14) 		  ret=Yes;	//µ¿È£È¸ÀÇ °æ¿ì ¿î¿µÁø ÀÌ»ó ¹«½Ã
	else if (bcfg.fread>0&&pf.type>=bcfg.fread) ret=Yes;  //ÀÚÀ¯´Ù¿îµî±Þ
	else if (bcfg.fread==99)				  ret=Yes;	//ÀÚÀ¯´Ù¿îµî±Þ
	else if (check_type('i'))                 ret=No; //¸Þ´º °¡´É µî±ÞÈ®ÀÎ
	else if (check_type('r'))                 ret=No; //¸Þ´º °¡´É µî±ÞÈ®ÀÎ
	else ret=Yes;
	if (!ret) goto _fail;

	if (mode==3) {
		view_text(filename2);
		unlink(filename2);
	}
	else {
		set_stat(8,bbs.title);	   //´Ù¿îÁßÀÓ
		sz_file(filename2);
	}
	bbsdownnum++;
	goto _end;

	_fail:
	view("forum/main/frm/down/downfaib.log");
	bbs=oldbbs;
	ret=No;
	goto _end;

	_end:
	bbs=oldbbs;
	rm_tmpup();
	return (ret);
}




//ÀÚ·á½Ç´Ù¿î
//multi_down ÀÌÀúÁ¤ µÇ¸é ¸ÖÆ¼´Ù¿î °¡´É
pds_down(int mode)
{
	FILE *fp;
	char buff[500];
	char buff2[500];
	char TNOW_FILE[300];
	char TNOW_FILED[300];
	char newdir[500];
	char adnfile[102][500];
	char filename[500];
	char newfile[500];
	BBS oldbbs,bbs2;
	GO	oldgo,oldgo2,old_club;
	int old_clubmode,count;
	int old_down=pf.down;
	int i,n,i2,key,ret,tsize;
	int from_userroom=No;	//»ç¿ëÀÚ¿µ¿ªÀÏ¶§
	int to_userroom=No;   //»ç¿ëÀÚ¿µ¿ªÀ¸·Î Àü¼Û
	int mult_down=No;	//´ÙÁß´Ù¿îÀÏ¶§
	int rz_mode=0,fail=No;
	time_t old_t,now_t;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[100];
	char query[1000];

	oldgo=go;
	oldbbs=bbs;
	strcpy(TNOW_FILE ,NOW_FILE);
	strcpy(TNOW_FILED,NOW_FILED);

	if (pf.type<18&&!club_mode&&view("forum/main/frm/down/nodnmain.log")) goto _fail;
	if (pf.type<18&& club_mode&&view("forum/main/frm/down/nodnclub.log")) goto _fail;

	ret=No;
	re_print=Yes;
	key=No; 													 //ÀÎÅÍ³Ý¶óÀÎ

	sprintf(buff,"%s/logo/%s.ndn",club_go.dir,go.code);
	if (is_file(buff)) {view(buff);goto _fail;}
	sprintf(buff,"%s/logo/all.ndn",club_go.dir);
	if (is_file(buff)) {view(buff);goto _fail;}

	view("%s/logo/%s.dow",club_go.dir,go.code);
	if (!view("%s/frm/down/down.log",club_go.dir)) view("forum/main/frm/down/down.log");

	//»ç¿ëÀÚ¿µ¿ªÀÏ¶§
	from_userroom=No;	 //»ç¿ëÀÚ¿µ¿ªÀ¸·Î Àü¼Û
	if (is_same(go.code,"userroom")) from_userroom=Yes;
	//È­¸é Ãâ·Â¸ðµåÀÏ¶§ dn¸¸ ´©¸§
	if (list_mode&&mmn[1]==0) mmn[1]=bbs.num;

	if (mmn[1]==0) {
		_input2:
		view("forum/main/frm/down/nonum.log");
		lineinput(buff,160);
		check_cmd(buff);
		if (mmn[1]==0) {
			view("forum/main/frm/down/nonum.err");
			if (yesno2("",Yes)==No) goto _input2;
			goto _fail;
		}
	}

	count=0;  //´Ù¿î¹ÞÀ» È­ÀÏ¼ö
	tsize=0;  //´Ù¿î¹Þ´Â ¿ë·®
	to_userroom=No;   //»ç¿ëÀÚ¿µ¿ªÀ¸·Î Àü¼Û
	mult_down=Yes;	  //´ÙÁß´Ù¿îÀÏ¶§


	del_space(go.dir);if (strlen(go.dir)==0) strcpy(go.dir,".");
	del_space(club_go.dir);if (strlen(club_go.dir)==0) strcpy(club_go.dir,".");

	view("forum/main/frm/down/title.log");
	for (i=0;i<100;i++) {
		bzero(abbs[i].id	  ,sizeof(abbs[i].id	  ));
		bzero(abbs[i].name	  ,sizeof(abbs[i].name	  ));
		bzero(abbs[i].filename,sizeof(abbs[i].filename));
		bzero(abbs[i].title   ,sizeof(abbs[i].title   ));
		bzero(adnfile[i],sizeof(adnfile[i]));
	}

	if (read_pf2(pf.id)) pf.down=pf2.down;

	if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 4101: %s\n",mysql_error(sock));
		exit(1);
	}
	if ((mysql_select_db(sock,DB_CM)) == -1) {
		printf("## ERR 4102: %s\n",mysql_error(sock));
		exit(1);
	}


	count=0;

	for (i=0;i<100;i++) {
		if (mmn[i]<1) continue;
		sprintf(table_name,"%s_%s",club_go.code,go.code);
		sprintf(query,"SELECT * FROM %s where num=%d and del!='D'",table_name,mmn[i]);
		mysql_query(sock, query);
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))==NULL) {
			mysql_free_result(qres);
			printf("##  %d ¹ø °Ô½Ã¹°À» ÀÐÀ»¼ö ¾ø½À´Ï´Ù.\n",mmn[i]);
			continue;
		}
		mysql_free_result(qres);
		qrow2bbs(qrow);

		strcpy(filename,"");
		if (is_same(go.code,"userroom")) sprintf(filename,"userroom/%s/%s/%s",c_han(pf.id),pf.id,bbs.filename);
		else sprintf(filename,"pds/%s/%s/%s.%x",club_go.code,go.code,bbs.filename,bbs.fcount);
		del_space(filename);del_esc3(filename);
//		  mess("%d %s %s %d",bbs.num,bbs.filename,filename,is_file(filename));


		if (strlen(bbs.filename)<1)  printf("            %d¹ø ->ºó ÆÄÀÏ\n",mmn[i]);
		else if (!is_file(filename)) printf("            %d¹ø ->¾ø´Â ÆÄÀÏ(%s)\n",mmn[i],filename);
		else {
			abbs[count]=bbs;
			strcpy(adnfile[count],filename);
			sprintf(g_buff1,"%3d",count+1);
			sprintf(g_buff2,adnfile[count]);

			if (mode!=2) view("forum/main/frm/down/downlist.log");
			tsize+=bbs.filesize;
			count++;
			if (pf.type<18&&(cfg.dn_mult_limit>0||bcfg.dn_mult_limit>0)) {
				if ( (cfg.dn_mult_limit>0&&count>cfg.dn_mult_limit)||
					 (bcfg.dn_mult_limit>0&&count>bcfg.dn_mult_limit) ) {
					view("forum/main/frm/down/dn_mult.log");
					break;
				}
			}
		}
	}

	if (count<1) goto _fail;
	if (count>1) {
		sprintf(g_buff1,"%3d",count);
		sprintf(g_buff2,"%10d",tsize);
		if (mode!=2)
		view("forum/main/frm/down/downsum.log");
	}

	//´Ù¿îºÒ°¡´É Á¶°Ç
	if (guest_mode)   pf.down=100000000;
	ret=No;
		 if (is_char("gy",go.type))             ret=Yes;
	else if (guest_mode&&!bit(cfg.downmode,6))	printf("\n### ¼Õ´ÔÀº ´Ù¿î¹ÞÀ»¼ö ¾ø½À´Ï´Ù.");
	else if (count==0)							printf("\n### ÇØ´çµÇ´Â È­ÀÏÀÌ ¾ø½À´Ï´Ù.");
	else if (tsize==0)							printf("\n### È­ÀÏÀÇ Å©±â°¡ 0ÀÔ´Ï´Ù.");
	else if (club_mode&&pf.type>14) 			ret=Yes;  //µ¿È£È¸ÀÇ °æ¿ì ¿î¿µÁø ÀÌ»ó ¹«½Ã
	else if (from_userroom) 					ret=Yes;  //»ç¿ëÀÚ¿µ¿ª¿¡¼­´Â ¹«Á¶°Ç ok
	else if (!club_mode&&pf.type>=15&&go.type=='u')  ret=Yes;  //¹«Á¶°Ç ´Ù¿î
	else if (club_mode&&cpf.type>=15&&go.type=='u')  ret=Yes;  //¹«Á¶°Ç ´Ù¿î
	else if (go.type=='u')                      printf("µî·ÏÀü¿ëÀÚ·á½Ç¿¡¼± ´Ù¿îÀÌ µÇÁö ¾Ê½À´Ï´Ù.");  //ÀÚÀ¯´Ù¿î¸ðµå¿¡¼­´Â ¹«Á¶°Ç ´Ù¿î
	else if (bcfg.fdown>0&&pf.type>=bcfg.fdown) ret=Yes;  //ÀÚÀ¯´Ù¿îµî±Þ
	else if (bcfg.fdown==99)					ret=Yes;  //ÀÚÀ¯´Ù¿îµî±Þ
	else if (check_type('i'))                   ret=No; //¸Þ´º °¡´É µî±ÞÈ®ÀÎ
	else if (check_type('d'))                   ret=No; //¸Þ´º °¡´É µî±ÞÈ®ÀÎ
	else if (pf.type<cfg.downfree&&(pf.down<=0||pf.down<tsize)) printf("\n### %s´ÔÀÇ ´Ù¿î°¡´ÉÇÑ ¿ë·®( %d KB) À» ÃÊ°úÇÕ´Ï´Ù.",pf.id,pf.down/1024);
	else ret=Yes;

	if (!ret) {
		goto _fail;
	}

	//¸ÖÆ¼´Ù¿î°¡´É ¿©ºÎ?
	//È¸¿ø±¸ºÐº° ´Ù¿î/¾÷ÀÌ ÁöÁ¤µÇ¾î ÀÖ´Ù.
	mult_down=Yes;	  //¸ÖÆ¼´Ù¿î°¡´ÉÇÏ´Ù.
	to_userroom=No;
		 if (count<2) ;
	else if (!club_mode&&bcfg.fdown>0&&pf.type>=bcfg.fdown) ;
	else if (pf.type>=14||now_type>=14) ;
	else if (cfg.downmult);
	else if (from_userroom);
	else if (go.type=='y');          //ÀÚÀ¯´Ù¿î¸ðµå¿¡¼­´Â ¹«Á¶°Ç ´Ù¿î
	else if (go.type=='g');          //ÀÚÀ¯´Ù¿î¸ðµå¿¡¼­´Â ¹«Á¶°Ç ´Ù¿î
	else if (pf.down>100000000);	 //100¸Þ°¡ ÀÌ»óÀÏ¶§ ¹«Á¶°Ç ´Ù¿î
	else mult_down=No;				 //¸ÖÆ¼´Ù¿îºÒ°¡´É
	if (guest_mode&&from_userroom) ret=No;
	if (guest_mode&&to_userroom)   to_userroom=No;

	if (!ret) {
		goto _fail;
	}

	//ÀÚ·á½Ç ÇÁ·ÎÅäÄÝ ¼±ÅÃ
	i2=1;
	if (mode!=2) {
		strcpy(g_buff4,pf.type==19?"9.DNS  ":"");
		if (from_userroom) view("forum/main/frm/down/selectu.log");
		else view("forum/main/frm/down/selectp.log");
		lineinput(buff,4);check_han(buff);printf("\n");
		i2=atoi(buff);
	}
	if (i2==0&&strlen(buff)==1) {
		goto _fail;
	}
	if (guest_mode&&i2==3) i2=1;
	if (from_userroom&&i2==3) i2=1;

	set_stat(8,bbs.title);	   //´Ù¿îÁßÀÓ
	if (mode!=2)
	view("forum/main/frm/down/wait.log");
	for (i=0;i<100;i++) {
		if (abbs[i].num>0) {
			sprintf(query,"update %s set down=down+1 where num=%d",table_name,abbs[i].num);
			if (mysql_query(sock, query) == -1) {
				printf("## ERR 4104: %s\n%s\n",mysql_error(sock),query);
				continue;
			}
		}
	}

	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	sys_tem("rm -rf %s",newdir);
	check_dir(newdir);
	if (i2==9&&pf.type==19) {	 //ÁöÁ¤µð·ºÅä¸®¿¡ º¹»ç
		char   DEF_UPS[81];    // UPS ±âº»DIR
		char   DEF_DNS[51];    // DNS ±âº»DIR
		_cont4:
		view("forum/main/frm/down/dns.log");
		lineinput(DEF_DNS,50);check_han(DEF_DNS);printf("\n");
		if (strlen(DEF_DNS)<2) goto _fail;
		if (!is_dir(DEF_DNS)||in_file2("system/cannot.dir",DEF_DNS)) {
			printf(" µð·ºÅä¸®¸¦ Ã£À»¼ö ¾ø½À´Ï´Ù.\n");
			goto _cont4;
		}
		for (i=0;i<100;i++) {
			bbs=abbs[i];
			if (strlen(adnfile[i])>0&&is_file(adnfile[i])) {
				sys_tem("cp -f %s %s/%s",adnfile[i],DEF_DNS,bbs.filename);
			}
		}
		view("forum/main/frm/down/downok.log");
		goto _done;
	}
	else {		//ÀÏ¹Ý´Ù¿îÀÏ¶§
		count=0;
		for (i=0;i<100;i++) {
			bbs=abbs[i];
			if (strlen(adnfile[i])<1) continue;
			if (strlen(bbs.filename)>12) bbs.filename[12]=0;
//			  n=sys_tem("ln -sf %s %s/%s",adnfile[i],newdir,bbs.filename);
			sys_tem("cp -f %s %s/%s",adnfile[i],newdir,bbs.filename);
			printf(".");fflush(NULL);
			count++;
		}
		sprintf(buff,"ÃÑ%d°Ç",count);
		if (mode!=2)
		printf("[80D[2K");
		sprintf(buff,"tmp/up%d%s/*",cfg.hostno,no_spc(tty));
		view("forum/main/frm/down/zmodem.log");
		n=sz(buff);
		//´Ù¿îÃë¼Ò½Ã
		if (n!=0&&bit(cfg.downmode,16)==0) {
			view("forum/main/frm/down/down.err");
			goto _fail;
		}
		if (mode!=2)
		view("forum/main/frm/down/downok.log");
		goto _done;
	}

	_fail:
	view("forum/main/frm/down/downfaip.log");
	bbs=oldbbs;
	ret=No;
	goto _end;

	_done:

	ret=Yes;
	if (bit(cfg.downmode,12)==0) {
		if (view("forum/main/frm/down/downstop.log")) {
			while (1) {
				printf("7");
				lineinput9(buff,20,6);
				if (stristr(buff,"^B0")||stristr(buff,"rz")||stristr(buff,"*B0")) {printf("7");continue;}
				break;
			}
			printf("\n");
		}
	}
	goto _end;

	_end:


	strcpy(NOW_FILE ,TNOW_FILE);
	strcpy(NOW_FILED,TNOW_FILED);
	bbs=oldbbs;
	go=oldgo;
	set_stat(1,"");     //´Ù¿îÁß ÇØÁ¦
	rm_tmpup();
	return (ret);
}


//ÇöÀç °Ô½ÃÆÇÀÇ ³»¿ëÀ» Àü¼ÛÇÑ´Ù.
bdn()
{
	char buff[300];
	char bdn_file[300];
	sprintf(bdn_file,"%s/logo/%s.bdn",club_go.code,go.code);
	if (pf.type>=18);
	else if (bit(bcfg.downmode,20));
	else if (is_char(go.wtimes,'#'));
	else if (in_file2("system/bdn_id.dat",pf.id));
	else if (in_file2(bdn_file,pf.id));
	else {
		mess(" BDN ±â´ÉÀ» »ç¿ëÇÒ¼ö ¾ø½À´Ï´Ù.");
		return;
	}
	sys_tem("bin/bdn '%s' '%s' '%s'",go.code,club_go.code,pf.id);
	re_print=Yes;
}


//´Ù¿î¿ë·®Áõ°¡ ½ÃÅ´  ¾÷/Àû±â ½Ã  mode 1:Áõ°¡ -1:°¨¼Ò
bbs_down_up(int tsize,char *tid,int mode)
{
	int i,olddown;
	PF pf3,oldpf;
	char buff1[30],buff2[30],buff3[30];

	oldpf=pf;
	if (guest_mode) 		 return;
	if (pf.type<1)			return;
	if (bcfg.fdown>0&&pf.type>=bcfg.fdown) return;	 //ÀÚÀ¯´Ù¿î°¡´ÉÀÚÀÏ¶§
	olddown=pf.down;
	if (mode==-1)  {	 //°¨¼âÀÏ¶§ (ÀÚ·á »èÁ¦½Ã)
		pf.down  -=(tsize*cfg.drate)/10;   //°¡»ê´Ù¿î¿ë·® Á¶Á¤
	}
	else {
		if (cfg.urate >0) tsize=(tsize*cfg.urate )/10;	  //µî·Ï½Ã ºñÀ²
		if (bcfg.uratet>0&&in_hour(bcfg.uhour1,bcfg.uhour2)) tsize=(tsize*bcfg.uratet)/10;	//½É¾ßµî·Ï½Ã ºñÀ²
		else if (bcfg.urate>0) tsize=(tsize*bcfg.urate)/10; 								//ÀÏ¹Ýµî·Ï½Ã ºñÀ²
		pf.down  +=tsize;
	}
	if (!guest_mode) {
		MYSQL	  *sock,mysql;
		MYSQL_RES *qres;
		MYSQL_ROW qrow;
		char query[500];
		sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
		mysql_select_db(sock,DB_NAME);

		if (is_typepds) sprintf(query,"update user set countu=countu+1,down=down+'%d' WHERE id='%s'",tsize,pf.id);
		else			sprintf(query,"update user set countw=countw+1,down=down+'%d' WHERE id='%s'",tsize,pf.id);
		mysql_query(sock, query);
		mysql_close(sock);
	}
}


//´Ù¿î¿ë·®°¨¼Ò
bbs_down_down(int tsize)
{
	int fdown=No,olddown;
	PF oldpf;
	char buff1[30],buff2[30],buff3[30];
	oldpf=pf;
	if (guest_mode) 			return;
	if (!is_typepds) return;
	if (bbs_man(pf.id)) 		return;
	if (stristr(go.code,"mail")||stristr(go.code,"mbox")) return;

	olddown=pf.down;
	if (is_char("yg",go.type)||pf.type>=cfg.downfree)   fdown=Yes;
	if (cfg.drate >0) tsize=(tsize*cfg.drate )/10;	  //´Ù¿î½Ã ºñÀ²
	if (bcfg.dratet>0&&in_hour(bcfg.dhour1,bcfg.dhour2)) tsize=(tsize*bcfg.dratet)/10;	//½É¾ß´Ù¿î½Ã ºñÀ²
	else if (bcfg.drate>0) tsize=(tsize*bcfg.drate)/10;    //´Ù¿î½Ã ºñÀ²			  //ÀÏ¹Ý´Ù¿î½Ã ºñÀ²
	if (pf.type>0&&!fdown)	pf.down-=tsize ; //°¡»ê´Ù¿î¿ë·® Á¶Á¤
	if (pf.down<0)			pf.down=0;
	pf.countd++;
	if (!guest_mode) {
		MYSQL	  *sock,mysql;
		MYSQL_RES *qres;
		MYSQL_ROW qrow;
		char query[500];
		sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
		mysql_select_db(sock,DB_NAME);
		sprintf(query,"update user set down=down-'%d' WHERE id='%s'",tsize,pf.id);
		mysql_query(sock, query);
		mysql_close(sock);
	}
}


set_tag_down(int mode)
{
	FILE *fp;
	int i,n,count=0;
	char filename[100];

	for (n=0;n<20;n++) {
		sprintf(filename,"user/moni/moni%d.dat",n);
		if ((fp=fopen(filename, "r"))==NULL) continue;
		while (fread(&moni,sizeof_moni,1,fp)) {
			if (moni.mode<1||strlen(moni.id)<3||strlen(moni.tty)<1) continue;
			if(moni.mode<1||strlen(moni.tty)<1||strlen(moni.id)<1) continue;
				 if (mode==3&&moni.mode==6) count++;   //¾÷¼ö
			else if (mode==4&&moni.mode==8) count++;   //´Ù¿î¼ö
			else if (mode==5&&moni.mode==6&&is_same(moni.club,club_go.code)&&is_same(moni.gocode,go.code)) count++;   //¾÷¼ö
			else if (mode==6&&moni.mode==8&&is_same(moni.club,club_go.code)&&is_same(moni.gocode,go.code)) count++;   //´Ù¿î¼ö
			else break;
		}
		fclose(fp);
	}
	return count;
}


