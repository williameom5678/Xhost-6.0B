//회원가입
#include "bbs.h"

main(int argc, char **argv)
{
	int n;
	char buff[100];
	if (argc<3) {
		printf("ERR:%s CLUB ID\n",argv[0]);
		return;
	}
    read_db_name("db.cfg");
	read_aname(0);	//회원DB이름 읽어서 배열에 저장
    strcpy(go.code,"top");
	strcpy(club_go.code,argv[1]);
	read_cfg();
	if (is_same(club_go.code,"main")) {mess("동호회 전용");return;}
	read_ccfg();
	club_mode=Yes;
	if (!read_pf(argv[2])) {mess("회원만 가능합니다.");return;}
	while (1) {
		if (!view("forum/%s/frm/guest/cguest.mnu",club_go.code))
			view("forum/main/frm/guest/cguest.mnu");
		lineinput(buff,20);
		n=atoi(buff);printf("\n");
		if (is_quit(buff)) break;
		else if (n==1) {
			if (!view("forum/%s/logo/cintro.mnu",club_go.code))
				view("forum/main/frm/guest/cintro.mnu");
		}
        else if (n==2) guest_norm();
		else if (n==3) cguest_check();
        else if (n==9) cguest_list();
	}
}

guest_norm() {
	FILE *fp;
	int n=0;
	int key=No,test=No;
	int found,num;
	char buff[140];
	MYSQL *sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_ROW	qrow;
	char query[5000],table_name[100];
    char intro[64000],guestok[64000];

	sprintf(table_name,"cuser_%s",club_go.code);

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 1041: %s\n%s\n",mysql_error(&mysql),query);
		exit(1);
	}
    if ((mysql_select_db(sock,DB_CM)) == -1) {
		printf("## ERR 1042: %s\n%s\n",mysql_error(sock),query);
		mysql_close(sock);
		exit(1);
	}

    //가입화면과 종결화면 읽기
    sprintf(query,"SELECT intro,guestok FROM ccfg WHERE club='%s'",club_go.code);
    if (mysql_query(sock,query) == -1) printf("## %s 동호회 환경파일 없음\n",club_go.code);
    qres = mysql_store_result(sock);
    if ((qrow = mysql_fetch_row(qres)) != NULL) {
        strcpy(intro,qrow[0]);
        strcpy(guestok,qrow[0]);
    }
    mysql_free_result(qres);

	sprintf(table_name,"cuser_%s",club_go.code);
	sprintf(query,"SELECT id,name,type FROM %s WHERE id='%s'",table_name,pf.id);

	strcpy(cpf.id,"");
	found=No;
	if (mysql_query(sock, query) == -1) {
		if (mysql_errno(sock)==1146) {	//회원DB없다
			create_db(sock,"def_cuser",table_name);
		}
		if (mysql_query(sock, query) == -1) {
			mess("## 동호회 ID 파일 생성실패");
		}
	}
	else {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres)) != NULL) {
			strcpy(cpf.id,qrow[0]);
			strcpy(cpf.name,qrow[1]);
			cpf.type=atoi(qrow[2]);
		}
	}

	if (cpf.type>=16||pf.type>=16) {
		test=Yes;  //연습
		found=Yes;
		mess("가입신청 테스트입니다.(저장안됨)");
	}
	else if (strlen(cpf.id)==0) found=Yes;
    else if (cpf.type<=1) mess("이미 가입 신청중인 아이디입니다. (등급:%d)",cpf.type);
    else if (cpf.type==2) mess("가입 금지된 아이디입니다. (등급:%d)",cpf.type);
    else if (cpf.type==3) mess("삭제 처리된 아이디입니다. (등급:%d)",cpf.type);
    else if (cpf.type>=4) mess("이미 가입이 된 아이디입니다. (등급:%d)",cpf.type);
	else found=Yes;

	if (!found) goto _fail;

	cls();
	found=No;
	n=get_age(pf);
   if (ccfg.autoguest==2) mess("이 동호회는 가입신청을 받지 않습니다.");
	else if (ccfg.stop) mess("이 동호회는 현재 임시 폐쇄 중입니다.");
	else if (ccfg.intype>0&&pf.type<ccfg.intype) mess("이 동호회에 가입할수 있는 등급이 아닙니다.");
	else if ((ccfg.gage1>0&&n<ccfg.gage1)||(ccfg.gage2>0&&n>ccfg.gage2)) mess("이 동호회에 가입할수 있는 연령이 아닙니다.");
	else found=Yes;

	if (!found) goto _fail;

	strcpy(cpf.id,pf.id);strcpy(cpf.name ,pf.name);cpf.del=' ';
	strcpy(cpf.memo1,"");strcpy(cpf.memo2,"");strcpy(cpf.memo3,"");strcpy(cpf.memo4,"");strcpy(cpf.memo5,"");
	time(&cpf.inday);
	time(&cpf.logout);
	cpf.countu=cpf.countw=cpf.countd=cpf.all_log=cpf.all_time=0;
	if (ccfg.guesttype) cpf.type=ccfg.guesttype;
	else cpf.type=2;

	cls();
    view3(intro);
	n=0;
	while (n++<7) {
		key=No;

        printf("  I  D   : %s \n\n",pf.id);
        printf("  성명   : %s \n\n",pf.name);
		if (ccfg.disp_memo1) {
            printf("  %-20.20s : ",ccfg.memo1);
            lineinput(buff,70);
            if (buff[0]!=0) strcpy(cpf.memo1,buff);
			if (is_same(buff,"q")) {key=No;break;}
            printf("\n");
		}
        if (ccfg.disp_memo2) {
            printf("  %-20.20s : ",ccfg.memo2);
            lineinput(buff,70);
            if (buff[0]!=0) strcpy(cpf.memo2,buff);
			if (is_same(buff,"q")) {key=No;break;}
            printf("\n");
		}
        if (ccfg.disp_memo3) {
            printf("  %-20.20s : ",ccfg.memo3);
            lineinput(buff,70);
            if (buff[0]!=0) strcpy(cpf.memo3,buff);
			if (is_same(buff,"q")) {key=No;break;}
            printf("\n");
		}
        if (ccfg.disp_memo4) {
            printf("  %-20.20s : ",ccfg.memo4);
            lineinput(buff,70);
            if (buff[0]!=0) strcpy(cpf.memo4,buff);
			if (is_same(buff,"q")) {key=No;break;}
            printf("\n");
		}
        if (ccfg.disp_memo5) {
            printf("  %-20.20s : ",ccfg.memo5);
            lineinput(buff,70);
            if (buff[0]!=0) strcpy(cpf.memo5,buff);
			if (is_same(buff,"q")) {key=No;break;}
            printf("\n");
		}

        printf("  가입신청(Y) 다시(N) 취소(Q) >>");
		lineinput(buff,4);check_han(buff);
		buff[0]=tolower(buff[0]);
		if (strcmp(buff,"99")==0) {key=Yes;break;}
		if (buff[0]=='y') {key=Yes;break;}
		if (buff[0]=='q') {key=No ;break;}
		if (buff[0]=='n') {key=No ;n=0;}
	}
	if (!key) goto _fail;
	if (cpf.del!='D') cpf.del=' ';

	sprintf (query,"insert into %s (
	id,name,type,del,
	memo1,memo2,memo3,memo4,memo5,
	inday,
	countw,countu,countd,all_log,all_time,month_log,month_time)
	values(
	'%s','%s','%d','%c',
	'%s','%s','%s','%s','%s',
	'%s',
	0,0,0,0,0,0,0)",
	table_name,
	cpf.id,cpf.name,cpf.type,cpf.del,
	cpf.memo1,cpf.memo2,cpf.memo3,cpf.memo4,cpf.memo5,
	now_str(19));

	if (!test&&mysql_query(sock, query) == -1) {
		if (mysql_errno(sock)==1146) {	//회원DB없다
			create_db(sock,"def_cuser",table_name);
		}
		if (mysql_query(sock, query) == -1) {	//다시시도
			printf("## ERR 1114: %s\n%s\n",mysql_error(sock),query);
			mysql_close(sock);
			exit(1);
		}
	}

    view3(guestok);
    mysql_close(sock);
    mess("가입신청이 끝났습니다.");
	return;

	_fail:
	mess("가입신청이 취소 되었습니다.");
}

//동호회 가입확인
cguest_check()
{
	FILE *fp;
	int n=0,count=0;
	int key=No;
	int found,num;
	CPF cpf;
	char buff[140];
	MYSQL *sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_ROW	qrow;
	char query[5000],table_name[100];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 1001: %s\n%s\n",mysql_error(&mysql),query);
		exit(1);
	}
    if ((mysql_select_db(sock, DB_CM)) == -1) {
		printf("## ERR 1002: %s\n%s\n",mysql_error(sock),query);
		mysql_close(sock);
		exit(1);
	}
	sprintf(table_name,"cuser_%s",club_go.code);
	sprintf(query,"SELECT id,name,type FROM %s WHERE id='%s'",table_name,pf.id);

	if (mysql_query(sock, query) == -1) {
		printf("## ERR 1003: %s\n%s\n",mysql_error(sock),query);
		mysql_close(sock);
		exit(1);
	}

	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL) {
		strcpy(cpf.id,qrow[0]);
		strcpy(cpf.name,qrow[1]);
		cpf.type=atoi(qrow[2]);
	}
		 if (cpf.type<=1) mess("이미 가입 신청중인 아이디입니다.");
	else if (cpf.type==2) mess("가입 금지된 아이디입니다.");
	else if (cpf.type==3) mess("삭제 처리된 아이디입니다.");
	else if (cpf.type>=4) mess("이미 가입이 된 아이디입니다.");
	else mess("아직 가입이 되어 있지 않습니다.");
	mysql_free_result(qres);
	mysql_close(sock);
}


//동호회회원목록
cguest_list()
{
    int count=0;
    MYSQL *sock,mysql;
    MYSQL_RES   *qres;
    MYSQL_ROW   qrow;
    char query[5000],table_name[100];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 1001: %s\n%s\n",mysql_error(&mysql),query);
        exit(1);
    }
    if ((mysql_select_db(sock, DB_CM)) == -1) {
        printf("## ERR 1002: %s\n%s\n",mysql_error(sock),query);
        mysql_close(sock);
        exit(1);
    }
    sprintf(table_name,"cuser_%s",club_go.code);
    sprintf(query,"SELECT num,id,name,type,inday FROM %s",table_name);

    if (mysql_query(sock, query) == -1) {
        printf("## ERR 1003: %s\n%s\n",mysql_error(sock),query);
        mysql_close(sock);
        exit(1);
    }

    printf("  번호  아이디    이름     등급 가입일자\n");
    qres = mysql_store_result(sock);
    while ((qrow = mysql_fetch_row(qres)) != NULL) {
        cpf.num=atoi(qrow[0]);
        strcpy(cpf.id,qrow[1]);
        strcpy(cpf.name,qrow[2]);
        cpf.type=atoi(qrow[3]);
        cpf.inday=str2date2(qrow[4]);
        if (strlen(cpf.id)) {
            printf("%5d. %-10s %-10s %2d %s\n",cpf.num,cpf.id,cpf.name,cpf.type,datestr(8,cpf.inday));
            count++;
        }
    }
    mysql_free_result(qres);
    mysql_close(sock);
    mess("총 %d 명의 회원 출력이 끝났습니다.\n",count);
}
