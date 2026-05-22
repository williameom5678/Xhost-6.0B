////////////////////////////////////////////////////////////////////////
// XHOST: ¸®´ª½º¿ë BBS HOST  °³¹ß:±è¼º´ë(053-964-1002) BBS:053-963-2190
//	  °Ô½ÃÆÇ °ü·Ã ·çÆ¾
////////////////////////////////////////////////////////////////////////
#include "bbs.h"
//°Ô½ÃÆÇ Á¦¸ñÀ» È­¸é¿¡ Ç¥½ÃÇÑ´Ù.
//mode==0 º¸±â	1:´ÙÀ½	-1:ÀÌÀü  -3:Ã³À½ºÎÅÍ
run_bbsscreen(int mode,int start_num)
{
	FILE *fp,*fp1,*fp2;
	int ii,i,n,j,i2,i3,n2,n3,linenum;
	char buff[255],buff1[200],buffkey[50],buff2[50],table_name[100];
    char c,query[BODY_MAX+500];
	char buffsize[30],buffdate[30],buffdate2[30],bufftitle[70],abuff[6][90];
    char top_file[200],frm_file[200],inv1[150],inv2[150],title[100];
    char is_bbs_frm=No;
    char ch[2],mailcmd[10];
	char bbs_mode=Yes;	 //°Ô½ÃÆÇ
    char filt1[500],filt2[500];
    int bsuper_user=No;
	int re_logo_head,re_numok=No,mail_mode=No,count=0;
    int tline2;
	int found;

	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;


    bsuper_user=bbs_man(pf.id);   //´ã´çÀÏ°æ¿ì
	view_pos=0;
	bbsreadall=Yes; 	 //º¼³»¿ë¾ø´Ù.
    sprintf(table_name,"%s_%s",club_go.code,go.code);
    strcpy(filt1,"");strcpy(filt2,"");
    if (bcfg.use_good3) {
        if (strlen(filt_str)) strcat(filt_str," and good>2");
        else strcpy(filt_str," good>2");
    }
    if (strlen(filt_str)) sprintf(filt1,"and %s",filt_str);

	for (i=0;i<50;i++) list_anum[i]=0;	 //È­¸éÃâ·Â ¹øÈ£

	//ÇØ´çÈ­ÀÏÁ¤º¸ÀÐ±â
	bbs_mode=is_typebbs;
	if ((is_same(go.code,"rmail")||
		 is_same(go.code,"mbox")||
         is_same(go.code,"dbox")||
         is_same(go.code,"cmail"))) {
		mail_mode=Yes;
        if (guest_mode) {
            mess("¼Õ´ÔÀº »ç¿ëÇÒ¼ö ¾ø½À´Ï´Ù.");
			go_prev();
			return;
		}
             if (is_same(go.code,"rmail")) strcpy(mailcmd,"mail");
        else if (is_same(go.code,"mbox")) strcpy(mailcmd,"save");
        else if (is_same(go.code,"cmail")) strcpy(mailcmd,"send");
        else if (is_same(go.code,"dbox")) strcpy(mailcmd,"delete");
        sprintf(table_name,"mail%s",pf.id);
	}

	g_char=' ';
	if (check_type('i')) return;       //¸Þ´º °¡´É µî±ÞÈ®ÀÎ
	list_mode=No;

    _cont0:
	if (re_bbs) {
        NOW_TOPPOS=0;        //¹øÈ£»õ·Î °»½Å
		read_bcfg();
        strcpy(filt_str,"");
		re_bbs=No;
		NOW_ALLNO=0;
	}

    if (bcfg.tline<1) bcfg.tline=15;
    tline2=bcfg.tline+2;

    if (bcfg.bform) {
        sprintf(buff,"t%02d",bcfg.bform);
        set_bbs_logo(buff,top_file);
        if (!is_file(top_file)) set_bbs_logo("top",top_file);
    }
    else set_bbs_logo("top",top_file);

    if (bcfg.bform) {
        sprintf(buff,"f%02d",bcfg.bform);
        is_bbs_frm=set_bbs_logo(buff,frm_file);
        if (!is_bbs_frm) is_bbs_frm=set_bbs_logo("frm",frm_file);
    }
    else is_bbs_frm=set_bbs_logo("frm",frm_file);

	fflush(NULL);

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
        return;
	}
    strcpy(db_name,DB_CM);
    if (mail_mode) strcpy(db_name,DB_MAIL);
    if ((mysql_select_db(sock, db_name)) == -1) {
        printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
		goto _cont1;
	}

    if (NOW_PAGE<1) NOW_TOPPOS=0;

//    mess("MODE:%d PAGE:%d TOP:%d BOT:%d ALL:%d\n",mode,NOW_PAGE,NOW_TOPPOS,NOW_BOTPOS,NOW_ALLNO);

    if (start_num>0) {
        if (mail_mode) sprintf(query,"SELECT * FROM %s where num>=%d and tcode='%s' %s order by pos,depth limit 1",
                                     table_name,start_num,mailcmd,filt1);
        else           sprintf(query,"SELECT * FROM %s where num>=%d %s order by pos,depth limit 1",
                                     table_name,start_num,filt1);
		if (mysql_query(sock, query) == -1) {
			view(top_file);
			printf("ÀÚ·á¾øÀ½\n");
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
        i2=fnobbs("pos");
        if ((qrow = mysql_fetch_row(qres))!=NULL) {
            NOW_TOPPOS=atoi(qrow[i2])+1;
		}
		mysql_free_result(qres);
	}


         if (NOW_TOPPOS<1) ;
    else if (mode==-3) NOW_TOPPOS=0;
	else if (mode==1) {   //´ÙÀ½ÀÚ·á
        NOW_TOPPOS=NOW_BOTPOS;
		NOW_PAGE++;
	}
	else if (mode==-1) {
		NOW_PAGE--;
        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos>=%d and tcode='%s' %s order by pos,depth limit %d",table_name,NOW_TOPPOS,mailcmd,filt1,tline2);
        else sprintf(query,"SELECT * FROM %s where pos>=%d %s order by pos,depth limit %d",table_name,NOW_TOPPOS,filt1,tline2);
//        printf("%d:%s\n",mode,query);
		if (mysql_query(sock, query) == -1) {
			view(top_file);
			printf("ÀÚ·á¾øÀ½\n");
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
        i2=fnobbs("pos");
        for (i=0;i<bcfg.tline;i++) {
			if ((qrow = mysql_fetch_row(qres))==NULL) break;
            NOW_TOPPOS=atoi(qrow[i2])+1;
//            printf("%d\n", NOW_TOPPOS);
		}
		mysql_free_result(qres);
	}
    printf(".");fflush(NULL);


    if (NOW_TOPPOS<=0) {
		NOW_ALLNO=0;
        NOW_BOTPOS=0;
		NOW_PAGE=0;

		//ÃÑ¼ö±¸ÇÏ±â
        if (mail_mode) sprintf(query,"SELECT count(*) FROM %s where tcode='%s' %s",table_name,mailcmd,filt1);
        else sprintf(query,"SELECT count(*) FROM %s where %s ",table_name,filt1);
        check_query(query);

		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres)) != NULL) {
                if (qrow[0]) NOW_ALLNO=atoi(qrow[0]);
			}
			mysql_free_result(qres);
		}

        if (mail_mode) sprintf(query,"SELECT * FROM %s where tcode='%s' %s order by pos DESC,depth limit %d",table_name,mailcmd,filt1,bcfg.tline);
        else sprintf(query,"SELECT * FROM %s where %s order by pos DESC,depth limit %d",table_name,filt1,bcfg.tline);
        check_query(query);

        //printf("1st Page : %s\n",query);fflush(NULL);;;;;;;;;
		if (mysql_query(sock, query) == -1) {
			view(top_file);
//			  printf("ÀÚ·á¾øÀ½\n");
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
		mysql_data_seek(qres,0);				//ÃÖ°í»ó´Ü ÀÚ·á Ã£±â
        i2=fnobbs("pos");
		if ((qrow = mysql_fetch_row(qres))!=NULL) {
            if (qrow[i2]!=NULL) {
                NOW_TOPPOS=atoi(qrow[i2])+1;
			}
		}
		mysql_data_seek(qres,0);		  //ÃÖ°í»ó´Ü ÀÚ·á Ã£±â
        //printf("%s %s %d\n",db_name,query,NOW_TOPPOS);pressenter();;;;;;;;;;;
	}
	else {
        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos<%d and tcode='%s' order by pos DESC,depth limit %d",table_name,NOW_TOPPOS,mailcmd,bcfg.tline);
        else sprintf(query,"SELECT * FROM %s where pos<%d %s order by pos DESC,depth limit %d",table_name,NOW_TOPPOS,filt1,bcfg.tline);
		if (mysql_query(sock, query) == -1) {
			view(top_file);
			printf("ÀÚ·á¾øÀ½ %s\n",query);
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
	}

    printf(".");fflush(NULL);
	if (mysql_affected_rows(sock)==0) { 	//ÇöÀç È­¸éÃâ·ÂÀÚ·á°¡ 1°³µµ ¾ø´Ù
        NOW_PAGE--;
        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos>=%d and tcode='%s' %s order by pos,depth limit %d",table_name,NOW_TOPPOS,mailcmd,filt1,tline2);
        else sprintf(query,"SELECT * FROM %s where pos>=%d %s order by pos,depth limit %d",table_name,NOW_TOPPOS,filt1,tline2);
//        if (mode==-1) message("ÆäÀÌÁöÀÇ ¸¶Áö¸·ÀÔ´Ï´Ù.");
        message("ÆäÀÌÁöÀÇ ¸¶Áö¸·ÀÔ´Ï´Ù.");

        if (mysql_query(sock, query) == -1) {
			view(top_file);
			printf("ÀÚ·á¾øÀ½\n");
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
        i2=fnobbs("pos");
        for (i=0;i<bcfg.tline;i++) {
			if ((qrow = mysql_fetch_row(qres))==NULL) break;
            if (qrow[i2]!=NULL) NOW_TOPPOS=atoi(qrow[i2])+1;
//            printf("%d\n", NOW_TOPPOS);
		}
        mysql_free_result(qres);

        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos<%d and tcode='%s' %s order by pos DESC,depth limit %d",table_name,NOW_TOPPOS,mailcmd,filt1,bcfg.tline);
        else sprintf(query,"SELECT * FROM %s where pos<%d %s order by pos DESC,depth limit %d",table_name,NOW_TOPPOS,filt1,bcfg.tline);
		if (mysql_query(sock, query) == -1) {
			view(top_file);
			printf("ÀÚ·á¾øÀ½ %s\n",query);
			mysql_close(sock);
			goto _cont1;
		}
		qres = mysql_store_result(sock);
    }

    if (NOW_PAGE>(NOW_ALLNO/bcfg.tline)+1) NOW_PAGE=(NOW_ALLNO/bcfg.tline)+1;
	if (NOW_PAGE<1) NOW_PAGE=1;

	re_logo_head=Yes;
	linenum=0;
    NOW_BOTPOS=NOW_TOPPOS;
    //printf("%s",query);
	while (1) {
		//°Ô½ÃÆÇÀÇ »ó´Ü È­¸é Ãâ·Â
		if (re_logo_head) {
//            printf("PAGE:%d TOP:%d ALL:%d\n",NOW_PAGE,NOW_TOPPOS,NOW_ALLNO);
			view(top_file);
			re_logo_head=No;
			linenum=0;
		}
		if (bit(bcfg.modelist,7)) break;	 //¸ñ·Ï ¾Èº¸ÀÓ
        if (linenum>=bcfg.tline) break;
		if ((qrow = mysql_fetch_row(qres))==NULL) break;
		qrow2bbs(qrow);
        if (strlen(bbs.filename)) strcpy(buffkey,"BIN ");
        else strcpy(buffkey,"TXT ");

		del_esc(bbs.keyword);all_trim(bbs.keyword);
		del_space(bbs.id);
		bbs.title[70]=0;del_tab(bbs.title);all_trim(bbs.title);
		del_space(bbs.filename);del_tab(bbs.filename);del_esc(bbs.filename);bbs.filename[50]=0;
        strchng2(bbs.title,"\\\"","");

		if (bit(bcfg.modelist,8)&&bbs.good==1) bbs.good=0;
        sprintf(buffnum,"%6d ",bbs.num);      //buffnum¸¸µé±â
        if (stristr(bbs.title,".jpg")) {buffnum[0]=162;buffnum[1]=192;}//¢À
        else if (bbs.an>0) buffnum[0]='&';
        else if (bbs.depth>0) buffnum[0]='*';

        strcpy(buffsize,byte2str(bbs.filesize));
        strcpy(buffdate ,datestr(17,bbs.date ));
		strcpy(buffdate2,datestr(17,bbs.date2));
		strcpy(inv1,"");strcpy(inv2,"");

		strcpy(buff,gd_str(bbs.good));		//ÃßÃµº°»ö»ó
		strcpy(g_buff7,buff);

		//°­Á¦ÁöÁ¤»ö»óÀÎ°¡?
		strcpy(g_buff8,"");
		if (strlen(buff)>0) {
			sprintf(inv1,"[s%s",buff);
			strcpy(inv2,"[u");
		}
		strcpy(g_buff5,inv1);strcpy(g_buff6,inv2);

		if (linenum>=0&&linenum<50) list_anum[linenum]=bbs.num;   //È­¸éÃâ·Â ¹øÈ£
		//¸®½ºÆ®¸ð¾çº¸ÀÌ±â..
		if (is_bbs_frm) view(frm_file);
		else if (is_same(go.code,"cmail")) { //º¸³½ ¸ÞÀÏÀÇ °æ¿ì
            strcpy(buff2,"¾ÈÀÐÀ½");
            if (bbs.date2>0) sprintf(buff2,"%s ",datestr(17,bbs.date2));
            printf("%s%-8.8s %s %s %s%6d %s%-30.30s%s\n",
                    buffnum,bbs.id,buffdate,buff2,buffkey,bbs.size,inv1,bbs.title,inv2);
		}
		else if (mail_mode) {	  //¸ÞÀÏÀÇ °æ¿ì
			if (bbs.hits<=0) buffnum[0]='>';
			strcpy(buffdate,datestr(0,bbs.date));
            if (bbs.filesize==0||strlen(bbs.filename)<1) {
				strcpy(buffsize,byte2str(bbs.size));
			}
            printf("%s%-8.8s %-8.8s %s %4.4s%5s %-34.34s\n",
					buffnum,bbs.id,bbs.name,buffdate,buffkey,buffsize,bbs.title);
		}
		else if (is_same(go.code,"userroom")) {     //»ç¿ëÀÚ¿µ¿ª
            printf("%s%s %-12.12s%5s %s%-40.40s%s\n",
			buffnum,buffdate,bbs.filename,buffsize,inv1,bbs.title,inv2);
		}
        else if (bcfg.bform==2)     //ºñ°ø°³
            printf("%s%s%-72.72s%s\n",
            buffnum,inv1,bbs.title,inv2);
        else if (bcfg.bform==3)
            printf("%s%s%-58.58s %s%5d%s\n",
            buffnum,inv1,bbs.title,datestr(0,bbs.date),bbs.hits,inv2);
        else if (bcfg.bform==4)      //´äº¯ °Ô½ÃÆÇÀÇ °æ¿ì
            printf("%s%-8.8s %s%4d%4d %s%-48.48s%s\n",
            buffnum,bbs.id,buffdate,bbs.ok,bbs.no,inv1,bbs.title,inv2);
        else if (bcfg.bform==5) {     //¹æ¸í·Ï  ÀÌ¸§¸¸
            text_cut(bbs.title,44);
            printf("%s%-10.10s %s%4d %s%-44.44s%s\n",
            buffnum,bbs.name,datestr(3,bbs.date),bbs.line,inv1,bbs.title,inv2);
        }
        else if (bcfg.bform==6) {      //Âü°íÀÚ·á
            text_cut(bbs.title,62);
            printf("%s%s %-62.62s\n",
            buffnum,datestr(0,bbs.date),bbs.title);
        }
        else if (bcfg.bform==7)
            printf("%s%-8.8s %-12.12s %6s %-8.8s %-8.8s %-25 25s\n",
			buffnum,bbs.id,bbs.filename,buffsize,bbs.keyword,bbs.tcode,bbs.title);
        else if (bcfg.bform==8)
            printf("%s%-8.8s %s%4d %s%-51.51s%s\n",
            buffnum,bbs.id,datestr(0,bbs.date),bbs.line/16+1,inv1,bbs.title,inv2);
        else if (bcfg.bform==9)
            printf("%s%-8.8s %-12.12s %6s%5d %-5.5s %s%-32.32s%s\n",
			buffnum,bbs.id,bbs.filename,buffsize,bbs.down,bbs.tcode,inv1,bbs.title,inv2);
        else if (bcfg.bform==10)
            printf("%s%s%4d %s%-54.54s%s\n",
            buffnum,datestr(3,bbs.date),bbs.hits,inv1,bbs.title,inv2);
        else if (bcfg.bform==11) {
            text_cut(bbs.title,34);
            printf("%s%-8.8s %-12.12s %s%6s%4d %s%-34.34s%s\n",
            buffnum,bbs.id,bbs.filename,buffdate,buffsize,bbs.down,inv1,bbs.title,inv2);
        }
        else if (bcfg.bform==12)      //Á¦¸ñ¸¸
            printf("%s%s%-70.70s%s\n",
            buffnum,inv1,bbs.title,inv2);
        else if (bcfg.bform==13)
            printf("%s%-8.8s%4d %s%-60.60s%s\n",
            buffnum,bbs.id,bbs.line,inv1,bbs.title,inv2);
        else if (bcfg.bform==14)
            printf("%s%-8.8s%4d %s%-60.60s%s\n",
            buffnum,bbs.id,bbs.line,inv1,bbs.title,inv2);
        else if (bcfg.bform==15)
            printf("%s%-8.8s %-12.12s%6s%6d %s%-38.38s%s\n",
                    buffnum,bbs.id,bbs.filename,buffsize,bbs.down,inv1,bbs.title,inv2);
        else if (bcfg.bform==21)
            printf("%s%-8.8s %-10.10s %s%-32.32s%s\n",
            buffnum,bbs.id,bbs.tcode,inv1,bbs.title,inv2);
        else if (is_typecons&&bbs_man(pf.id))      //ºñ°ø°³´ã´çÀÏ°æ¿ì
            printf("%s(%-8.8s %-8.8s) %s%6d%4d %s%-36.36s%s\n",
			buffnum,bbs.name,bbs.id,buffdate,bbs.hits,bbs.line/16+1,inv1,bbs.title,inv2);
        else if (is_typesecu||is_typecons)      //ºñ°ø°³ °æ¿ì
			printf("%s %s%-58.58s%s%s%4d%3d\n",buffnum,inv1,bbs.title,inv2,buffdate,bbs.hits,bbs.line/16+1);
		else if (is_typepds) {
            text_cut(bbs.title,37);
//	5644 petabyte 815etc.zip	6.2M	 3 ÇÑ±Û815 Æ¯º°ÆÇ ±â´É°³¼±ÆÇ(¿µ¹®À©)
//123456712345678 123456789012123456123456 12345678901234567890123456789012345678
            printf("%s%-8.8s %-14.14s%6s%5d %s%-37.37s%s\n",
                    buffnum,bbs.id,bbs.filename,buffsize,bbs.down,inv1,bbs.title,inv2);
		}
        else {
            text_cut(bbs.title,45);
            printf("%s%-8.8s %s%-45.45s%s %s%5d%4d\n",
			buffnum,bbs.id,inv1,bbs.title,inv2,buffdate,bbs.hits,bbs.line/16+1);
		}
		linenum++;
        NOW_BOTPOS=bbs.pos;
	}

	mysql_close(sock);
	mysql_free_result(qres);
	_cont1:
	set_bbs_logo("bl1",buff);
	view(buff);
}


bbs2tmp()	 //ÇöÀçBBSÀÇ ³»¿ëÀ» TMP·Î ÀúÀå
{
	FILE *fp1,*fp2;
	int i;
	char c;
	unlink(TMP_FILE);
	if ((fp1=fopen(NOW_FILED,"r+"))==NULL) return;
	if ((fp2=fopen(TMP_FILE ,"w+"))==NULL) return;
	fseek(fp1,bbs.posi,SEEK_SET);
	for(i=0;i<bbs.size&&!feof(fp1);i++) {
		c=fgetc(fp1);
		if (c==0||(byte)c==255) break;
		fputc(c,fp2);
	}
	fclose(fp1);
	fclose(fp2);
}


char *gd_str()
{
	static char buff[10];
	strcpy(buff,"");
	return (buff);
}

bbscopy()
{
}
