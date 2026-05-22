//아이디 입력 루틴
#include "bbs.h"
//mode==0 : 단순입력  1:전부손님일때 아이디입력
start_id(int mode)
{
	char buff[300];
	char buff1[300];
	char buff2[300];
	char buff3[300];
	char buff4[300];
	char tbuff[300];
	char tbuff1[300];
	char tbuff2[300];
	char tbuff3[300];
	char tbuff4[300];
	char filename[300];
	int found=No;
	int n=0,tt,i,i2,n1,n2,n3,n4,n5,n6;
	int id_not_found=No;
	struct tm *tp;
	time_t t;
	time_t today;
	FILE *fp;
	PF oldpf;
	strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");strcpy(buff4,"");
	set_tmpfile();
	set_guest_mode();
	strcpy(buff1,cfg.guestid);strcpy(buff2,cfg.guestid);strcpy(buff3,cfg.guestid);strcpy(buff4,"");
	unlink(TMP_FILE1);
	fflush(stdout);

	strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");strcpy(buff4,"");
	start_logid(mode);		 //////// 아이디/비밀번호 입력

	strcpy(tbuff,c_han(pf.id));
	guest_mode=No;
	if (pf.type==0) guest_mode=Yes;
	//손님일경우
	if (guest_mode||pf.type<1||pf.type>19) {
		set_guest_mode();
		guest_mode=Yes;
		pf.login=START_TIME;		//접속시작시간
	}

	find_id:
	if (guest_mode) return;

	oldpf=pf;
	n=time_num(pf.login);  //접속하기 전의 날짜
	pf.login=START_TIME;		//접속시작시간
	n2=time_num(pf.login); //오늘 날짜
	pf.all_log++;
	pf.month_log++;
	if (pf.job>18||pf.job<0)  pf.job=0; 	//직업
	del_space(pf.id);del_esc3(pf.id);
	del_space(pf.name);del_esc3(pf.name);
	del_space(pf.email);del_esc3(pf.email);

	del_space(pf.id);del_space(pf.name);
	del_esc(pf.id);del_esc(pf.name);
	if (strlen(pf.name)<1) strcpy(pf.name,pf.id);
	all_trim(pf.passwd);all_trim(pf.id_no);
	pf.login=START_TIME;		//접속시작시간

    if (!guest_mode) {         //-> pf2에 저장
        MYSQL     *sock,mysql;
        MYSQL_RES *qres;
        MYSQL_ROW qrow;
        char query[500];
		n=how_old(START_TIME);
        sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
        mysql_select_db(sock,DB_NAME);
        sprintf(query,"update user set
            all_log=all_log+1,month_log=month_log+1,login='%s'
            WHERE id='%s'",datestr(19,pf.login),pf.id);
        mysql_query(sock, query);
        mysql_close(sock);
	}
	sys_tem("rm tmp/up*%d%s -rf",cfg.hostno,no_spc(tty));
	sys_tem("rm tmp/tmp*%d%s -rf",cfg.hostno,no_spc(tty));
}


set_guest_mode()
{
	char buff[100];
	char bufftty[100];
	strcpy(pf.id,cfg.guestid);
	strcpy(pf.name,cfg.guestid);
	strcpy(pf.gofirst,"");
	guest_mode=Yes;
	pf.type=0;
	pf.mymode=0;
	time(&pf.login);
	time(&pf.logout);
}


/*
접속시 logo화일
start1.log -> start9.log
start.31   -> 날짜별
startday.0 ,1,2,3,4,5,6  일.월.화...
starttim.0 ,1,2,3,4,5,24 시간대별
*/
start_logo()
{
	int i;
	time_t t;
	struct tm *tp1;
	if (ccfg.skip_intro) return;		 //시작화면무시
    view("forum/%s/frm/log/start.log",club_go.code);
    for (i=1;i<10;i++) view("forum/%s/logo/start%d.log",club_go.code,i);
	for (i=1;i<50;i++) {
        if (view("forum/%s/frm/log/startr%d.log",club_go.code,rand()%10)) break;
	}
	time(&t);
	tp1 = localtime(&t);

    view("forum/%s/frm/log/week%d.log",club_go.code,tp1->tm_wday);
    view("forum/%s/frm/log/day%02d%02d.log",club_go.code,tp1->tm_mon+1,tp1->tm_mday);
    view("forum/%s/frm/log/day%d.log",club_go.code,tp1->tm_mday);
    view("forum/%s/frm/log/hour%d.log",club_go.code,tp1->tm_hour);
}



start_logid(int mode)
{
	FILE *fp;
	char buff[180],filename[100];
	char buff1[180],buff2[180],buff3[180],buff4[180];
	int  found=No;
	int  n,nn,tt,i,i2,n1,n2,n3,n4,n5,n6;
	char big[200];
	char dbuff1[10];
	char dbuff2[10];
	time_t t;
	struct tm *tp1;
	n=nn=0;
	netmode=0;

	strcpy(auto_cmd,"");
	if (strlen(cfg.guestid)<3) strcpy(cfg.guestid,"guest");
	if (mode==0&&bit(cfg.guestmode,20)) goto quit_3;	  //전부다 손님으로 처리
	set_guest();
	//아이디 입력화면 출력
	nn=0;
	cont_1:
	n=0;
	if (nn++>9) goto quit_2;		//손님으로접속
	cls();
	if (!view("forum/main/frm/log/startid-%s.scr",now_str(18))) {
		view("forum/main/frm/log/startid.scr");
		view("forum/main/frm/log/startid.cmd");
	}

	//아이디입력
	n=0;
	cont_2:
	if (n++>5) goto quit_2;
	pf.type=0;
	strcpy(pf.id,"");
	view("forum/main/frm/log/id.scr");
	lineinput(buff1,12);
	strchng2(buff1,"[","");strchng2(buff1,"]","");strchng2(buff1,"\"","");strchng2(buff1,"\'","");

	del_space(buff1);check_han(buff1);del_esc3(buff1);printf("\n");
	if (is_same(buff1,"q")||is_same(buff1,"qq")||
		is_same(buff1,"p")||is_same(buff1,"quit")||
		is_same(buff1,"x")||is_same(buff1,"xx")) goto quit_1;
	if (strlen(buff1)==0&&bit(cfg.guestmode,21)) goto quit_2;	 //손님으로
	if (is_same(buff1,"r")||is_same(buff1,"rc")) goto quit_4;
	if (strlen(buff1)<3) goto cont_2;
	if (check_file_char(buff1,"forum/main/frm/guest/notid.chr")) {
		view("forum/main/frm/log/notid.err");
		goto cont_2;	  //금지글자있을때
	}
	//손님으로 지정된 경우
	if (is_same(cfg.guestid,buff1)||is_same(cfg.hostname,buff1)) goto quit_2;
	if (is_same(buff1,"guest")||is_same(buff1,"손님")) goto quit_2;
	if (is_same(buff1,"root")||stristr(buff1,"guest")||stristr(buff1,"손님")) goto quit_2;
	if (is_same(buff1,"new")) {do_guest();goto quit_2;}

	//자동변경ID
	strcpy(g_buff1,"");
	strcpy(g_buff2,"");

	found=read_pf(buff1);

//	  mess("1 BUFF:%s 찾기:%d  ID:'%s' TYPE:'%d'",buff1,found,pf.id,pf.type);;;;;;
//	  mess("1 BUFF:%s 찾기:%d  ID:'%s' PASS:'%s'",buff1,found,pf.id,pf.passwd);;;;;;
	del_space(pf.passwd);
	if (found&&(is_same(pf.passwd,"********")||in_file2("system/_nopass.id",pf.id))) {
		strcpy(buff2,pf.passwd);
		goto found_1;
	}

	//비밀번호입력
	cont_3:
	if (n++>10) goto cont_1;
	view("forum/main/frm/log/pass.scr");

    passinput(buff2,12);
	check_han(buff2);del_space(buff2);printf("\n");
    buff2[12]=0;

	if (is_same(buff2,"q")||is_same(buff2,"qq")||
		is_same(buff2,"p")||is_same(buff2,"pp")||
		is_same(buff2,"x")||is_same(buff2,"xx")) goto quit_1;
	if (strlen(buff1)<3) {
		view("forum/main/frm/log/badpass.log");
		goto cont_3;
	}

	if (is_same(pf.passwd,"########")) strcpy(buff2,"####");
	del_space(pf.passwd);

	strcpy(g_id,buff1);
	if (!found) {
		if (!view("forum/main/frm/log/badid.log")) printf("\n ### \"%s\" ID를 찾을수 없습니다.\n",g_id);
		goto cont_2;
	}
	else if (strcmp(buff2,pf.passwd)!=0) {
		view("forum/main/frm/log/badpass.log");
		goto cont_2;
	}
	else if (pf.type==0)	  {
		if (!view("forum/main/frm/log/in_g.log")) printf("\n ### \"%s\" ID는 가입대기중입니다.\n",g_id);
		goto cont_2;
	}
	else if (pf.type==1||in_file2("system/notlog.id",pf.id)) {
		if (!view("forum/main/frm/log/whynot.log")) printf("\n ### \"%s\" ID는 사용중지 ID입니다.\n",g_id);
		goto cont_1;
	}
	else if (pf.type==2) {
		if (!view("forum/main/frm/log/in_gnot.log")) printf("\n ### \"%s\" ID는 가입거부 ID입니다.\n",g_id);
		goto cont_1;
	}
    else if (pf.type==3||pf.type>19) {
		if (!view("forum/main/frm/log/in_del.log")) printf("\n ### \"%s\" ID는 삭제된 ID입니다.\n",g_id);
		goto cont_1;
	}

	found_1:
	//ID 새로 읽어들임
	if (check_idrelog())  {nn=0;n=0;goto cont_1;}	//이중아이디접속 금지여부 확인


	quit_0: 		//검색완료
	view("forum/main/frm/log/endid1.log");
	return;

	quit_1: 		//접속종료
	set_guest();
	view("forum/main/frm/log/endid2.log");
    log_endset();     //접속종료처리
	log_out();
	return;

	quit_2: 							 //손님으로 종료
	if (cfg.guestin==1) goto quit_1;	 //종료처리
	if (cfg.guestin==2) goto quit_4;	 //종료처리
	set_guest();
	view("forum/main/frm/log/guestlo.log");
	view("forum/main/frm/log/guestlo.ad%d",rand()%10);
	view("forum/main/frm/log/endid3.log");
	if (cfg.guestin==4) {
		view("forum/main/frm/log/guestin.scr");
		i=numinput();
		//바로가입이거나 1을 선택
		if (bit(cfg.guestmode,16)||i==1) strcpy(auto_cmd,"guest");
		else if (i==2) strcpy(auto_cmd,"guidedoc");
		else if (i==3) strcpy(auto_cmd,"guide");
		else if (i==4) strcpy(auto_cmd,"bye");
	}
	return;

	quit_3: 		//그냥종료(손님으로)
	set_guest();
	view("forum/main/frm/log/endid4.log");
	return;

	quit_4: 		//그냥종료(손님으로)
	set_guest();
	view("forum/main/frm/log/endid4.log");
	strcpy(auto_cmd,"rc");      //재접속
	return;
}



set_guest()
{
	int i,n;
	char buff[200];
	guest_mode=Yes;
	if (bit(cfg.guestmode,18)) {	  //손님 아이디를 순차번호로 지정함
        n=inc_numfile(1,"system/guest.num");
        if (n>9999999) save_numfile(1,"system/guest.num");
		sprintf(pf.id,"g%07d",n);
	}
	else {
		sprintf(buff,"%s%s",cfg.guestid,no_spc(tty));
		strchng2(buff,"tty","");strchng2(buff,"pts","t");
		del_space(buff);del_esc(buff);buff[8]=0;strcpy(pf.id,buff);
	}
	strcpy(pf.name,cfg.guestid);
	strcpy(pf.gofirst,"");
	pf.type=0;
	pf.mymode=0;
	if (bit(cfg.guestmode,18))		 //손님 아이디를 순차번호로 지정함
        pf.num=cfg.hostno*100000+inc_numfile(0,"system/guest.num")%10000;
	else
		pf.num=cfg.hostno*100000+rand()%10000;
	time(&pf.login);
	time(&pf.logout);
}


check_idrelog()
{
	char buff[100];
	MONI moni2;
	int n;
	if (!is_moni(pf.id)) return No; //->moni에 저장
	if (pf.type>=cfg.relog) {
        view("forum/main/frm/log/samelog1.log");
		return No;
	}
	view("forum/main/frm/log/samelog.log");
	moni2=moni;
	if (yesno("",No)) {
		for (n=0;n<=cfg.count_server;n++) kill_portid(n,pf.id,tty);
		view("forum/main/frm/log/samelog2.log");
		unlink_file("user/moni/user.%d.%s",cfg.hostno,tty);
	}
	return Yes;
}




//메일 도착 확인
check_new_mail()
{
	int n=0;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[BODY_MAX+500],table_name[100];

	sprintf(table_name,"mail%s",pf.id);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {return 0;}
	if ((mysql_select_db(sock,DB_MAIL)) == -1) {mysql_close(sock);return 0;}
    sprintf(query,"SELECT count(*) FROM %s where tcode='mail' and del!='D'",table_name);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres)) != NULL) {
		  if (qrow[0]) n=atoi(qrow[0]);
		}
		mysql_free_result(qres);
	}
	mysql_close(sock);
	return n;
}


check_birthday()
{
	char buff[100];
	char buff2[100];
	time_t t;

	t = time(NULL);
	strcpy(buff,now_str(17));
	if (is_same(buff,datestr(17,pf.birthday))) return Yes;
	return No;
}


record_login()
{
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	MYSQL_FIELD *qfield;
	char query[500],buff[500];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 6101: %s\n",mysql_error(&mysql));
        return;
    }
    if ((mysql_select_db(sock, DB_NAME)) == -1) {
        printf("## ERR 6102: %s\n",mysql_error(sock));
        return;
    }
    sprintf(query,"insert into loginrec
    (date,id,name,type,job,userip,login) values
    ('%s','%s','%s','%d','%d','%s','2')"
    ,now_str(19),pf.id,pf.name,pf.type,pf.job,hostname);
    if (mysql_query(sock, query) == -1) {
        printf("## ERR 6103: %s\n%s\n",mysql_error(sock),query);
        return;
    }
    mysql_close(sock);
}
