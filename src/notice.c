// ∞¯¡ˆªÁ«◊∫∏±‚
#include "bbs.h"
//∏∂¡ˆ∏∑ 10∞≥ ∞‘Ω√π∞∏∏ ∫∏ø©¡ÿ¥Ÿ. notice∂Û¥¬ ∞°±‚ƒ⁄µÂ∑Œ ¡§«ÿ ¿÷¥Ÿ.
//»≠∏È¿∫ notice.log∏¶ ∏’¿˙ ∫∏ø©¡ÿ¥Ÿ.
//mode=1¿Ã∏È Ω√¿€Ω√ »£√‚«—∞Õ¿”
view_notice(int mode,char *code)
{
	char buff[250];
	char buffdate[50];
	char inv1[100];
	char inv2[100];
	char dir[300];
	char table_name[100];
	char char3;
	int anum[51];
	int i,n,n2,key,noti_mode,count;
	GO oldgo,oldclub_go;
	int oldclub_mode;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];

	oldgo=go;
	oldclub_go=club_go;
	oldclub_mode=club_mode;
	if (!find_go("notice")) goto _quit;
    if (cfg.view_notice==0) goto _quit;

	read_bcfg();
	set_stat(1,"");

	view_pos=0;
	if (ccfg.noticex<1) ccfg.noticex=3;
	if (ccfg.noticey<1) ccfg.noticey=6;
	if ( cfg.noticex<1)  cfg.noticex=3;
	if ( cfg.noticey<5)  cfg.noticey=6;

	sprintf(table_name,"%s_%s",club_go.code,"notice");
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 1001: %s\n",mysql_error(&mysql));
		return;
	}
    if ((mysql_select_db(sock, DB_CM)) == -1) {
		printf("## ERR 1002: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
	list_mode=No;
	count=0;
	while (1) {
		if (!list_mode) {
			view_pos=0;
			//∞¯¡ˆªÁ«◊ ªÛ¥‹¿« »≠∏È¿ª ∫∏ø©¡ÿ¥Ÿ.
			cls();
			view("forum/%s/frm/notice/notice.scr",club_go.code);
			n=0;
			//»≠∏È «•Ω√ Ω√¿€
			for (i=0;i<51;i++) anum[i]=0;
			bbs.num=0;
			n=0;
			sprintf(query,"SELECT * FROM %s where good>0 order by pos desc,depth limit 15",table_name);
			if (mysql_query(sock, query) == -1) {
				mysql_close(sock);
				goto _cont1;
			}
			qres = mysql_store_result(sock);
			while ((qrow = mysql_fetch_row(qres)) != NULL) {
				qrow2bbs(qrow);
//				  mess("%d %s",bbs.num,bbs.title);
				if (strlen(bbs.title)<1) continue;
				strcpy(inv1,"");
				strcpy(inv2,"");
				strcpy(g_buff5,inv1);
				strcpy(g_buff6,inv2);

				anum[n+1]=bbs.num;
				a_num[4]=n+1;

				n2=club_mode?ccfg.noticet:cfg.noticet;
				if	 (view("forum/%s/frm/notice/notice.fm%d",club_go.code,n2));
				else if (n2==1) printf("%2d.  %s%-58.58s %s%5d%s\n",n+1,inv1,bbs.title,datestr(0,bbs.date),bbs.hits,inv2);
				else if (n2==2) printf("%2d.  %s%-70.70s %s\n",n+1,inv1,bbs.title,inv2);
				else if (n2==3) printf("%2d  %s %s%-62.62s%s\n",n+1,inv1,datestr(5,bbs.date),bbs.title,inv2);
				else			printf("%2d  %s%-59.59s[m %s%5d%s\n",n+1,inv1,bbs.title,datestr(0,bbs.date),bbs.hits,inv2);
				count++;
				n++;
			}
			mysql_free_result(qres);
		}
		if (count==0) break;

		_cont1:
		if (count==0) break;
		if (!view("forum/%s/frm/notice/notice.adc",club_go.code)) view("frm/notice/notice.adc");
		lineinput(buff,20);printf("\n");check_han(buff);check_cmd(buff);
		n=atoi(buff);

		if (is_same(buff,"z")) continue;
		else if (strlen(mmc[0])<1) {
			if (list_mode) {
				bbs_read(2,bbs.num);
				continue;
			}
		}
		else if (n>0&&n<50) {		  //«ÿ¥Áπ¯»£ ≥ªøÎ√‚∑¬
//			  printf("%d %d\n",n,anum[n]);pressenter();
			bbs_read(0,anum[n]);	  //¿–±‚
			continue;
		}
		else if (is_same(mmc[0],"no")) sprintf(auto_cmd,"go notice"); //¿⁄µø∞°±‚ƒ⁄µÂ
		else if (!guest_mode&&is_same(mmc[0],"r")) sprintf(auto_cmd,"go rmail"); //¿⁄µø∞°±‚ƒ⁄µÂ
		else if (pf.type>14&&is_same(mmc[0],"w")) {go_code("notice");oldgo=go;sprintf(auto_cmd,"w");return;} //¿⁄µø∞°±‚ƒ⁄µÂ
		else if ((mmc[0][0]==0||is_same(mmc[0],"p"))&&list_mode) {list_mode=No;continue;}
		else if (is_same(mmc[0],"p")) break;
		else if (strlen(buff)>0) strcpy(auto_cmd,buff);    //πŸ∑Œ∞°±‚
		break;
	}
	go_top(1);
	p_command=No;
	re_logo=Yes;

	_quit:
	list_mode=No;
	re_print=Yes;
	re_bbs=Yes;
	go=oldgo;
	club_go=oldclub_go;
	club_mode=oldclub_mode;
}
