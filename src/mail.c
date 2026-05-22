#include "bbs.h"

//øÓøµ¡¯ø°∞‘ ∫∏≥ª±‚
do_sysmail(int mode)
{
	int i;
	int ret=No;
	char buff[100];
	if (guest_mode) return;
	if (mode==2) strcpy(buff,cfg.sysop);
	else if (mode==3) strcpy(buff,ccfg.sysop);
	else strcpy(buff,go.dir);
	del_space(buff);del_esc(buff);buff[20]=0;
	if (strlen(buff)>2&&read_pf2(buff)&&pf2.type>0) {
		printf("\n %s(%s)¥‘ ø°∞‘ ∏ﬁ¿œ¿ª ∫∏≥ª∞⁄Ω¿¥œ±Ó? ",pf2.id,pf2.name);
		if (yesno("(Y/n)>>",Yes)) {
			printf("\n ***  [ %s(%s)¥‘ ºˆΩ≈∏ﬁ¿œ ]  ***\n",pf2.id,pf2.name);
			for(i=0;i<10;i++) strcpy(mmc[i],"");
			strcpy(mmc[1],pf2.id);
			wmail(1,pf2.id);
		}
	}
}


wmail(int wmode,char *tidstr)
{
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char body[BODY_MAX];
	char table_name[100],query[BODY_MAX+500];

	FILE *fp1,*fp2;
    char abook[1000][41]; //¡÷º“∑œø°º≠ ªÃæ∆≥Ω æ∆¿Ãµ
	PF apf[50]; 	 //¡÷º“∑œø°º≠¿« æ∆¿Ãµ ¿˙¿Â (Ω«¡¶ πﬂº€∞°¥…æ∆¿Ãµ)
	PF oldpf;
	int i,i2,n,nn=0;
    char ch,buff2[1000],mailcode[30];
	int mailnum=0;
	int key,ret,found;
	char mailid[1000];
	char mailid2[500];
	char tid[50],filename[500],filename2[500];
    char buff[5000],buff1[1500],stemp[9];      //∞Ì¿Øπ¯»£
	char file_send=No;
	GO oldgo=go;
	GO oldclub_go=club_go;
	int oldclub_mode=club_mode;
	BBS oldbbs=bbs;
	char oldname[500],newname[500],dir[500];

	strcpy(tid,tidstr);
	re_print=Yes;			   //»≠∏È√‚∑¬
	re_logo=Yes;			   //∫∏¡∂»≠∏È√‚∑¬
	re_bbs=Yes; 			   //∞‘Ω√∆«∑Œµ˘
	list_mode=No;
	key=Yes;
	ret=Yes;
	unlink(TMP_FILE2);			//¿”Ω√»≠¿œ ªË¡¶
	if (wmode==2&&strlen(tid)>0) {
		if (bit(cfg.mailmode,10)) {wmode=1;goto _cont1;}
		bbs2tmp();	  //«ˆ¿ÁBBS¿« ≥ªøÎ¿ª TMP∑Œ ¿˙¿Â
		if ((fp1=fopen(TMP_FILE,"r"))==NULL) goto _cont1;
		if ((fp2=fopen(TMP_FILE2,"w"))==NULL) goto _cont1;
		fprintf(fp2,"> ∫∏≥Ω¿Ã:%s\n",bbs.id);
		fprintf(fp2,"> πﬁ¥¬¿Ã:%s\n",pf.id);
		fprintf(fp2,"> ≥Ø  ¬•:%s\n",datestr(33,bbs.date));
		fprintf(fp2,"> ¡¶  ∏Ò:%s\n",bbs.title);
		while(fgets(buff,1000,fp1)) {
			fprintf(fp2,"> %s",buff);
		}
		fprintf(fp2,"\n");
		fclose(fp1);
		fclose(fp2);
	}
	_cont1:
	unlink(TMP_FILE);		   //¿”Ω√»≠¿œ ªË¡¶

	if (!is_same(go.code,"wmail")) {
		go_top(0);
		go_code("wmail");
	}
	strcpy(mailid2,"");

	set_stat(9,"");
	if (strlen(tid)<1) strcpy(tid,mmc[1]);
	strcpy(mailid,"");if (strlen(tid)>0) strcpy(mailid,tid);
	if (is_same(mailid,"wmail")||is_same(mailid,"rmail")) strcpy(mailid,mmc[2]);
	if (is_same(mailid,"wmail")||is_same(mailid,"rmail")) strcpy(mailid,"");
	strchng2(mailid,"£¿","@");
	strchng2(mailid,"££","#");
	if (mailid[0]=='#'&&!guest_mode) goto _cont3;
	if (stristr(go.wtimes,"e")) view("forum/main/frm/mail/wemail.log");
	else						view("forum/main/frm/mail/wmail.log");

	_err1:
	view("forum/main/frm/mail/mailid1.log");
	if (strlen(mailid)<3) lineinput(mailid,301);
	else				  printf("%s",mailid);
	printf("\n");
	check_han(mailid);all_trim(mailid);
	if (is_same(mailid,"p")||is_same(mailid,"pp")||
		is_same(mailid,"x")||is_same(mailid,"xx")) goto _fail;
	if (strlen(mailid)<2) goto _fail;
	strchng2(mailid,";"," ");
	strchng2(mailid,","," ");
	sscanf(mailid,"%s",buff);
	xstrncpy(g_id,buff,50);
    if (buff[0]!='#'&&buff[0]!='@') {
		if (!read_pf2(buff)) {
			view("forum/main/frm/mail/mailid1.err");
			strcpy(mailid,"");
			goto _err1;
		}
		printf("        %s(%s)\n",pf2.id,pf2.name);
	}

	if (view("forum/main/frm/mail/mailid2.log")) {         //¬¸¡∂
		lineinput(mailid2,490);printf("\n");check_han(buff);
		if (is_quit(mailid2)) goto _fail;
		if (strlen(mailid2)<3) strcpy(mailid2,"");
	}

	_cont3:
    bzero(&abook,sizeof(abook));
	mailnum=0;

    //¡÷º“∑œ¿Œ∞°?
    if (mailid[0]=='#'||mailid[0]=='@') {
        if (guest_mode) {mess("º’¥‘¿∫ ¡÷º“∑œ¿ª ªÁøÎ«“ºˆ æ¯Ω¿¥œ¥Ÿ.");return;}
        if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
            printf("## ERR 2101: %s\n",mysql_error(&mysql));
            return;
        }
        if ((mysql_select_db(sock, DB_NAME)) == -1) {
            printf("## ERR 2102: %s\n",mysql_error(sock));
            mysql_close(sock);
            return;
        }
        strcpy(mailcode,&mailid[1]);
        sprintf(query,"SELECT data FROM book where id='%s' and code='%s'",pf.id,mailcode);
		if (mysql_query(sock, query) == -1) {
            mess("%s ¡÷º“∑œ¿Ã æ¯Ω¿¥œ¥Ÿ.",mailcode);
            return;
		}
        qres = mysql_store_result(sock);
        if ((qrow = mysql_fetch_row(qres))==NULL) return;
        strcpy(buff,qrow[0]);
        nn=0;
        bzero(buff2,1000);
        for (i=0;i<(int)strlen(buff)&&mailnum<500;i++) {
            ch=buff[i];
            if (ch==' '||ch=='\n'||strlen(buff2)>40) {
                if (strlen(buff2)>0) xstrncpy(abook[mailnum++],buff2,50);
                bzero(buff2,1000);
                nn=0;
            }
            else buff2[nn++]=ch;
        }
        //printf("%s %s",mailcode,buff);pressenter();

		printf("\n");
        if (mailnum<1) mess("%s ¡÷º“∑œø° ¿‘∑¬µ» æ∆¿Ãµ∞° æ¯Ω¿¥œ¥Ÿ.",mailcode);
	}
	else {			 //¡÷º“∑œ¿Ã æ∆¥“∂ß 1∏Ì¿∏∑Œ ¡ˆ¡§«—¥Ÿ.
		strcat(mailid," ");
		strcat(mailid,mailid2);
		strchng2(mailid,";"," ");
		strchng2(mailid,","," ");
		strchng2(mailid,"    "," ");
		strchng2(mailid,"   "," ");
		strchng2(mailid,"  "," ");
		strchng2(mailid,"  "," ");
		i2=0;
		check_cmd(mailid);
        for (i=0;i2<10&&mailnum<500;i2++) {
			if (strlen(mmc[i])>2)
				strcpy(abook[mailnum++],mmc[i]);
		}
	}
	if (mailnum<1) {
		mess("º±≈√µ» ID∞° æ¯Ω¿¥œ¥Ÿ.");
		goto _fail;
	}

	for (n=0;n<mailnum;n++) {
        for (i=1;i<n;i++) {
            if (is_same(abook[n],abook[i])) strcpy(abook[n],"");
        }
		strcpy(mailid,abook[n]);		//√ππ¯¬∞ ∏ﬁ¿œπﬁ¿ª æ∆¿Ãµ
        if (strlen(mailid)<3) {strcpy(abook[n],"");continue;}
        if (stristr(mailid,"@")) continue;  //E∏ﬁ¿œ∞ÊøÏ »Æ¿Œæ»«‘
		if (strlen(mailid)<3||stristr(mailid,"@")) continue;  //E∏ﬁ¿œ∞ÊøÏ »Æ¿Œæ»«‘
		abook[n][8]=0;
		mailid[8]=0;
		nn=0;
		found=read_pf2(mailid); 	//æ∆¿Ãµ √£±‚
		if (found==No||pf2.type<1) {
            if (pf2.type<2)   printf("%s¥‘¿∫ ªË¡¶µ» ID¿‘¥œ¥Ÿ.\n",mailid);
			else			  printf("%s∂Û¥¬ æ∆¿Ãµ∞° æ¯Ω¿¥œ¥Ÿ.\n",mailid);
			//«ˆ¿Á¿« ∏ﬁ¿œ¡÷º“∑œ¿« ¿ßƒ°∏¶ ªË¡¶«—¥Ÿ.
			strcpy(abook[n],"");
		}
	}

	mailnum=0;
    for (n=0;n<500;n++) {
		found=No;
		for (i=n-1;n>0&&i>=0;i--) {
			if (is_same(abook[n],abook[i])) {
				found=Yes;
				break;
			}
		}
		if (found||strlen(abook[n])<3) {
            for (i=n;i<499;i++) {
				strcpy(abook[i],abook[i+1]);
                strcpy(abook[499],"");
			}
		}
		else mailnum++;
	}
    if (mailnum>0) {
        printf(" ∏ﬁ¿œ ºˆΩ≈¿⁄:\n");
        for (n=0;n<mailnum;n++) {
            printf("%d.%s ",n+1,abook[n]);
        }
        printf("\n");
    }
    if (mailnum<1) {
        printf(" º±≈√µ» ∏ﬁ¿œºˆΩ≈ ID ∞° æ¯Ω¿¥œ¥Ÿ.\n");
        goto _fail;
    }

	view("forum/main/frm/mail/write.log");

	n=5;
	strcpy(bbs.title,"");
	strcpy(bbs.keyword,"");
	strcpy(bbs.filename,"");
	bbs.filesize=0;
	while (--n) {
		view("forum/main/frm/mail/writet.log");
        lineinput(bbs.title,40);printf("\n");
		all_trim(bbs.title);
		if (bbs.title[0]==0) continue;
		if (is_same(bbs.title,"q")||is_same(bbs.title,"p")||
			is_same(bbs.title,"x")||is_same(bbs.title,"xx")) strcpy(bbs.title,"");
		break;
	}
	if (bbs.title[0]==0) goto _fail;   //√Îº“Ω√
	if (wmode==98) goto _cont4;

	unlink(TMP_FILE);
	if (wmode!=2) unlink(TMP_FILE2);

	_input1:
	strcpy(g_buff4,pf.type>=18?"99.UPS":"");

	view("forum/main/frm/mail/select.log");
	lineinput(buff,2);check_han(buff);printf("\n");
	if (is_same(buff,"q")||is_same(buff,"n")||is_same(buff,"0")) goto _fail;
	n=atoi(buff);
	if (n==2)  {
		if (wmode==2) view(TMP_FILE2);
		ret=bbs_editor(2);
		if (!is_file(TMP_FILE)) ret=No;
		if (wmode==2) {file_add(TMP_FILE2,TMP_FILE);file_move(TMP_FILE2,TMP_FILE);}
	}
	else if (wmode==98) ;
	else if (n==3||n==4||(pf.type>=19&&n==99)) {	  //∆ƒ¿œ¿¸º€Ω√
		if (n!=99) {
			view("forum/main/frm/mail/selectb.log");
			lineinput(buff,2);check_han(buff);printf("\n");
			if (is_same(buff,"q")||is_same(buff,"n")||is_same(buff,"0")) goto _fail;
			i=atoi(buff);
		}

		if (i==2) strcpy(bbs.keyword,"vtx");  //vtx
		else if (i==3); 				  //øœº∫«¸TEXT
		else i=1;						  //πŸ¿Ã≥ ∏Æ ¿¸º€

		if (n==99) {
			ret=up_file(99,filename,No);
			i=1;
		}
		else  ret=up_file( 1,filename,No);		//zmodem

		if (!ret) goto _fail;

		if (i==1&&is_file(filename)) {			//∆ƒ¿œ¿¸º€¿«∞ÊøÏ
			file_send=Yes;
			bbs.filesize=file_size(filename);
			str_filedir(filename,buff1,buff);  //buff∏¶ µ∑∫≈‰∏ÆøÕ ∆ƒ¿œ∏Ì¿∏∑Œ ∫–«ÿ
			del_space(buff);
			xstrncpy(bbs.filename,buff,30);
			ret=Yes;

		}
		else if ((i==2||i==3)&&is_file(filename)) {  //≥ªøÎ¿¸º€¿«∞ÊøÏ
			file_copy(filename,TMP_FILE);
		}
		else {
			ret=No;
			goto _fail;
		}
	}
	else {		//πÆº≠∆Ì¡˝
		set_stat(9,"");
		if (wmode==2) {
			file_move(TMP_FILE2,TMP_FILE);
			ret=bbs_editor(11); 	//TMPªË¡¶æ»«‘
		}
		else ret=bbs_editor(1);
		if (!ret||!is_file(TMP_FILE)) goto _input1;   //√Îº“Ω√
	}

	_cont4:

	if (!file_send&&(!ret||!is_file(TMP_FILE))) goto _fail;   //√Îº“Ω√

	if (strlen(bbs.keyword)<1) {
		view("forum/main/frm/mail/selecty.log");
		lineinput(buff,2);check_han(buff);printf("\n");
		if (is_same(buff,"q")||is_same(buff,"n")||is_same(buff,"0")) goto _fail;
		i=atoi(buff);
			 if (i==2) strcpy(bbs.keyword,"¥‰ø‰");
		else if (i==3) strcpy(bbs.keyword,"¡ˆø¨");
		else if (i==4) strcpy(bbs.keyword,"¥‰¡ˆ");
		else strcpy(bbs.keyword,"");
	}

	//πﬂº€»Æ¿Œ
	printf("\n");
	printf(" ¡¶∏Ò : %s\n",bbs.title);
	printf(" ºˆΩ≈ : %s(%s)",pf2.id,pf2.name);
	if (mailnum>1) printf("∆˜«‘ √—%d∏Ì",mailnum);
	printf("\n");
	printf(" ¡æ∑˘ : ");
		 if (is_same(bbs.keyword,"¥‰ø‰")) printf("¥‰¿Âø‰∏¡");
	else if (is_same(bbs.keyword,"¡ˆø¨")) printf("¡ˆø¨∆Ì¡ˆ");
	else if (is_same(bbs.keyword,"¥‰¡ˆ")) printf("¥‰¿Â+¡ˆø¨");
	else if (is_same(bbs.keyword,"vtx"))  printf("VTX∆Ì¡ˆ");
	else if (is_same(bbs.keyword,"ƒ´µÂ")) printf("ƒ´µÂ∆Ì¡ˆ");
	else							  printf("¿œπ›∆Ì¡ˆ");

	printf("\n");
	if (file_send)
	printf(" »≠¿œ∏Ì : %s  ≈©±‚ : %d πŸ¿Ã∆Æ\n",bbs.filename,bbs.filesize);
	view("forum/main/frm/mail/selecto.log");
	set_stat(9,"");
	lineinput(buff,2);check_han(buff);printf("\n");
	if (is_same(buff,"q")||is_same(buff,"n")||is_same(buff,"0")) goto _fail;
	i=atoi(buff);

	strcpy(bbs.id,pf.id);		//πﬂΩ≈¿Œ
	strcpy(bbs.name,pf.name);	//πﬂΩ≈¿⁄
	strcpy(bbs.tcode,"mail");   //∆Ì¡ˆ∫–∑˘
	time(&bbs.date);			//πﬂΩ≈ ≥Ø¬• ¿˙¿Â
	strcpy(bbs.passwd,"");
	bbs.date2=0;				//¿–¿∫ ≥Ø¬• ¿˙¿Â (ºˆΩ≈ø©∫Œ)
	bbs.hits=0;
	bbs.down=0;
	bbs.ok=0;

	view("forum/main/frm/mail/send1.log");
    strcpy(db_name,DB_MAIL);

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 3201: %s\n",mysql_error(sock));
		return;
	}
    if ((mysql_select_db(sock,DB_MAIL)) == -1) {
		printf("## ERR 3202: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
	strcpy(bbs.userip,hostname);
	//≥ªøÎ -> body ø° ¿˙¿Â
	bzero(body,BODY_MAX);
	if ((fp1=fopen(TMP_FILE,"r"))!=NULL) {          //¿”Ω√¿€º∫»≠¿œ
		char c;
		i=0;
		while (i<BODY_MAX&&(c=fgetc(fp1))!=EOF) {
			if (c==0) break;
			if (c=='\n') bbs.line++;  //¡Ÿºˆ ∞ËªÍ
			if (c=='\\'||c=='\''||c=='\"') body[i++]='\\';
			body[i++]=c;
		}
		bbs.size=i;
		fclose(fp1);
	}
	unlink(TMP_FILE);		   //¿”Ω√»≠¿œ ªË¡¶

	if (strlen(bbs.filename)) {
		_same_file:
		bbs.fcount=rand();
		sprintf(newname,"mailbin/%s.%x",bbs.filename,bbs.fcount);
		if (is_file(newname)) {
			goto _same_file;
		}
		sys_tem("cp -f '%s' '%s'",filename,newname);
		rm_tmpup();
	}

	//∏ﬁ¿œ¿ª πﬂº€«—¥Ÿ.
	for (n=0;n<mailnum;n++) {
		//∞‘Ω√π∞¿˙¿Â Ω√¿€
		//æ∆¿Ãµ∏¶ √£¥¬¥Ÿ. ->pf2ø° ¿˙¿Â
		if (strlen(abook[n])<3) continue;
		if (!read_pf2(abook[n])) continue;	//æ¯¿∏∏È ¥Ÿ¿Ω æ∆¿Ãµ
		//∆Ì¡ˆºˆΩ≈«‘ø° ªÛ¥ÎπÊ∆Ì¡ˆ«‘ø° ¿˙¿Â
		strcpy(bbs.tid,pf2.id);   //πﬁ¥¬ªÁ∂˜

		sprintf(table_name,"mail%s",pf2.id);
		strcpy(db_name,DB_MAIL);
        strcpy(bbs.tcode,"mail");
        add_table(0,sock,table_name,body);  //tableø° ¿˙¿Â«‘

		strcpy(g_id,pf2.id);
		strcpy(g_name,pf2.name);
		strcpy(g_buff1,"");
		if (mailnum>0) sprintf(g_buff1,"<%d≈Î>",mailnum);
        printf(" %5d. %-12s ( %-12s) ¥‘ø°∞‘ ∏ﬁ¿œ¿Ã πﬂº€µ«æ˙Ω¿¥œ¥Ÿ.\n",n+1,pf2.id,pf2.name);
		sprintf(buff,"\n ** %s ¥‘¿∏∑Œ∫Œ≈Õ ∏ﬁ¿œ¿Ã µµ¬¯«ﬂΩ¿¥œ¥Ÿ.**\n",pf.id);
		to_mess(pf2.id,buff);
	}
	//º’¥‘¿œ∂ß¥¬ ¿˙¿Âæ»«‘
	if (pf.type<1||guest_mode) goto _cont2;
	//¿⁄Ω≈¿« ∏ﬁ¿œ«‘ø° ∫∏≥Ω∆Ì¡ˆ ¿˙¿Â
	if (mailnum>1) {
		sprintf(buff,"<%d≈Î>",mailnum);
		strcat(buff,bbs.title);
		xstrncpy(bbs.title,buff,80);
	}
	sprintf(table_name,"mail%s",pf.id);
    strcpy(bbs.id,pf2.id);
    strcpy(bbs.name,pf2.name);
	strcpy(bbs.tcode,"send");
    add_table(0,sock,table_name,body);  //tableø° ¿˙¿Â«‘

	_cont2:
	check_cmd("");
	sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
	view("forum/main/frm/mail/mailend.log");
	goto _recover;

	_fail:
	unlink(TMP_FILE);		   //¿”Ω√»≠¿œ ªË¡¶
	check_cmd("");
	sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
	view("forum/main/frm/mail/failmail.log");

	_recover:
	unlink(TMP_FILE2);			//¿”Ω√»≠¿œ ªË¡¶
	go=oldgo;
	club_go=oldclub_go;
	club_mode=oldclub_mode;
	bbs=oldbbs;
	re_print=Yes;
}


//∏ﬁ¿Œ ¿¸√º ∏ﬁ¿œ ∫∏≥ª±‚
wmall()
{
	FILE *fp;
	int i,key,key2,n=0,nn,n1,n2;
	char buff[300];
	char buff2[140];
	char id[9];
	char torank1,torank2;
	int tosex,num,num_all,num_send;
	char tosexstr[10],dir[300];

	if (guest_mode) return;
	if (club_mode) {wmall_club();return;}
	key=Yes;
	if (in_file2("system/wmall.id",pf.id)) ;
	else if (pf.type<18&&pf.type<cfg.wmalltype) {
		mess("¿¸√º ∏ﬁ¿œ¿ª ∫∏≥æºˆ æ¯¥¬ µÓ±ﬁ¿‘¥œ¥Ÿ.");
		go_top(0);
		return;
	}

	torank1=0;torank2=14;tosex=0;
//	  num_all=count_pf();
	num_all=0;

	strcpy(bbs.id,pf.id);
	strcpy(bbs.name,pf.name);
	strcpy(bbs.filename,"");
	strcpy(bbs.keyword,"¿¸√º∏ﬁ¿œ");
	bbs.size=0;bbs.filesize=0;
	bcfg.wmode=0;
	strcpy(go.code,"wmall");strcpy(bbs.title,"");
	unlink(TMP_FILE);
	strcpy(NOW_FILE ,"menu/_allmail.tit");strcpy(NOW_FILED,"menu/_allmail.txt");
	touch_file(NOW_FILE);touch_file(NOW_FILED);
	while (1) {
		if (torank1<1)	torank1=0;if (torank1>19) torank1=19;
		if (torank2<1)	torank2=0;if (torank2>19) torank2=9;
		if		(tosex==1) strcpy(tosexstr,"≥≤º∫»∏ø¯");
		else if (tosex==2) strcpy(tosexstr,"ø©º∫»∏ø¯");
		else			   strcpy(tosexstr,"±∏∫–æ¯¿Ω");
		bbs.size=file_size(TMP_FILE);

		cls();
		printf(" *** %s »∏ø¯ ¿¸√º ∏ﬁ¿œ ∫∏≥ª±‚ (√—:%d∏Ì)***\n",cfg.hostname,num_all);
		printfL2();
		printf("  1. »∏ ø¯ µÓ ±ﬁ : %d - %d \n",torank1,torank2);
		printf("  2. »∏ ø¯ º∫ ∫∞ : %s      \n",tosexstr);
		printf(" 10. ∏ﬁ ¿œ ¡¶ ∏Ò : %s\n",bbs.title);
		printf(" 11. ∏ﬁ ¿œ ≥ª øÎ : %d Byte\n",bbs.size);
		if (pf.type>17) {
		printf(" 12. ∫∏ ≥ª ¥¬ ID : %s\n",bbs.id);
		printf(" 13. ∫∏≥ª¥¬ ¿Ã∏ß : %s\n",bbs.name);
		}
		printf("\n");
		printf(" 99. ¿ß¿« ¡∂∞« »∏ø¯ø°∞‘ ∏ﬁ¿œ ∫∏≥ª±‚\n");
		printfL2();
		printf("  º±≈√  ¡æ∑·(Q) >>");
		n=numinput();
		printf("\n");
		if (n<=0) break;
		if (n==1) {
			printf(" ¥ÎªÛ»∏ø¯ µÓ±ﬁ «œ«—  >>");torank1=get_num(torank1,2);printf("\n");
			printf(" ¥ÎªÛ»∏ø¯ µÓ±ﬁ ªÛ«—  >>");torank2=get_num(torank2,2);printf("\n");
		}
		if (n==2) {
			printf(" ¥ÎªÛ»∏ø¯ º∫∫∞  ±∏∫–æ¯¿Ω(0) ≥≤º∫(1) ø©º∫(2) >>");tosex=get_num(tosex,1);printf("\n");
		}
		if (n==10) {
			view("forum/main/frm/editor/writetit.wma");
			get_str(bbs.title,60);
		}
		if (n==11) {  //≥ªøÎ
			input_tmp(0);
		}
		if (n==12&&(pf.type>17)) {
			printf(" ∏ﬁ¿œ πﬂº€ ID   >>");
			get_str(bbs.id,8);
		}
		if (n==13&&(pf.type>17)) {
			printf(" ∏ﬁ¿œ πﬂº€ ¿Ã∏ß >>");
			get_str(bbs.name,8);
		}
		if (n==99) {
			if (strlen(bbs.title)<1) {mess("πﬂº€ ∏ﬁ¿œ¿« ¡¶∏Ò¿ª ¡ˆ¡§«œººø‰..");continue;}
			if (bbs.size<1) 		 {mess("πﬂº€ ∏ﬁ¿œ¿« ≥ªøÎ¿ª ¡ˆ¡§«œººø‰..");continue;}
			//¥ÎªÛ¿Œø¯ ∞ËªÍ
			num_send=0;
			/*
			if ((fp=fopen(ID_FILE,"r"))==NULL) return;
			printf("\n");
			printfL2();
			key=key2=Yes;
			while (fread(&pf2,sizeof_pf,1,fp)) {
				if (pf2.type<torank1||pf2.type>torank2) continue;
				if ((tosex==1&&pf2.sex!='m')||(tosex==2&&pf2.sex!='f')) continue;
				num_send++;
			}
			fclose(fp);
			printf("\n");
			printf(" ### ¿¸√º ∏ﬁ¿œ ¥ÎªÛ »∏ø¯ºˆ %d ∏Ì ###\n",num_send);
			printf(" ### πﬂº€¡¶∏Ò : %s\n",bbs.title);
			if (num_send==0) {mess("«ÿ¥Á ¡∂∞«¿« »∏ø¯¿Ã 0 ∏Ì¿‘¥œ¥Ÿ.");continue;}
			if (!yesno2("     ¿¸√º ∏ﬁ¿œ¿ª ∫∏≥ª∞⁄Ω¿¥œ±Ó?  (Y/n) >>",Yes)) continue;

			num=1;
			key=Yes;
			key2=Yes;
			fp=fopen(ID_FILE,"r");
			time(&bbs.date);  //πﬂΩ≈ ≥Ø¬• ¿˙¿Â
			bbs.date2=0;
			strcpy(bbs.id,pf.id);
			strcpy(bbs.name,pf.name);
            bbs.good=0;
            bbs.del=' ';
			strcpy(bbs.passwd,"");
			strcpy(bbs.keyword,"¿¸√º∏ﬁ¿œ");
			bbs=bbs;
			printf(" ### ¿¸√º∏ﬁ¿œπﬂº€Ω√¿€....... ###\n");
			while (key&&fread(&pf2,sizeof_pf,1,fp)) {
				del_space(pf2.id);del_esc(pf2.id);
				del_esc3(pf2.id);del_esc3(pf2.name);
				if (strlen(pf2.id)<3) continue;
				if (pf2.type<torank1||pf2.type>torank2) continue;
				if ((tosex==1&&pf2.sex!='m')||(tosex==2&&pf2.sex!='f')) continue;
				if (strlen(pf2.id)<1) continue;
//				  wmail4(pf2.id,TMP_FILE,bbs.title,9);
				printf(" %4d. %-8s(%-8s) ",num++,pf2.id,pf2.name);
				if (num%3==0) printf("\n");
				if (key2&&num%30==0) {
					printf(" ### ¿¸√º ∏ﬁ¿œ¿ª ∞Ëº” ∫∏≥æ±Óø‰? ∞Ëº”(Y/n) ø¨º”(S)>>");
					lineinput(buff,2);check_han(buff);printf("\n");
					if (is_same(buff,"n")) key=No;
					else if (is_same(buff,"s")) key2=No; //ø¨º”
				}
			}
			fclose(fp);
			*/
//			  wmail4(pf.id,TMP_FILE,bbs.title,8);
			strcpy(NOW_FILE ,"menu/_allmail.tit");strcpy(NOW_FILED,"menu/_allmail.txt");
			touch_file(NOW_FILE);touch_file(NOW_FILED);
			time(&bbs.date2);
			bbs_add(1);
			printf("\n");
			mess("∏ﬁ¿œ πﬂº€¿Ã ∏µŒ ≥°≥µΩ¿¥œ¥Ÿ.");
			unlink(TMP_FILE);
		}
	}
	unlink(TMP_FILE);
	go_top(0);
}



//µø»£»∏ ¿¸√º ∏ﬁ¿œ ∫∏≥ª±‚
wmall_club()
{
	FILE *fp;
	int i,key,key2,n=0,nn,n1,n2;
	char buff[300];
	char buff2[140];
	char id[9];
	char torank1,torank2;
	int tosex,num,num_all,num_send;
	char tosexstr[10],dir[300],id_file[300];
	CPF cpf2;

	key=Yes;
	if (pf.type<17) key=No;
	if (!key&&in_file2("system/wmall.id",pf.id)) key=Yes;
	if (!key) {mess("¿¸√º ∏ﬁ¿œ¿ª ∫∏≥æºˆ æ¯¥¬ µø»£»∏ µÓ±ﬁ¿‘¥œ¥Ÿ.");return;}

	torank1=0;torank2=14;tosex=0;
	sprintf(id_file,"%s/system/clubid.dat",club_go.dir);
//	  num_all=count_cpf(id_file);
	num_all=0;

	strcpy(bbs.id,pf.id);
	strcpy(bbs.name,pf.name);
	strcpy(bbs.filename,"");
	strcpy(bbs.keyword,"¿¸√º∏ﬁ¿œ");
	bbs.size=0;bbs.filesize=0;
	bcfg.wmode=0;
	strcpy(go.code,"wmall");strcpy(bbs.title,"");
	unlink(TMP_FILE);
	strcpy(NOW_FILE ,"menu/_allmail.tit");strcpy(NOW_FILED,"menu/_allmail.txt");
	touch_file(NOW_FILE);touch_file(NOW_FILED);
	while (1) {
		if (torank1<1)	torank1=0;if (torank1>19) torank1=19;
		if (torank2<1)	torank2=0;if (torank2>19) torank2=9;
		if		(tosex==1) strcpy(tosexstr,"≥≤º∫»∏ø¯");
		else if (tosex==2) strcpy(tosexstr,"ø©º∫»∏ø¯");
		else			   strcpy(tosexstr,"±∏∫–æ¯¿Ω");
		bbs.size=file_size(TMP_FILE);

		cls();
		printf(" *** µø»£»∏ »∏ø¯ ¿¸√º ∏ﬁ¿œ ∫∏≥ª±‚ (√—:%d∏Ì)***\n",num_all);
		printfL2();
		printf("  1. »∏ ø¯ µÓ ±ﬁ : %d - %d \n",torank1,torank2);
		printf("  2. »∏ ø¯ º∫ ∫∞ : %s      \n",tosexstr);
		printf(" 10. ∏ﬁ ¿œ ¡¶ ∏Ò : %s\n",bbs.title);
		printf(" 11. ∏ﬁ ¿œ ≥ª øÎ : %d Byte\n",bbs.size);
		if (pf.type>17) {
		printf(" 12. ∫∏ ≥ª ¥¬ ID : %s\n",bbs.id);
		printf(" 13. ∫∏≥ª¥¬ ¿Ã∏ß : %s\n",bbs.name);
		}
		printf("\n");
		printf(" 99. ¿ß¿« ¡∂∞« »∏ø¯ø°∞‘ ∏ﬁ¿œ ∫∏≥ª±‚\n");
		printfL2();
		printf("  º±≈√  ¡æ∑·(Q) >>");
		n=numinput();
		printf("\n");
		if (n<=0) break;
		if (n==1) {
			printf(" ¥ÎªÛ»∏ø¯ µÓ±ﬁ «œ«—  >>");torank1=get_num(torank1,2);printf("\n");
			printf(" ¥ÎªÛ»∏ø¯ µÓ±ﬁ ªÛ«—  >>");torank2=get_num(torank2,2);printf("\n");
		}
		if (n==2) {
			printf(" ¥ÎªÛ»∏ø¯ º∫∫∞  ±∏∫–æ¯¿Ω(0) ≥≤º∫(1) ø©º∫(2) >>");tosex=get_num(tosex,1);printf("\n");
		}
		if (n==10) {
			view("forum/main/frm/editor/writetit.wma");
			get_str(bbs.title,60);
		}
		if (n==11) {  //≥ªøÎ
			input_tmp(0);
		}
		if (n==12&&(pf.type>17)) {
			printf(" ∏ﬁ¿œ πﬂº€ ID   >>");
			get_str(bbs.id,8);
		}
		if (n==13&&(pf.type>17)) {
			printf(" ∏ﬁ¿œ πﬂº€ ¿Ã∏ß >>");
			get_str(bbs.name,8);
		}
		if (n==99) {
			if (strlen(bbs.title)<1) {mess("πﬂº€ ∏ﬁ¿œ¿« ¡¶∏Ò¿ª ¡ˆ¡§«œººø‰..");continue;}
			if (bbs.size<1) 		 {mess("πﬂº€ ∏ﬁ¿œ¿« ≥ªøÎ¿ª ¡ˆ¡§«œººø‰..");continue;}
			//¥ÎªÛ¿Œø¯ ∞ËªÍ
			num_send=0;
			/*
			if ((fp=fopen(id_file,"r"))==NULL) return;
			printf("\n");
			printfL2();
			key=key2=Yes;
			while (fread(&cpf2,sizeof_cpf,1,fp)) {
				if (cpf2.type<torank1||cpf2.type>torank2) continue;
				if (!read_pf2(cpf2.id)) continue;
				if ((tosex==1&&pf2.sex!='m')||(tosex==2&&pf2.sex!='f')) continue;
				num_send++;
			}
			printf("\n");
			printf(" ### ¿¸√º ∏ﬁ¿œ ¥ÎªÛ »∏ø¯ºˆ %d ∏Ì ###\n",num_send);
			printf(" ### πﬂº€¡¶∏Ò : %s\n",bbs.title);
			if (num_send==0) {mess("«ÿ¥Á ¡∂∞«¿« »∏ø¯¿Ã 0 ∏Ì¿‘¥œ¥Ÿ.");continue;}
			if (!yesno2("     ¿¸√º ∏ﬁ¿œ¿ª ∫∏≥ª∞⁄Ω¿¥œ±Ó?  (Y/n) >>",Yes)) continue;

			num=1;
			key=Yes;
			key2=Yes;
			fp=fopen(id_file,"r");
			time(&bbs.date);  //πﬂΩ≈ ≥Ø¬• ¿˙¿Â
			bbs.date2=0;
			strcpy(bbs.id,pf.id);
			strcpy(bbs.name,pf.name);
            bbs.good=0;
            bbs.del=' ';
			strcpy(bbs.passwd,"");
			strcpy(bbs.keyword,"¿¸√º∏ﬁ¿œ");
			bbs=bbs;
			printf(" ### ¿¸√º∏ﬁ¿œπﬂº€Ω√¿€....... ###\n");
			while (key&&fread(&cpf2,sizeof_cpf,1,fp)) {
				if (cpf2.type<torank1||cpf2.type>torank2) continue;
				if (!read_pf2(cpf2.id)) continue;
				del_esc3(pf2.id);del_esc3(pf2.name);
				if (strlen(pf2.id)<3) continue;
				if ((tosex==1&&pf2.sex!='m')||(tosex==2&&pf2.sex!='f')) continue;
				if (!read_pf2(pf2.id)) continue;
				if (strlen(pf2.id)<1) continue;
//				  wmail4(pf2.id,TMP_FILE,bbs.title,9);
				printf(" %4d. %-8s(%-8s) ",num++,pf2.id,pf2.name);
				if (num%3==0) printf("\n");
				if (key2&&num%30==0) {
					printf(" ### µø»£»∏»∏ø¯ø°∞‘ ∞Ëº” ∫∏≥æ±Óø‰? ∞Ëº”(Y/n) ø¨º”(S)>>");
					lineinput(buff,2);check_han(buff);printf("\n");
					if (is_same(buff,"n")) key=No;
					else if (is_same(buff,"s")) key2=No; //ø¨º”
				}
			}
			fclose(fp);
			*/
//			  wmail4(pf.id,TMP_FILE,bbs.title,8);
			strcpy(NOW_FILE ,"menu/_allmail.tit");strcpy(NOW_FILED,"menu/_allmail.txt");
			touch_file(NOW_FILE);touch_file(NOW_FILED);
			time(&bbs.date2);
			bbs_add(1);
			printf("\n");
			mess("∏ﬁ¿œ πﬂº€¿Ã ∏µŒ ≥°≥µΩ¿¥œ¥Ÿ.");
			unlink(TMP_FILE);
		}
	}
	unlink(TMP_FILE);
}

// ∏ﬁ¿œ ¿–¿∫ ø©∫Œ √≥∏Æ
mail_readok()
{
    int num,i,re_mode=No;
    BBS oldbbs;
	char table_name[100],filename[500];
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];
    oldbbs=bbs;
    if (is_same(mmc[0],"re")) re_mode=Yes;
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2141: %s\n",mysql_error(&mysql));
        return;
	}
    if ((mysql_select_db(sock, DB_MAIL)) == -1) {
        printf("## ERR 2142: %s\n",mysql_error(sock));
		mysql_close(sock);
        return;
	}
	sprintf(table_name,"mail%s",pf.id);
	view("forum/main/frm/mail/rmailok.log");

	// ∆Ì¡ˆ(1) √≥∏Æ(1.ªË¡¶ 2.¿˙¿Â 3.∫∏∞¸ 9.ºˆΩ≈∞≈∫ŒµÓ∑œ) π¯»£ >> !¡ﬂ¡ˆ!
	i=numinput();printf("\n");
	if (i==1) {
		//sprintf(query,"DELETE from %s where num=%d",table_name,bbs.num);
		sprintf(query,"update %s set tcode='delete' where num=%d",table_name,bbs.num);
        if (mysql_query(sock, query) == -1) printf("%s",mysql_error(sock));
	}
	if (i==2) {
		sprintf(query,"update %s set tcode='save' where num=%d",table_name,bbs.num);
        if (mysql_query(sock, query) == -1) printf("%s",mysql_error(sock));
	}
	mysql_close(sock);
    if (re_mode) {
        bbs=oldbbs;
        strcpy(mmc[0],"re");
        mmn[1]=bbs.num;
        wmail(2,bbs.id);
    }
}


/*
 º±≈√ »≠¿œ ¿Ã∏ß
	¢—test.zip
 ∆ƒ¿œ ¿¸º€ «¡∑Œ≈‰ƒ›¿ª º±≈√«œΩ Ω√ø¿.
 1.[7mZmodem[m  2.Kermit	0.√Îº“
 π¯»£º±≈√(ENTER:Zmodem) >> !¡ﬂ¡ˆ!

 ∆ƒ¿œ ¿¸º€ «¡∑Œ±◊∑•¿ª Ω««‡Ω√ƒ— ¡÷Ω Ω√ø¿ !!
¿·Ω√ ±‚¥Ÿ∏ÆΩ Ω√ø¿.
*/
mail_down()
{
	BBS abbs[101],oldbbs=bbs;
	int i,i2,n,n2,count=0,tsize;
	int count_file,tsize_bbs,tsize_file;
	char buff[300];
	char buff2[300];
	char newdir[300];

	if (guest_mode) goto _fail;
	strcpy(db_name,DB_MAIL);
	count_file=tsize_bbs=tsize_file=0;
	view("forum/main/frm/down/title.log");
	bzero(abbs,sizeof(abbs));
	for (i=0;i<100;i++) abbs[i].num=abbs[i].filesize=-1;

	if (list_mode&&mmn[1]==0) mmn[1]=bbs.num;
	for (i=1;i<101;i++) {
		if (mmn[i]==0||!bbs_num(mmn[i])) continue;
        //mess("__%d %s %s\n",bbs.num,bbs.title,bbs.filename);;;;;;;;;
		//æœ»£∞° ¡ˆ¡§µ«æÓ ¿÷¿ª∂ß
		if (!bit(bcfg.mode,31)&&strlen(bbs.passwd)>0&&
			!check_pass(bbs.passwd,4,"¿Ã ¿⁄∑·¥¬ æœ»£∞° ¡ˆ¡§µ«æÓ ¿÷Ω¿¥œ¥Ÿ.")) continue;
		abbs[count++]=bbs;
	}
	count=0;
	tsize=0;
	for (i=0;i<100;i++) {
		if (abbs[i].num>=0) {
			sprintf(buff,"mailbin/%s.%x",abbs[i].filename,abbs[i].fcount);
			if (strlen(abbs[i].filename)&&is_file(buff)) {
                printf(" ¢— %-30s %8d Byte\n",abbs[i].filename,abbs[i].filesize);
				count++;
				tsize+=abbs[i].filesize;
			}
			else {
				sprintf(abbs[i].filename,"%s.%d",pf.id,i+1);
				abbs[i].filesize=-1;
                printf(" ¢— %-30s %8d Byte\n","∏ﬁ¿œ",abbs[i].size);
				count++;
				tsize+=abbs[i].size;
			}
		}
	}
	if (count<1) goto _fail;
	if (count>1) printf("    √— %d ∞≥ »≠¿œ  %10d πŸ¿Ã∆Æ\n",count,tsize);

	//«¡∑Œ≈‰ƒ› º±≈√
	strcpy(g_buff4,pf.type==19?"9.DNS  ":"");
	view("forum/main/frm/down/select.log");
	lineinput(buff,2);check_han(buff);printf("\n");
	i2=atoi(buff);
	if (i2==0&&strlen(buff)==1) goto _fail;

	view("forum/main/frm/down/wait.log");
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	check_dir(newdir);
	for (i=0;i<100;i++) {
		if (strlen(abbs[i].filename)>0&&abbs[i].num>=0) {
			sprintf(buff,"mailbin/%s.%x",abbs[i].filename,abbs[i].fcount);
			if (i2==9) continue;
			if (is_file(buff)) {
				sys_tem("cp -f '%s' %s/",buff,newdir);
				printf(".");fflush(NULL);
			}
			else if (bbs_num(abbs[i].num)) {
				bbs2tmp(); //«ˆ¿ÁBBS¿« ≥ªøÎ¿ª TMP∑Œ ¿˙¿Â
				sprintf(buff,"%s/%s",newdir,abbs[i].filename);
				file_move(TMP_FILE,buff);
				if (is_file(buff)) {
					printf(".");fflush(NULL);
				}
			}
		}
	}

	if (i2==9&&pf.type==19) {	 //¡ˆ¡§µ∑∫≈‰∏Æø° ∫πªÁ
		char   DEF_UPS[81];    // UPS ±‚∫ªDIR
		char   DEF_DNS[51];    // DNS ±‚∫ªDIR
		_cont4:
		view("forum/main/frm/down/dns.log");
		lineinput(DEF_DNS,50);check_han(DEF_DNS);printf("\n");
		if (strlen(DEF_DNS)<2) goto _fail;
		if (!is_dir(DEF_DNS)||in_file2("system/cannot.dir",DEF_DNS)) {
			printf(" µ∑∫≈‰∏Æ∏¶ √£¿ªºˆ æ¯Ω¿¥œ¥Ÿ.\n");
			goto _cont4;
		}
		for (i=0;i<100;i++) {
			sprintf(buff,"mailbin/%s.%x",abbs[i].filename,abbs[i].fcount);
			if (is_file(buff)) {
				sys_tem("cp -f %s %s/%s",buff,DEF_DNS,bbs.filename);
			}
		}
		view("forum/main/frm/down/downok.log");
		return Yes;
	}

	sprintf(buff,"tmp/up%d%s/*",cfg.hostno,no_spc(tty));
	view("forum/main/frm/down/zmodem.log");
	n=sz(buff);
	sys_tem("rm -rf %s",newdir);
	view("forum/main/frm/down/downok.log");
	return Yes;

	_fail:
	view("forum/main/frm/down/downfail.log");
	return No;

}

maillist()
{
    if (guest_mode) mess("º’¥‘¿∫ ªÁøÎ«“ºˆ æ¯Ω¿¥œ¥Ÿ.");
    else sys_tem("bin/maillist '%s'",pf.id);
    if (go.type=='r') go_prev();
}
