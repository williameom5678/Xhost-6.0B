#include "bbs.h"

//해당 되는 번호를 찾아 bbs에 저장
int bbs_num(int num)
{
	int found=No,mail_mode=No;
	char table_name[100],query[500];
	char mailcmd[10];

	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;

	if (is_same(go.code,"rmail")) strcpy(mailcmd,"mail");
	else if (is_same(go.code,"mbox")) strcpy(mailcmd,"save");
	else if (is_same(go.code,"cmail")) strcpy(mailcmd,"send");
	else if (is_same(go.code,"dbox")) strcpy(mailcmd,"delete");
	else strcpy(mailcmd,"mail");

	if (is_same(db_name,DB_MAIL)) mail_mode=Yes;
	if (mail_mode) sprintf(table_name,"mail%s",pf.id);
	else sprintf(table_name,"%s_%s",club_go.code,go.code);
    sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
	if ((mysql_select_db(sock, db_name)) == -1) {
		printf("## ERR 2002: %s\n",mysql_error(sock));
        mysql_close(sock);
		return found;
	}

	if (mail_mode) sprintf(query,"SELECT * FROM %s where num=%d and tcode='%s'",table_name,num,mailcmd);
	else sprintf(query,"SELECT * FROM %s where num=%d",table_name,num);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))!=NULL) {
			qrow2bbs(qrow);
			found=Yes;
			re_print=Yes;
			del_tab(bbs.title);all_trim(bbs.title);
			del_esc(bbs.keyword);all_trim(bbs.keyword);
			del_esc(bbs.id);del_esc(bbs.name);del_space(bbs.id);
            del_space(bbs.filename);del_tab(bbs.filename);del_esc(bbs.filename);bbs.filename[50]=0;
			NOW_NO=bbs.num;
		}
		mysql_free_result(qres);
	}
    mysql_close(sock);
	return(found);
}


//게시판 답변
bbs_re()
{
	int n,ret,mode;
	char buff[80];
	char buff2[80];
	char buff3[30];
	char buff4[30];
	unsigned int i;
	BBS oldbbs;
	re_print=Yes;
	if (!is_char(BBSTYPE,go.type))	return;
	if (!(is_same(mmc[0],"re")||
		  is_same(mmc[0],"r")||
		  is_same(mmc[0],"ra")||
		  is_same(mmc[0],"rs")||
		  is_same(mmc[0],"rn")||
		  is_same(mmc[0],"rt")||
		  is_same(mmc[0],"at")||
		  is_same(mmc[0],"an")||
		  is_same(mmc[0],"rr")))    return;
	if (is_typepds&&
		 (is_same(mmc[0],"ra")||
		  is_same(mmc[0],"rn")||
		  is_same(mmc[0],"rt")||
		  is_same(mmc[0],"an")||
		  is_same(mmc[0],"rr")||
		  is_same(mmc[0],"rr")))    return;
    if (go.type=='k'||go.type=='o'||bcfg.bform==2) return;   //비공개
	ret=Yes;
	if (list_mode&&mmn[1]==0) mmn[1]=bbs.num;
	if (mmn[1]==0) ret=No;	//선택번호 없을때
	list_mode=No;

	if (bit(limit,1)) {
		view2("forum/main/frm/_nodeall.log");
		return;
	}

	if (ret==No) {
		printf("\n *****답변적기명령 사용방법****** \n");
		printf("ra [번호]  해당게시물에 추가를 적음 [추가]....\n");
		printf("rn [번호]  해당게시물에 답변을 적음 [답변]....\n");
		printf("rt [번호]  해당게시물에 참고을 적음 [참고]....\n");
		printf("rr [번호]  해당게시물에 잡담을 적음 [잡담]....\n");
		printf("re [번호]  해당게시물 작성자에게 답장메일을 보냄\n");
		printf("rs         해당게시물 담당자에게 메일을 보냄\n");
		printf("an [번호]  해당게시물 답변가능 게시물에 답변적기\n");
		printf("at [번호]  해당게시물 추가(본인또는,담당자) 적기\n");
		pressenter();
		return;
	}

	if (!bbs_num(mmn[1])) {
		message("해당번호를 찾을수 없습니다.");
		return;   //해당번호 찾기
	}
	oldbbs=bbs;

	if (guest_mode&&!is_char("gun",go.type)) {  /* 손님인 경우에는 */
		message("손님은 사용할수 없는 명령입니다.");
		return;
	}

	if (check_type('w')) return;   //쓰기금지여부
	if (!guest_mode&&wtimes()) return ; 		//적는 횟수 검사


	strcpy(buff3,bbs.id);
	strcpy(buff,bbs.title);
	strcpy(buff2,"");
	if (is_same(mmc[0],"an")||is_same(mmc[0],"at")) { //여유분명령있을때
		if (strlen(mmc[3])>0&&atoi(mmc[3])==0) strcpy(buff2,mmc[3]);
		else if (strlen(mmc[2])>0&&atoi(mmc[2])==0) strcpy(buff2,mmc[2]);
	}

		 if (is_same(mmc[0],"an")) {bbs_an(0,buff2);return;}
	else if (is_same(mmc[0],"at")) {bbs_an(1,buff2);return;}
	else if (is_same(mmc[0],"re")) {wmail(2,buff3);return;}
	else if (is_same(mmc[0],"r"))  {wmail(1,buff3);return;}
	else if (is_same(buff,"rs"))       {
		for(i=0;i<10;i++) strcpy(mmc[i],"");
		strcpy(mmc[1],bcfg.sysop);	//담당자에게 메일
		if (mmc[1][0]==0&&!club_mode) strcpy(mmc[1],cfg.sysop);
		if (mmc[1][0]==0&& club_mode) strcpy(mmc[1],ccfg.sysop);
		wmail(1,mmc[1]);
		return;
	}
	strcpy(buff2,"");
	if (is_same(mmc[0],"ra")) strcpy(buff2,"[추가] ");
	if (is_same(mmc[0],"rn")) strcpy(buff2,"[답변] ");
	if (is_same(mmc[0],"rt")) strcpy(buff2,"[참고] ");
	if (is_same(mmc[0],"rr")) strcpy(buff2,"[잡담] ");
	n=6;
	strcat(buff2,bbs.title);
	strncpy(bbs.title,buff2,sizeof(bbs.title));

	strcpy(bbs.name,pf.name);
	strcpy(bbs.keyword,"");
	strcpy(bbs.passwd,"");
	bbs.hits=0;
	bbs.down=0;
	bbs.pos=oldbbs.pos;
	bbs.depth=oldbbs.depth+1;
	if (oldbbs.pos<1) oldbbs.pos=1;
	strcpy(bbs.id,pf.id);			  //현재의 아이디,이름
	strcpy(bbs.name,pf.name);
	time(&bbs.date);
	time(&bbs.date2);
	bbs.good=' ';
	sprintf(bbs.keyword,"%d",bbs.num);
	printf("\n    < %s >\n",bbs.title);
	unlink(TMP_FILE);
	ret=bbs_editor(1);
	if (ret) ret=bbs_add(2);	//pos,max 그대로
	if (ret) {
		//화일명입력,전송
        sprintf(buff,"      ** 답변하신 글이 저장되었습니다. **.");
		message(buff);
	}
	bbs=oldbbs;
	unlink(TMP_FILE);
	re_print=Yes;
}


//해당 되는 게시판에 글을 적어 추가하기
//num:게시물 번호,mode:0: 답변,1:추가
bbs_an(int mode,char *cmdstr)
{
	char buff1[80],c;
	char buff[300000],table_name[500];
	int found=No;
	FILE *fp;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char body[BODY_MAX],query[BODY_MAX+500];

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
	mysql_select_db(sock, db_name);
	sprintf(query,"SELECT * FROM %s where num=%d",table_name,bbs.num);
	strcpy(body,"");
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))!=NULL) {
			found=Yes;
			strcpy(body,qrow[fnobbs("body")]);
		}
		mysql_free_result(qres);
	}

	// 답변 가능 조건 확인
	if (!found||!(go.type=='q'||now_type>15||pf.type>15||bbs_man(pf.id)) ) {
        mysql_close(sock);
		mess("답변을 적을수 없습니다.");
		return;
	}

	//내용을 입력받는다. ->TMP_FILE로
    printf("\n\n %-40.40s...  [%s]\n",bbs.title,mode==0?"답변":"추가");
	if (input_tmp(0)==No) return;
	bzero(buff,sizeof(buff));
    sprintf(buff,"\n   ####### [%s] 일시 %s #######\n",mode==0?"답변":"추가",now_str(3));
	strcat(body,buff);
	if ((fp=fopen(TMP_FILE,"r"))==NULL) return;
	fread(&buff,sizeof(buff),1,fp);
	fclose(fp);
	strcat(body,buff);
	unlink(TMP_FILE);
	strchng2(body,"'","\\'");
	bbs.an++;
	sprintf(query,"update %s set body='%s',an=%d where num=%d",table_name,body,bbs.an,bbs.num);
	mysql_query(sock, query);
    mysql_close(sock);
}

//현재의 가기코드의 디렉토리에 화일이 있는가?
//있으면 Yes 없으면 No
is_gofile(GO ttgo,char *filename)
{
	char buff[220];
	if(filename[0]==0) return No;
	if (is_same(ttgo.code,"userroom")) {
		sprintf(buff,"userroom/%s/%s/%s",c_han(pf.id),pf.id,filename);
		return (is_file(buff));
	}
	if(ttgo.dir[0]==0) return No;
	sprintf(buff,"%s/%s",ttgo.dir,filename);
	return (access(buff,0)!=-1);
}


//일일 쓰기 제한 확인 문제없으면 No 안되면 Yes
wtimes()
{
	FILE *fp;
	int key=No,ret=No;
	char st[10];
	char st1[10];
	char c,buff[550];
	int i,ii,num,mode;
	del_space(go.wtimes);
	if (guest_mode&&go.wtimes[0]==0||now_type>=14||pf.type>=14||bbs_man(pf.id)) return No;
	ii=0;
	mode=0;
	if		(is_char(go.wtimes,'a')) {mode=1;strcpy(st,"전체");}
	else if (is_char(go.wtimes,'t')) {mode=1;strcpy(st,"전체");}
	else if (is_char(go.wtimes,'m')) {mode=2;strcpy(st,"한달에");}
	else if (is_char(go.wtimes,'w')) {mode=3;strcpy(st,"한주에");}
	else if (is_char(go.wtimes,'d')) {mode=4;strcpy(st,"하루에");}
	bzero(st1,5);
	for (i=0,ii=0;i<5;i++) {c=go.wtimes[i];if (c>='0'&&c<='9') st1[ii++]=c;}
	del_space(st1);del_esc(st1);num=atoi(st1);
	return No;
}


file_of_num(char *filename,int num)
{
	char buff[200];
	int i;
	if (num>0) {
		for (i=strlen(filename);i>1;i--)
			if (filename[i]=='.') filename[i-1]+=(char)num;
	}
}




//게시판 찾기
//lt 등의 명령으로 찾게 되면 해당되는 게시물을
//임시화일에 제목만 보관한다.
//re_bbs시에 다시 원래대로 돌아 온다.
//w 또는 각종 명령이 수행될때 다시원래의 화일로 돌아온다.
bbs_search()
{
	int mode,n,i;
	int mode2;

	list_mode=No;
	re_print=Yes;
	strcpy(filt_str,"");
	if (mmc[1][0]==0&&!is_same(mmc[0],"lg")&&!is_same(mmc[0],"lst")) {
		printf("\n");
		view("forum/main/frm/help/_search.hlp");
		re_bbs=Yes;
		pressenter();
		return;
	}
	if ((go.type=='k'||go.type=='o')&&(is_same(mmc[0],"li")||is_same(mmc[0],"ln"))) return;  //비공개 경우
    if (go.type=='k'||go.type=='o'||bcfg.bform==2) return;   //비공개

	mode2=0;
	if (is_same(mmc[2],"or")||is_same(mmc[2],"+")) mode2=1;
	if (is_same(mmc[2],"and")||is_same(mmc[2],"*")) mode2=2;
	if (mmc[3][0]==0) mode2=0;

	if (is_same(mmc[0],"lt")) {
		if (mode2==0) sprintf(filt_str,"title like '%%%s%%'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"title like '%%%s%%' or  title like '%%%s%%'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"title like '%%%s%%' and title like '%%%s%%'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lf")) {
		if (mode2==0) sprintf(filt_str,"filename like '%%%s%%'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"filename like '%%%s%%' or  filename like '%%%s%%'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"filename like '%%%s%%' and filename like '%%%s%%'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lk")) {
		if (mode2==0) sprintf(filt_str,"keyword like '%%%s%%'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"keyword like '%%%s%%' or  keyword like '%%%s%%'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"keyword like '%%%s%%' and keyword like '%%%s%%'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lsc")||is_same(mmc[0],"lsl")) {
		if (mode2==0) sprintf(filt_str,"body like '%%%s%%'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"body like '%%%s%%' or  body like '%%%s%%'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"body like '%%%s%%' and body like '%%%s%%'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lu"))  {
		if (mode2==0) sprintf(filt_str,"title like '%%%s%%' or body like '%%%s%%' or ",mmc[1],mmc[1]);
		if (mode2==1) sprintf(filt_str,"title like '%%%s%%' or body like '%%%s%%' or title like '%%%s%%' or body like '%%%s%%'",mmc[1],mmc[1],mmc[2],mmc[2]);
		if (mode2==2) sprintf(filt_str,"title like '%%%s%%' or body like '%%%s%%' or title like '%%%s%%' or body like '%%%s%%'",mmc[1],mmc[1],mmc[2],mmc[2]);
	}
	else if (is_same(mmc[0],"ln")) {
		if (mode2==0) sprintf(filt_str,"name = '%s'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"name = '%s' or  name = '%s'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"name = '%s' and name = '%s'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"li")) {
		if (mode2==0) sprintf(filt_str,"id = '%s'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"id = '%s' or  id = '%s'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"id = '%s' and id = '%s'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lc")) {
		if (mode2==0) sprintf(filt_str,"tcode = '%s'",mmc[1]);
		if (mode2==1) sprintf(filt_str,"tcide = '%s' or  tcode = '%s'",mmc[1],mmc[3]);
		if (mode2==2) sprintf(filt_str,"tcode = '%s' and tcode = '%s'",mmc[1],mmc[3]);
	}
	else if (is_same(mmc[0],"lg")) sprintf(filt_str,"good >= '%s'",mmc[1]);
	else if (is_same(mmc[0],"le")) sprintf(filt_str,"line < '%s'",mmc[1]);
	else if (is_same(mmc[0],"le")) sprintf(filt_str,"line < '%s'",mmc[1]);
}




get_okrec_filename(char *filename,int n)
{
	sprintf(filename,"%s/bbsdata/okrec/%s.%d",club_go.dir,go.code,n);
}


bbs_copy()
{
}


bbs_ok(int mode)	//ok 처리  0:반대 1:찬성 2:삭제 3:보존 4:기권  6:  7:  8:
{
	int key=No,ret,found;
	int num,n,n2,i1,i2,i3;
	char buff[200],buff2[200];
	char filename[300],table_name[500],rec_name[500];
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];

	re_print=Yes;
	printf("\n");
	sprintf(table_name,"%s_%s",club_go.code,go.code);
	sprintf(rec_name,"%s_rec",table_name);
	if (!is_typebbs&&(mode==2||mode==3||mode==4||mode==12)) {
		message("게시판전용명령");
		return;
	}
	strcpy(buff2,"");
		 if (mode==0) strcpy(buff2,"NO(반대)");
	else if (mode==1) strcpy(buff2,"OK(찬성)");
	if (guest_mode) {
		mess("손님은 사용할수 없습니다.");
		return;
	}

	if (mmn[0]==0) mmn[0]=mmn[1];	  //그냥 ok만 했을때
	if (list_mode&&mmn[0]==0) mmn[0]=NOW_NO;	 //그냥 ok만 했을때
	if (mode<5&&mmn[0]<=0) {
		printf("\n OK [찬성번호]  NO [반대번호]\n");
		pressenter();
		return;
	}

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) return;
    if ((mysql_select_db(sock, DB_CM)) == -1) return;
	if (mode==8) {
		ret=No;
		if (bbs_man(pf.id)) ret=Yes; //게시판의 담당자의 경우
		if (pf.type>14) 	ret=Yes; //운영진이상일때
		if (now_type>=14)	ret=Yes; //운영진이상일때
		if (!ret) {message("기록삭제 권한이 없습니다.");return;}
		if (yesno("\n 찬성/반대 기록을 삭제하겠습니까? (y/N) >>",No)) {
			drop_table(rec_name);
			mess("모든 찬성반대 기록이 지워졌습니다.");
		}
		if (yesno("게시판의 찬성/반대 결과를 삭제할까요?(y/N)>>",No)) {
			sprintf(query,"update %s set ok=0,no=0",table_name);
			mysql_query(sock, query);
			mess("게시판 찬성반대 결과가 지워졌습니다.");
		}
        mysql_close(sock);
		return;
	}

	num=mmn[0];
	if (mmn[0]==mmn[1]) mmn[1]=0;

	for (n=0;n<101;n++) {
		if (mmn[n]<1) continue;
		found=No;
		sprintf(query,"SELECT * FROM %s where num=%d",table_name,mmn[n]);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres))!=NULL) {
				qrow2bbs(qrow);
				found=Yes;
			}
			mysql_free_result(qres);
		}
		if (bbs.num<1||!found) {
			printf("%d 번 검색 실패\n",mmn[n]);
			continue;
		}
		sprintf(query,"select * from %s where id='%s' and num='%d'",rec_name,pf.id,bbs.num);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres))!=NULL&&qrow[0] ) {
				printf(" 이미 OK/NO 응답을 하였습니다. (%d)\n",bbs.num);
				continue;
			}
		}
		if (mmn[n]>0&&bbs_num(mmn[n])) {  //자료번호 찾기
			//게시물 총수
				 if (mode==0) bbs.no++;
			else if (mode==1) bbs.ok++;

			sprintf(query,"update %s set ok='%d',no='%d' WHERE num='%d'",table_name,bbs.ok,bbs.no,bbs.num);
			if (mysql_query(sock, query) == -1) {
				printf("## ERR 4113: %s\n%s\n",mysql_error(sock),query);
				continue;
			}
			sprintf(query,"insert %s (id,num,mode,date) values ('%s','%d','%d','%s')",rec_name,pf.id,bbs.num,mode,now_str(19));
			if (mysql_query(sock, query) == -1) {
				if (mysql_errno(sock)==1146)  //DB없다
					create_db(sock,"def_bbs_rec",rec_name);
				if (mysql_query(sock, query) == -1) {
					printf("## ERR 4114: %s\n%s\n",mysql_error(sock),query);
					continue;
				}
			}
			printf(" %d 번 자료에 [%s] 지정이 되었습니다.\n",mmn[n],buff2);
		}
	}
	mysql_close(sock);
	pressenter();
}




//우수게시물 변환
bbs_gd(int mode)
{
	char buff[80];
	int num;
	int ret,n,i2,found;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[100],query[BODY_MAX+500];

	if (is_char(BBSTYPE,go.type)==No) return;
	ret=No;
	if (bbs_man(pf.id)) ret=Yes; //게시판의 담당자의 경우
	if (pf.type>14) 	ret=Yes; //운영진이상일때
	if (now_type>=14)	ret=Yes; //운영진이상일때
	if (!ret) {message("추천 권한이 없습니다.");return;}

	num=mmn[1];
    if (num==0&&list_mode) num=bbs.num;
    if (num<1) {
		printf("우수 자료로 지정할 자료 번호 입력 >>");
		lineinput(buff,10); 	   //명령어 입력
		check_cmd(buff);		   //명령어로 분해
		if (mmn[0]<1) { message("취소되었습니다.");return;  }
	}

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) return;
    if ((mysql_select_db(sock, DB_CM)) == -1) return;
	for (n=0;n<101;n++) {
		if (mmn[n]<1) continue;
		found=No;
		sprintf(query,"SELECT * FROM %s where num=%d",table_name,mmn[n]);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres))!=NULL) {
				qrow2bbs(qrow);
				found=Yes;
			}
			mysql_free_result(qres);
		}
		if (bbs.num<1||!found) {
			printf("%d 번 검색 실패\n",mmn[n]);
			continue;
		}
		if (bbs.good<1) bbs.good=0;
		if (bbs.good>=10) bbs.good=10;

		if (mode>0) bbs.good=mode;
		else if (mode==-1) bbs.good=0;
		else bbs.good++;
		if (bbs.good<1) bbs.good=0;
		if (bbs.good>=10) bbs.good=10;

		sprintf(query,"update %s set good=%d WHERE num='%d'",table_name,bbs.good,bbs.num);

		if (mysql_query(sock, query) == -1) {
			printf("## ERR 5323: %s\n%s\n",mysql_error(sock),query);
			continue;
		}
        printf("%7d. %-40.40s  -> 추천:%d 지정\n",
        bbs.num,bbs.title,bbs.good);
	}
	mysql_close(sock);
}
