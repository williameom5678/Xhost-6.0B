#include "bbs.h"

//mode=-1:뒤로게시물  1:다음게시물
//mode=-2:이전페이지 2:다음페이지
bbs_read(int mode,int num)	//해당번호 내용출력
{
	char buf[280];
	char buff[280];
	char filename[280];
	char buff1[3502];
	char buff2[3502];
	char ch=0;
    char mail_mode=No;
	char found=No;
	int i,ii,i2;
	int pos,count;
	int stop_count,last_pos,last_pos2,last_pos3;
	int str1_count=0;
	char TMP_FILE4[280];
    char table_name[100],mailcmd[100];
    char c,query[500];
    char filt1[500],filt2[500];

	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	int body_no;

    strcpy(filt1,"");strcpy(filt2,"");
    if (strlen(filt_str)) sprintf(filt1,"and %s",filt_str);

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    strcpy(db_name,DB_CM);
	if ((is_same(go.code,"rmail")||
		 is_same(go.code,"wmail")||
		 is_same(go.code,"mbox")||
         is_same(go.code,"dbox")||
		 is_same(go.code,"cmail"))) {
        mail_mode=Yes;
        strcpy(db_name,DB_MAIL);
        sprintf(table_name,"mail%s",pf.id);
        if (is_same(go.code,"rmail")) strcpy(mailcmd,"mail");
        if (is_same(go.code,"mbox")) strcpy(mailcmd,"save");
        if (is_same(go.code,"cmail")) strcpy(mailcmd,"send");
        if (is_same(go.code,"dbox")) strcpy(mailcmd,"delete");
	}

    sprintf(filename,"forum/%s/logo/%s.lir",club_go.code,go.code);
    if (guest_mode&&mail_mode) return;

    if (bbs_man(pf.id));
    else if (mail_mode) ;
	else if (check_type('r')) return;   //메뉴 가능 등급확인
	else if (bit(bcfg.modelist,5)&&!in_file2(filename,pf.id)) return;

	re_print=No;
	list_mode=Yes;		//내용출력모드
	//출력시작위치찾기
	if (set_bbs_logo("tor",filename)) view(filename);
	if (bit(bcfg.modelist,0)) return;	//내용안보임

    //DB에서 읽기
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2001: %s\n",mysql_error(sock));
        return;
	}
    if ((mysql_select_db(sock, db_name)) == -1) {
		printf("## ERR 2002: %s\n",mysql_error(sock));
        return;
	}

	if (mode==-1) { 	 //이전위치
		view_pos=0;
        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos>%d and tcode='%s' %s order by pos,depth limit 2",table_name,NOW_POS,mailcmd,filt1);
        else sprintf(query,"SELECT * FROM %s where pos>%d %s order by pos,depth limit 2",table_name,NOW_POS,filt1);
//        printf("mode:%d %s\n",mode,query);
		if (mysql_query(sock, query) == -1) goto _cont1;  //없음
		qres = mysql_store_result(sock);
	}
	else if (mode==1) { 	 //다음위치
		view_pos=0;
        if (mail_mode) sprintf(query,"SELECT * FROM %s where pos<%d and tcode='%s' %s order by pos DESC,depth limit 2",table_name,NOW_POS,mailcmd,filt1);
        else sprintf(query,"SELECT * FROM %s where pos<%d %s order by pos DESC,depth limit 2",table_name,NOW_POS,filt1);
//      printf("mode:%d %s\n",mode,query);
		if (mysql_query(sock, query) == -1) goto _cont1;  //없음
		qres = mysql_store_result(sock);
	}
	else {
		_cont1:
        if (mail_mode) sprintf(query,"SELECT * FROM %s where num=%d and tcode='%s' %s",table_name,num,mailcmd,filt1);
        else sprintf(query,"SELECT * FROM %s where num=%d %s",table_name,num,filt1);
		if (mysql_query(sock, query) == -1) {
			printf("## 해당되는 #%d 번 게시물(%s)을 읽을수 없습니다.\n",num,go.code);
			mysql_close(sock);
			list_mode=No;
			goto _fail;
		}
		qres = mysql_store_result(sock);
	}

	if ((qrow = mysql_fetch_row(qres))==NULL) {  //찾기실패
		printf("## 해당되는 번호(%d)를 찾을수 없습니다.\n",num);
		mysql_free_result(qres);
		mysql_close(sock);
		list_mode=No;
		goto _fail;
	}

	//총 조회수 증가
	qrow2bbs(qrow);
    NOW_POS=bbs.pos;
	body_no=fnobbs("body");
    if (mail_mode) {  //메일일때
        char table_name2[100],read_date[100],send_date[100];  //받는사람 메일
        if (bbs.hits<1) {
            if (is_same(go.code,"rmail")) {
                time(&bbs.date2);
                strcpy(read_date,datestr(19,bbs.date2));
                strcpy(send_date,datestr(19,bbs.date));
                sprintf(query,"update %s set date2='%s' where num=%d",table_name,read_date,bbs.num);
                mysql_query(sock, query);
                sprintf(table_name2,"mail%s",bbs.id);   //보낸사람
                sprintf(query,"update %s set hits=hits+1,date2='%s' where tcode='send' and date='%s' and tid='%s'",
                table_name2,read_date,send_date,pf.id);
                mysql_query(sock, query);
            }
            bbs.hits++;
            sprintf(query,"update %s set hits=hits+1,date2='%s' where num=%d",table_name,read_date,bbs.num);
            mysql_query(sock, query);
        }
	}
    else if (ok_hits()) {
		bbs.hits++;
        sprintf(query,"update %s set hits=hits+1,date2='%s' where num=%d",table_name,now_str(19),bbs.num);
		mysql_query(sock, query);
        //printf("q:%s e:%s\n",query,mysql_error(sock));
    }

	if (qrow[body_no]==NULL) goto _done;
	bbs.size=strlen(qrow[body_no]);

	if (view_pos>=bbs.size) view_pos=bbs.size-1;
	if (view_pos<0) view_pos=0;
	if (N_page<1) N_page=1;

	stop_count=14;		  //화면이 멈추는 줄수
	count=0;
	stop_count=15;		  //화면이 멈추는 줄수
	str1_count=0;
	ch=0;

	if (mode==-2) { 	 //이전위치
		count=0;
		str1_count=0;
		N_page--;
		while(--view_pos>0) {
			ch=qrow[body_no][view_pos];
			if(ch=='\n'||str1_count++>79) {count++;str1_count=0;}
			if (count>stop_count) {
				if (ch=='\n') view_pos++;
				break;
			}
		}
		if (view_pos<0) view_pos=0;
	}
	else if (mode==2) { 	 //다음위치
		count=0;
		str1_count=0;
		ii=view_pos;
		N_page++;
		while(view_pos++<bbs.size) {
			ch=qrow[body_no][view_pos];
			if(ch=='\n'||str1_count++>79) {count++;str1_count=0;}
			if (count>=stop_count) {
				if (ch=='\n') view_pos++;
				break;
			}
		}
		if (view_pos>bbs.size) {
			view_pos=ii;
			N_page--;
            message("자료의 끝입니다.");
		}
	}
	if (N_page<1) N_page=1;
	//상단화면 출력
    for (i=30;i<40;i++) strcpy(a_str[i],"");
    if (strlen(bbs.filename)) {
        sprintf(a_str[30],"  파일명:%s 파일크기: %d Byte\n",bbs.filename,bbs.filesize);
    }
    if (bcfg.bform==0) {
        if (set_bbs_logo("ftm",buff)) view(buff);
    }
    else {
        sprintf(buff,"r%02d",bcfg.bform);
        if (is_file(buff)) view(buff);
        else if (set_bbs_logo("ftm",buff)) view(buff);
    }

//	  printf("mode:%d view_pos:%d bbs.size:%d N_page:%d stop_Count:%d\n",mode,view_pos,bbs.size,N_page,stop_count);

	if (view_pos>=bbs.size) view_pos=bbs.size;
	if (view_pos<0) view_pos=0;
	str1_count=count=0;
    //printf(" ");
	for(ii=view_pos;ii<bbs.size;ii++) {
		//다음줄이 나올때까지 반복하여 화면에 출력한다.
		ch=qrow[body_no][ii];
		putchar(ch);
        if(ch=='\n'||str1_count++>79) {
			count++;
			str1_count=0;
			if (count>=stop_count) break;
            //printf(" ");
		}
	}

	_done:
	mysql_free_result(qres);
	mysql_close(sock);
	view_ok2:

	if (ch!='\n') printf("\n");    //다음줄표시
	if (bcfg.pos_y2>1) xy(1,bcfg.pos_y2-1);
	else printf("\n");
    if (!view("forum/%s/logo/%s.bl2",club_go.code,go.code)) {
		set_bbs_logo("bl2",buff);
		if (!view(buff)) {
			strchng2(buff,"bl2","bl1");
			view(buff);
		}
	}

	_fail:
	return;
}

ok_hits()		//조회수 증가 확인
{
	char buff[100];
	int i;
	sprintf(buff,"%d%s",bbs.num,go.code);
    if (pf.type>0&&is_same(bbs.id,pf.id)) return No; //작성자가 본인일때
	for (i=0;i<50;i++) {
//		printf("%d %s %s\n",i,buff,aread_nums[i]);
		if (strcmp(aread_nums[i],buff)==0) return No; //자료 읽은 번호
	}
	for (i=1;i<50;i++) {
		strcpy(aread_nums[i-1],aread_nums[i]);
	}
	strcpy(aread_nums[i-1],buff);
	return Yes; 	//중복안됨
}

