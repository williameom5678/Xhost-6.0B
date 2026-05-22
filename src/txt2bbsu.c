#include "bbs.h"
#include "oldbbs.h"

conv_xhost()
{
	int n;
	char table_name[100];
	sprintf(table_name,"%s_%s",club_go.code,go.code);
	while (1) {
		sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
		cls();
		print_(1," 기타 형식 변환 %s[%s] %s (%d)",club_go.code,go.code,ccfg.name,NOW_ALLNO);
        printf(" 1. XHOST1  전체게시판 변환\n");
        printf(" 2. XHOST1  전체게시판 변환 (삭제후)\n");
        printf(" 3. XHOST1  자료실파일 변환 (자료실변환후)\n");
        printf(" 4. XHOST1  ID 변환\n");
        printf(" 5. XHOST1  %s 동호회 회원 ID 변환\n",club_go.code);
        printf(" 6. XHOST1  메일변환\n");
        printf(" 7. XHOST1  메일변환(삭제후)\n");
		n=numselect();
		if (n<=0) break;
        else if (n==1) old_new(1);
        else if (n==2) old_new(2);
        else if (n==3) old_pds(1);
        else if (n==4) old_id();
        else if (n==5) old_cid();
        else if (n==6) old_mail(1);
        else if (n==7) old_mail(2);
	}
}


conv_koma()
{
	int n;
	char table_name[100];
	sprintf(table_name,"%s_%s",club_go.code,go.code);
	while (1) {
		sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
		cls();
		print_(1," 기타 형식 변환 %s[%s] %s (%d)",club_go.code,go.code,ccfg.name,NOW_ALLNO);
        printf(" 1. KOMA 자료실 -> XHOST 2 변환 (%s)\n",table_name);
        printf(" 2. KOMA 변환\n");
        printf(" 3. KOMA 변환(삭제후)\n");
        printf(" 4. KOMA ID 변환 (convert/id.out)\n");
        printf(" 5. KOMA ID 변환 (convert/id.out) (삭제후)\n");
        printf(" 6. KOMA 메일 변환 (convert/komamail/)\n");
        printf(" 7. KOMA 메일 변환 (convert/komamail/)(삭제후 변환)\n");
        printf(" 8. KOMA 메일 자료실 변환 (mv 이동처리/mail변환완료후작업)\n");
        printf(" 9. KOMA ID 가입날짜 변환 (convert/D_newuser)\n");
        printf("10. KOMA %s 게시판 변환 (convert/komadata/%s_%s.out)\n",go.code,club_go.code,go.code);
        printf("11. KOMA %s 게시판 변환 (convert/komadata/%s_%s.out) (삭제후변환)\n",go.code,club_go.code,go.code);
		n=numselect();
		if (n<=0) break;
        else if (n==1) old_pds(2);
        else if (n==2) koma(1);
        else if (n==3) koma(2);
        else if (n==4) xformat_id(1,"convert/id.out");
        else if (n==5) xformat_id(2,"convert/id.out");
        else if (n==6) koma_mail(1);
        else if (n==7) koma_mail(2);
        else if (n==8) koma_mail2();
        else if (n==9) koma_inday();
        else if (n==10) koma(3);
        else if (n==11) koma(4);
	}
}


conv_bbs()
{
	int n;
	char table_name[100];
	sprintf(table_name,"%s_%s",club_go.code,go.code);
	while (1) {
		sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
		cls();
		print_(1," 기타 형식 변환 %s[%s] %s (%d)",club_go.code,go.code,ccfg.name,NOW_ALLNO);
		printf("  1. WWW 날짜/제목 1         \n");
		printf("  2. WWW 날짜/제목 2         \n");
		printf("  3. KIDS 게시판 자동 등록  글쓴이:/날  짜:/제  목:\n");
		printf("  4. 파일+\'\'[[형식TEXT자동 등록\n");
		printf(" 91. XFORMAT 자료 등록 (자료추가)\n");
		printf(" 92. XFORMAT 자료 출력 (자료추출)\n");
		n=numselect();
		if (n<=0) break;
		else if (n==1 ) www_bbs(1);
		else if (n==2 ) www_bbs(2);
		else if (n==3 ) kids_bbs();
		else if (n==4 ) txt_bbs2();
        else if (n==91) xformat1("",table_name,0,0);
		else if (n==92) xformat2("");
	}
}


old_new(int mode)
{
	FILE *fp1,*fp2;
	int count,i,ii,i2;
	char ch;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[100];
	char body[BODY_MAX];
	OLDBBS oldbbs;

	sprintf(NOW_FILE ,"forum/%s/menu/%s.tit",club_go.code,go.code);
	strchng(NOW_FILED,NOW_FILE,".tit",".txt");
	if (!is_file(NOW_FILE)) {mess("자료를 읽을 %s 화일이 없습니다.",NOW_FILE);return;}
	printf("\n");
	printf("게시물디렉토리-> 메인:menu  동호회:forum/동호회코드/menu\n");

	fp1=fopen(NOW_FILE,"r");
	fp2=fopen(NOW_FILED,"r");
	if (fp1==NULL) {
		mess("%s 파일이 없습니다.",NOW_FILE);
		goto _fail;
	}

	fseekend(fp1);
	NOW_ALLNO=ftell(fp1)/sizeof_oldbbs;
	fseektop(fp1);

	printf(" ## 파일명: %s (%d Byte)\n",NOW_FILE,file_size(NOW_FILE));
	printf(" ## %d 게시물 자료가 있습니다. 변환할까요?",NOW_ALLNO);
    if (!yesno2("(Y/n)>>",Yes))  {
		fclose(fp1);
		goto _fail;
	}

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 6101: %s\n",mysql_error(&mysql));
		goto _fail;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 6102: %s\n",mysql_error(sock));
		mysql_close(sock);
		goto _fail;
	}
	if (mode==2) drop_table(table_name);
	count=0;
	while(fread(&oldbbs,sizeof_oldbbs,1,fp1)) {
		if (oldbbs.size<0||oldbbs.size>1000000) oldbbs.size=100000;
		ii=0;
		i2=0;
		bzero(body,BODY_MAX);
		if (fp2!=NULL) {
			fseek(fp2,oldbbs.posi,SEEK_SET);
			oldbbs.line=0;
			for (i=0;i<oldbbs.size&&!feof(fp2)&&i2<BODY_MAX;i++) {
				ch=fgetc(fp2);
				if (ch==0||ch==-1) break;
				if (ch=='\n') oldbbs.line++;
				else if (ch=='\\') body[i2++]='\\';
				else if (ch=='\'') body[i2++]='\\';
				else if (ch=='\"') body[i2++]='\"';
				body[i2++]=ch;
				ii++;
			}
		}

		oldbbs.size=ii;
		printf("추가->%5d. %-8s %-8s %-30.30s\n",oldbbs.num,oldbbs.id,oldbbs.name,oldbbs.title);
		strcpy(bbs.id,oldbbs.id);
		strcpy(bbs.name,oldbbs.name);
		strcpy(bbs.passwd,oldbbs.passwd);
		strcpy(bbs.title,oldbbs.title);
		strcpy(bbs.keyword, oldbbs.key);
		strcpy(bbs.tcode,	oldbbs.tcode);
		strcpy(bbs.tclub,	club_go.code);
        strcpy(bbs.tid,"");
		strcpy(bbs.homepage,"");
		strcpy(bbs.email,	"");
		strcpy(bbs.userip,	"");
		strcpy(bbs.filename,oldbbs.filename);
        bbs.date=oldbbs.date;
        bbs.date2=oldbbs.date2;
		bbs.fcount=0;
		bbs.filesize=oldbbs.filesize;
		bbs.size=oldbbs.size;
		bbs.line=oldbbs.line;
		bbs.hits=oldbbs.read;
		bbs.down=oldbbs.down;
		bbs.ok=oldbbs.ok%1000;
		bbs.no=(oldbbs.ok/1000)%1000;
		bbs.good=0;
		if (oldbbs.gd>='!') bbs.good=oldbbs.gd-'!';
		else if (oldbbs.gd>0) bbs.good=oldbbs.gd;
		if (bbs.good<1) bbs.good=0;
		if (bbs.good>=10) bbs.good=10;
		bbs.del=' ';
        if (oldbbs.del==68||oldbbs.del==1||oldbbs.del=='d'||oldbbs.del=='D') bbs.del='D';
		bbs.color=bbs.tag=bbs.tag2=bbs.link1=bbs.link2=bbs.link3=0;

		add_table(0,sock,table_name,body);
		count++;
	}
	fclose(fp1);
	if (fp2!=NULL) fclose(fp2);
	mysql_close(sock);
	mess(" 총 %d 자료 추가됨",count);
	return;

	_fail:
	mess(" 자료 추가 취소");
	return;
}

//자료실변환
//코마 자료실 변환
old_pds(int mode)
{
	char dir[500],buff[500],new_filename[500],old_filename[500];
	int count,mail_mode=No;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
    char query[5000],table_name[100];
	strcpy(db_name,DB_NAME);

	printf("자료실 파일디렉토리위치는 다음과 같아야 합니다.\n");
	if (mode==1) printf("-> 메인:pds/%s/파일명 -> 동호회:forum/%s/pds/%s/파일명\n",go.code,club_go.code,go.code);
	else if (mode==2) printf("-> pds/%s/Bin/파일명\n",go.code);

	sprintf(table_name,"%s_%s",club_go.code,go.code);
	if (mail_mode) strcpy(db_name,DB_MAIL);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock, db_name)) == -1) {
		printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
	sprintf(query,"SELECT * FROM %s",table_name);
	if (mysql_query(sock, query) == -1) {
		printf("자료없음\n");
		mysql_close(sock);
		return;
	}
	qres = mysql_store_result(sock);
	sprintf(dir,"pds/%s/%s",club_go.code,go.code);
	check_dir(dir);
	count=0;
	while ((qrow = mysql_fetch_row(qres))!=NULL) {
		qrow2bbs(qrow);
		if (!strlen(bbs.filename)) continue;
		sprintf(new_filename,"%s/%s.%x",dir,bbs.filename,(int)bbs.fcount);
		if (is_file(new_filename)) {
			printf("%d.%s %s 파일있음 (SKIP)\n",count,table_name,new_filename);
			continue;
		}
		else if (mode==1&&is_same(club_go.code,"main")) {
			sprintf(old_filename,"pds/%s/%s",go.code,bbs.filename);
		}
		else if (mode==1&&!is_same(club_go.code,"main")) {
			sprintf(old_filename,"forum/%s/pds/%s/%s",club_go.code,go.code,bbs.filename);
		}
		else if (mode==2) {
			sprintf(old_filename,"pds/%s/Bin/%s",go.code,bbs.filename);
            if (!is_file(old_filename)) {
                sprintf(old_filename,"pds/%s/Bin/%02d/%s",go.code,bbs.fcount,bbs.filename);
                if (!is_file(old_filename)) {
                    sprintf(old_filename,"pds/%s/Bin/%02d%s",go.code,bbs.fcount,bbs.filename);
                    if (!is_file(old_filename)) {
                        sprintf(old_filename,"pds/%s/Bin/00%s",go.code,bbs.filename);
                    }
                }
            }
		}


		if (!is_file(old_filename)) {
			printf("%d.%s %s 파일없음\n",count,table_name,old_filename);
			continue;
		}
		sprintf(buff,"mv %s %s",old_filename,new_filename);
		system(buff);
		printf("%d.%s %s\n",++count,table_name,buff);
	}
	mysql_close(sock);
	mysql_free_result(qres);
	mess("### 총 %d 자료 변환이 끝났습니다.\n",count);
}


//이전버젼 ID 변환
old_id()
{
	FILE *fp1,*fp2;
	int count,i,ii,i2,found;
	char ch;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char id_file[500];
	char table_name[100];
	char body[BODY_MAX],query[BODY_MAX];
	char login[100],logout[100],birthday[100],inday[100];
	OLDPF oldpf;

	sprintf(id_file,"id/id.dat");
	if ((fp1=fopen(id_file,"r"))==NULL) {
		mess("%s 파일이 없습니다.",id_file);
		goto _fail;
	}

	fseekend(fp1);
	NOW_ALLNO=ftell(fp1)/sizeof_oldpf;
	fseektop(fp1);

	printf(" ## 파일명: %s (%d Byte)\n",id_file,file_size(id_file));
	printf(" ## %d ID 자료가 있습니다. 변환할까요?",NOW_ALLNO);
    if (!yesno2("(Y/n)>>",Yes))  {
		fclose(fp1);
		goto _fail;
	}

	sprintf(table_name,"user");
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 6101: %s\n",mysql_error(&mysql));
		goto _fail;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 6102: %s\n",mysql_error(sock));
		mysql_close(sock);
		goto _fail;
	}
	count=0;
	while (fread(&oldpf,sizeof_oldpf,1,fp1)) {
		if (strlen(oldpf.id)<3||strlen(oldpf.name)<1) continue;

		sprintf(query,"SELECT count(*) FROM %s where id='%s'",table_name,oldpf.id);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres)) != NULL) {
				if (qrow[0]&&atoi(qrow[0])) {
					mysql_free_result(qres);
					printf("SKIP->%5d. %-8s %-8s 회원중복\n",count+1,oldpf.id,oldpf.name);
					continue;
				}
			}
			mysql_free_result(qres);
		}

		strcpy(pf.id,oldpf.id);
		strcpy(pf.name,oldpf.name);
		strcpy(pf.passwd,oldpf.passwd);
		strcpy(pf.eid,oldpf.email);
		strcpy(pf.email,oldpf.mailid);
		pf.sex=oldpf.sex;
		pf.birthday=oldpf.birthday;
		pf.job=oldpf.job%20;
		strcpy(pf.gofirst,oldpf.gofirst);
		strcpy(pf.memo1,oldpf.memo1);
		strcpy(pf.memo2,oldpf.memo2);
		strcpy(pf.memo3,oldpf.user1);
		strcpy(pf.memo4,oldpf.user2);
		strcpy(pf.memo5,oldpf.user3);
		strcpy(pf.memo6,oldpf.user4);
		strcpy(pf.id_no,oldpf.id_no);
		strcpy(pf.post,oldpf.pos1);
		strcpy(pf.addr1,oldpf.addr);
		strcpy(pf.addr2,oldpf.add2);
		strcpy(pf.tele,oldpf.tele);
		sprintf(pf.hand,"%s %s",oldpf.hand,oldpf.bibi);
		strcpy(pf.offi,oldpf.offi);
		pf.level=oldpf.level;
		pf.point=oldpf.point;
		pf.myflag=oldpf.myflag;
		pf.inday=oldpf.inday;
		pf.login=oldpf.login;
		pf.logout=oldpf.logout;
		pf.all_log=oldpf.all_log;
		pf.month_log=oldpf.month_log;
		pf.all_time=oldpf.all_time;
		pf.month_time=oldpf.month_time;
		pf.mymode=oldpf.mymode;
		pf.offmin=oldpf.offmin;
		pf.down  =oldpf.down  ;
		pf.countw=oldpf.countw;
		pf.countu=oldpf.countu;
		pf.countd=oldpf.countd;
		if (oldpf.type>0&&oldpf.type<5) pf.type=5;
		else pf.type=oldpf.type;
		if (oldpf.type==0) pf.del='D';
		else pf.del=' ';



		addslashes(pf.passwd,sizeof(pf.passwd));
		addslashes(pf.addr1,sizeof(pf.addr1));
		addslashes(pf.addr2,sizeof(pf.addr2));
		addslashes(pf.tele,sizeof(pf.tele));
		addslashes(pf.id_no,sizeof(pf.id_no));
		addslashes(pf.offi,sizeof(pf.offi));
		addslashes(pf.hand,sizeof(pf.hand));
		addslashes(pf.memo1,sizeof(pf.memo1));
		addslashes(pf.memo2,sizeof(pf.memo2));
		addslashes(pf.memo3,sizeof(pf.memo3));
		addslashes(pf.memo4,sizeof(pf.memo4));
		addslashes(pf.memo5,sizeof(pf.memo5));
		addslashes(pf.memo6,sizeof(pf.memo6));
		addslashes(pf.memo7,sizeof(pf.memo7));
		addslashes(pf.memo8,sizeof(pf.memo8));
		addslashes(pf.gofirst,sizeof(pf.gofirst));
		addslashes(pf.email,sizeof(pf.email));
		addslashes(pf.eid,sizeof(pf.eid));

		printf("추가->%5d. %-8s %-8s 등급:%d -> %d\n",count+1,oldpf.id,oldpf.name,oldpf.type,pf.type);

		strcpy(inday,datestr(19,pf.inday));
		strcpy(login,datestr(19,pf.login));
		strcpy(logout,datestr(19,pf.logout));
		strcpy(birthday,datestr(19,pf.birthday));

		sprintf(query, "insert into user (
		id,eid,name,passwd,
		id_no,email,del,

		post,addr1,addr2,
		tele,hand,birthday,
		offi,job,

		memo1,memo2,memo3,memo4,
		memo5,memo6,memo7,memo8,
		mymode,offmin,down,myflag,
		level,point,
		all_log,all_time,month_log,month_time,
		countw,countd,countu,
		inday,login,logout,type
		)
		values (
		'%s','%s','%s','%s',
		'%s','%s','%c',

		'%s','%s','%s',
		'%s','%s','%s',
		'%s','%d',

		'%s','%s','%s','%s',
		'%s','%s','%s','%s',
		'%d','%d','%d','%d',
		'%d','%d',
		'%d','%d','%d','%d',
		'%d','%d','%d',
		'%s','%s','%s','%d'
		);",
		pf.id,pf.eid,pf.name,pf.passwd,
		pf.id_no,pf.email,pf.del,

		pf.post,pf.addr1,pf.addr2,
		pf.tele,pf.hand,birthday,
		pf.offi,pf.job,

		pf.memo1,pf.memo2,pf.memo3,pf.memo4,
		pf.memo5,pf.memo6,pf.memo7,pf.memo8,
		pf.mymode,pf.offmin,pf.down,pf.myflag,
		pf.level,pf.point,
		pf.all_log,pf.all_time,pf.month_log,pf.month_time,
		pf.countw,pf.countd,pf.countu,
		inday,login,logout,pf.type
		);


		count++;
		if (mysql_query(sock, query) == -1) {
			printf("\n%s\n",query);
			printf("## ERR 3219: %s\n",mysql_error(sock));
			buff2file(query,"tmp/err3214.tmp");
			pressenter();
			return;
		}
	}
	fclose(fp1);
	mysql_close(sock);
	mess(" 총 %d 자료 추가됨",count);
	return;

	_fail:
	mess(" 자료 추가 취소");
	return;
}

old_cid()
{
	FILE *fp1,*fp2;
	int count,i,ii,i2,found;
	char ch;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char id_file[500];
	char table_name[100];
	char body[BODY_MAX],query[BODY_MAX];
	char login[100],logout[100],birthday[100],inday[100];
    OLDCPF oldcpf;
    if (strlen(club_go.code)<1||is_same(club_go.code,"main")) {
        mess("동호회 전용");
		goto _fail;
    }

    sprintf(id_file,"forum/%s/system/clubid.dat",club_go.code);
    printf(" ## 이전 동호회 ID 파일명: %s (%d Byte)\n",id_file,file_size(id_file));
	if ((fp1=fopen(id_file,"r"))==NULL) {
		mess("%s 파일이 없습니다.",id_file);
		goto _fail;
	}

	fseekend(fp1);
    NOW_ALLNO=ftell(fp1)/sizeof_oldcpf;
	fseektop(fp1);

    printf(" ## %d ID 동호회 회원 자료가 있습니다. 변환할까요?",NOW_ALLNO);
    if (!yesno2("(Y/n)>>",Yes))  {
		fclose(fp1);
		goto _fail;
	}

    sprintf(table_name,"cuser_%s",club_go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 6331: %s\n",mysql_error(&mysql));
		goto _fail;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
        printf("## ERR 6332: %s\n",mysql_error(sock));
		mysql_close(sock);
		goto _fail;
	}
	count=0;
    while (fread(&oldcpf,sizeof_oldcpf,1,fp1)) {
        if (strlen(oldcpf.id)<3||strlen(oldcpf.name)<1) continue;

        sprintf(query,"SELECT count(*) FROM %s where id='%s'",table_name,oldcpf.id);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres)) != NULL) {
				if (qrow[0]&&atoi(qrow[0])) {
					mysql_free_result(qres);
                    printf("SKIP->%5d. %-8s %-8s 회원중복\n",count+1,oldcpf.id,oldcpf.name);
					continue;
				}
			}
			mysql_free_result(qres);
		}

        strcpy(cpf.id,oldcpf.id);
        strcpy(cpf.name,oldcpf.name);
        strcpy(cpf.memo1,oldcpf.memo1);
        strcpy(cpf.memo2,oldcpf.memo2);
        strcpy(cpf.memo3,oldcpf.memo3);
        strcpy(cpf.memo4,oldcpf.memo4);
        strcpy(cpf.memo5,oldcpf.memo5);
        cpf.inday=oldcpf.inday;
        cpf.logout=oldcpf.logout;
        cpf.all_log=oldcpf.all_log;
        cpf.month_log=oldcpf.month_log;
        cpf.all_time=oldcpf.all_time;
        cpf.month_time=oldcpf.month_time;
        cpf.countw=oldcpf.countw;
        cpf.countu=oldcpf.countu;
        cpf.countd=oldcpf.countd;
        if (oldcpf.type>0&&oldcpf.type<5) cpf.type=5;
        else cpf.type=oldcpf.type;
        if (oldcpf.type==0) cpf.del='D';
        else cpf.del=' ';

        addslashes(cpf.id,sizeof(cpf.id));
        addslashes(cpf.memo1,sizeof(cpf.memo1));
        addslashes(cpf.memo2,sizeof(cpf.memo2));
        addslashes(cpf.memo3,sizeof(cpf.memo3));
        addslashes(cpf.memo4,sizeof(cpf.memo4));
        addslashes(cpf.memo5,sizeof(cpf.memo5));

        printf("추가->%5d. %-8s %-8s 등급:%d -> %d\n",count+1,oldcpf.id,oldcpf.name,oldcpf.type,cpf.type);

        strcpy(inday,datestr(19,cpf.inday));
        strcpy(logout,datestr(19,cpf.logout));

        sprintf(query, "insert into %s (
        id,name,del,
        memo1,memo2,memo3,memo4,memo5,

        all_log,all_time,month_log,month_time,
		countw,countd,countu,
        inday,logout,type
		)
		values (
		'%s','%s','%c',
        '%s','%s','%s','%s','%s',

		'%d','%d','%d','%d',
		'%d','%d','%d',
        '%s','%s','%d'
		);",
        table_name,
        cpf.id,cpf.name,cpf.del,

        cpf.memo1,cpf.memo2,cpf.memo3,cpf.memo4,cpf.memo5,
        cpf.all_log,cpf.all_time,cpf.month_log,cpf.month_time,
        cpf.countw,cpf.countd,cpf.countu,
        inday,logout,cpf.type
		);

        count++;
		if (mysql_query(sock, query) == -1) {
            if (mysql_errno(sock)==1146) {  //DB없다
                create_db(sock,"def_cuser",table_name);
                sleep(1);
                fflush(NULL);
            }
            if (mysql_query(sock, query) == -1) {
                printf("\n%s\n",query);
                printf("## ERR 3219: %s\n",mysql_error(sock));
                buff2file(query,"tmp/err3219.tmp");
                pressenter();
                return;
            }
		}
	}
	fclose(fp1);
	mysql_close(sock);
	mess(" 총 %d 자료 추가됨",count);
	return;

	_fail:
	mess(" 자료 추가 취소");
	return;
}

//mode=2 이면 먼저 drop
koma(int mode)
{
	FILE *fp;
	char filename[100];
	char buff[500],buff1[500],buff2[500],code[500];
	char table_name[100];

    if (mode==3||mode==4) {
        sprintf(table_name,"%s_%s",club_go.code,go.code);
        sprintf(buff,"convert/komadata/%s.out",table_name);
		if (is_file(buff)) {
            xformat1(buff,table_name,0,mode-2);
		}
		else {
			printf(" file %s Not found\n",buff);
		}
        return;
    }

	strcpy(filename,"convert/list.dat");
	if ((fp=fopen(filename,"r"))==NULL) {
		printf("%s FILE Not found\n",filename);
		return;
	}

	while (fgets(buff,300,fp)) {
		if (strlen(buff)<3) continue;
		if (buff[0]=='#'||buff[0]==';') continue;
		//타입,디렉토리,outcode
		strcpy(buff1,"");strcpy(buff2,"");strcpy(code,"");
		sscanf(buff,"%s %s %s",buff1,buff2,code);
		if (strlen(buff2)<1) continue;
		if (strlen(code)<1) continue;
		sprintf(table_name,"%s",code);
		sprintf(buff,"convert/komadata/%s.out",code);
		if (is_file(buff)) {
            xformat1(buff,table_name,0,mode);
		}
		else {
			printf(" file %s Not found\n",buff);
		}
	}
	fclose(fp);
}


//모든 회원의 영문명을 검사하여 변환한다.
koma_mail(int mode)
{
	FILE *fp;
    int n,n1,n2,i1,ii;
    char filename[1200];
    char buff[1500],buff1[500],buff2[500],code[500];
	char table_name[100];
    MYSQL *sock,mysql;
    MYSQL_RES *qres;
    MYSQL_ROW qrow;
    char query[50000];

    check_dir("mailbin");

    i1=0;
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 4131: %s\n",mysql_error(&mysql));
        return;
    }
    if ((mysql_select_db(sock,DB_NAME)) == -1) {
        printf("## ERR 4132: %s\n",mysql_error(sock));
        mysql_close(sock);
        return;
    }
    sprintf(query,"SELECT * FROM user");
    if (mysql_query(sock, query) == -1) {
        printf("## ERR %s\n",mysql_error(sock));
        return ;
    }
    qres = mysql_store_result(sock);
    ii=0;
    while ((qrow = mysql_fetch_row(qres))!=NULL) {
        qrow2pf(qrow);
        if (strlen(pf.id)<1||strlen(pf.id)>30) continue;
        if (strlen(pf.eid)<1) strcpy(pf.eid,pf.id);
        i1++;
        printf("%5d. %-10s (%-10s N:%6d) %s.out",i1,pf.id,pf.name,pf.num,pf.eid);
        sprintf(filename,"convert/komamail/%s.out",pf.eid);
        if (strlen(pf.eid)<2||strlen(pf.eid)>20||!is_file(filename)) {
            printf(" --> skip \n");
            continue;
        }
        printf("\n");
        sprintf(table_name,"mail%s",pf.id);
        if ((mysql_select_db(sock,DB_MAIL)) == -1) {
            printf("## ERR 6102: %s\n",mysql_error(sock));
        }
        if (create_db2(sock,"def_bbs",table_name)) {
            xformat1(filename,table_name,2,mode); //메일입력
        }
        mysql_select_db(sock,DB_NAME);
    }
    mysql_free_result(qres);
    fflush(NULL);
    mysql_query(sock,"Flush tables");
    mysql_close(sock);
    sync();
}




//모든 회원의 영문명을 검사하여 변환한다.
koma_mail2()
{
	FILE *fp;
	int ii;
    char filename[1200];
    char buff[1500],buff1[500],buff2[500],code[500];
	char table_name[100];
    MYSQL *sock,mysql,*sock2,mysql2;
    MYSQL_RES *qres,*qres2;
    MYSQL_ROW qrow,qrow2;
    char query[50000];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 4131: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 4132: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
    if (!(sock2= mysql_connect(&mysql2,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 4131: %s\n",mysql_error(&mysql2));
        return;
    }
    if ((mysql_select_db(sock2,DB_MAIL)) == -1) {
        printf("## ERR 4132: %s\n",mysql_error(sock2));
        mysql_close(sock2);
        return;
    }
    sprintf(query,"SELECT * FROM user");
	if (mysql_query(sock, query) == -1) {
		printf("## ERR %s\n",mysql_error(sock));
		return;
	}
    check_dir("mailbin");
	qres = mysql_store_result(sock);
	ii=0;
	while ((qrow = mysql_fetch_row(qres))!=NULL) {
		qrow2pf(qrow);
        if (strlen(pf.id)<1||strlen(pf.id)>30) continue;
        if (strlen(pf.eid)<1) strcpy(pf.eid,pf.id);
        printf("%5d. %-10s (%-10s) %-10s\n",++ii,pf.id,pf.name,pf.eid);
        if (strlen(pf.eid)>20)  continue;
            sprintf(table_name,"mail%s",pf.id);
            sprintf(query,"SELECT * FROM %s",table_name);
            if (mysql_query(sock2, query) == -1) continue;
            qres2 = mysql_store_result(sock2);
            while ((qrow2 = mysql_fetch_row(qres2))!=NULL) {
                qrow2bbs(qrow2);
//                if (strlen(bbs.filename)<1) continue;
//            printf("%s",mysql_error(sock2));
//                printf("F:%s FC:%d\n",bbs.filename,bbs.fcount);
                sprintf(filename,"convert/account/%c/%s/mailbox/%02d%s",pf.eid[0],pf.eid,bbs.fcount,bbs.filename);
                if (!is_file(filename)) sprintf(filename,"convert/account/%c/%s/mailwt/%02d%s",pf.eid[0],pf.eid,bbs.fcount,bbs.filename);
                if (!is_file(filename)) continue;
                sprintf(buff,"mv -f %s mailbin/%s.%x",filename,bbs.filename,bbs.fcount);
                system(buff);
                printf("%s\n",buff);
//                printf("%s F:%s FC:%d\n",buff,bbs.filename,bbs.fcount);
            }
            mysql_free_result(qres2);
	}
	mysql_free_result(qres);
    mysql_close(sock);
    mysql_close(sock2);
}



//가입날짜 새로
#include <dirent.h>    //디렉토리 화일명 변환함수때문에 필요
koma_inday()
{
	FILE *fp;
    int ii,i;
    char filename[1200];
    char buff[1500],buff1[500],buff2[500],id[500];
	char table_name[100];
    MYSQL *sock,mysql,*sock2,mysql2;
    MYSQL_RES *qres,*qres2;
    MYSQL_ROW qrow,qrow2;
    char query[50000];
    DIR *dp;
	struct dirent *dfp;

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 4131: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 4132: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}

    sprintf(buff1,"convert/D_newuser");
    dp=opendir(buff1);
    while((dfp=readdir(dp))!= NULL) {
        if (strlen(dfp->d_name)<5) continue;
        if (strstr(dfp->d_name,".")) continue;
        sprintf(filename,"%s/%s",buff1,dfp->d_name);
        if ((fp=fopen(filename,"r"))==NULL) continue;
        fread(&buff,100,1,fp);
        bzero(id,100);
        for (i=0;i<20;i++) {
            if (buff[i]=='|') break;
            id[i]=buff[i];
        }
        fclose(fp);
        strcpy(buff,dfp->d_name);
        if (buff[0]=='1') sprintf(buff2,"20%c%c/%c%c/%c%c %c%c:%c%c:%c%c",
        buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],
        buff[7],buff[8],buff[9],buff[10],buff[11],buff[12]);
        else sprintf(buff2,"19%c%c/%c%c/%c%c %c%c:%c%c:%c%c",
        buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],
        buff[6],buff[7],buff[8],buff[9],buff[10],buff[11]);
        sprintf(query,"update user set inday='%s' where id='%s' and inday='2000-01-01 00:00:00'",buff2,id);
        printf("%s\n",query);
        mysql_query(sock,query);
        sprintf(query,"update user set logout='%s' where id='%s' and logout='2000-01-01 00:00:00'",buff2,id);
        mysql_query(sock,query);
        sprintf(query,"update user set logout='%s' where id='%s' and logout=''",buff2,id);
        mysql_query(sock,query);
    }
    closedir(dp);

	mysql_close(sock);
	re_print=Yes;
}


//모든 회원의 메일을 가져온다. (파일변환도 같이한다.)
old_mail(int mode)
{
    FILE *fp1,*fp2;
    int i,ii,i1,i2,i3,count,count_man;
    char ch;
    char filename[200],old_filename[500],new_filename[500];
	char buff[500],buff1[500],buff2[500],code[500];
	char table_name[100];
	MYSQL *sock,mysql;
    MYSQL *sock2,mysql2;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
    OLDBBS oldbbs;
    char query[BODY_MAX+500],body[BODY_MAX];

    count=count_man=0;
    printf("\n  메일 위치 : userdata/?/아이디/letter.txt\n");
    printf("  첨부 파일 : userroom/?/아이디/파일명\n");
    printf("  새  위 치 : roombin/첨부파일.fcount\n");
    if (!yesno2("userdata 에 있는 메일을 변환할까요? (Y/n)>>",Yes)) return;

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 4131: %s\n",mysql_error(&mysql));
		return;
	}
    if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 4132: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
    check_dir("mailbin");

	sprintf(query,"SELECT * FROM user");
	if (mysql_query(sock, query) == -1) {
		printf("## ERR %s\n",mysql_error(sock));
		return;
	}
	qres = mysql_store_result(sock);
	ii=0;
	while ((qrow = mysql_fetch_row(qres))!=NULL) {
		qrow2pf(qrow);
        if (strlen(pf.id)<1) continue;
        sprintf(table_name,"mail%s",pf.id);
        strcpy(db_name,DB_MAIL);

        if (!(sock2 = mysql_connect(&mysql2,DB_HOST,DB_USER,DB_PASSWD))) {
            printf("## ERR 4131: %s\n",mysql_error(&mysql2));
            return;
        }
        if ((mysql_select_db(sock2,DB_MAIL)) == -1) {
            printf("## ERR 4132: %s\n",mysql_error(sock2));
            mysql_close(sock2);
            return;
        }

        if (mode==2) {
            sprintf(query,"DROP TABLE IF EXISTS %s",table_name);
            mysql_query(sock2, query);
            mysql_query(sock2,"FLUSH TABLES");
        }

        for (i3=0;i3<2;i3++) {
            if (i3==0) sprintf(NOW_FILE ,"userdata/%s/%s/letter.tit",c_han(pf.id),pf.id);
            else sprintf(NOW_FILE ,"userdata/%s/%s/send.tit",c_han(pf.id),pf.id);

            strchng(NOW_FILED,NOW_FILE,".tit",".txt");
            if ((fp1=fopen(NOW_FILE,"r"))==NULL) {
                //printf("skip: %s  %s (파일없음)\n",pf.id,NOW_FILE);
                continue;
            }
            count_man++;
            fp2=fopen(NOW_FILED,"r");

            while(fread(&oldbbs,sizeof_oldbbs,1,fp1)) {
                if (oldbbs.size<0||oldbbs.size>1000000) oldbbs.size=100000;
                if (is_same(oldbbs.title,"병신")||
                    is_same(oldbbs.title,"[판매] 편집입니다...")) continue;
                ii=0;
                i2=0;
                bzero(body,BODY_MAX);
                if (fp2!=NULL) {
                    fseek(fp2,oldbbs.posi,SEEK_SET);
                    oldbbs.line=0;
                    for (i=0;i<oldbbs.size&&!feof(fp2)&&i2<BODY_MAX;i++) {
                        ch=fgetc(fp2);
                        if (ch==0||ch==-1) break;
                        if (ch=='\n') oldbbs.line++;
                        else if (ch=='\\') body[i2++]='\\';
                        else if (ch=='\'') body[i2++]='\\';
                        else if (ch=='\"') body[i2++]='\"';
                        body[i2++]=ch;
                        ii++;
                    }
                }

                oldbbs.size=ii;
                strcpy(bbs.id,oldbbs.id);
                strcpy(bbs.tid,oldbbs.id);
                strcpy(bbs.name,oldbbs.name);
                strcpy(bbs.passwd,oldbbs.passwd);
                strcpy(bbs.title,oldbbs.title);
                strcpy(bbs.tcode,   oldbbs.tcode);
                strcpy(bbs.tclub,   club_go.code);
                strcpy(bbs.homepage,"");
                strcpy(bbs.email,   "");
                strcpy(bbs.userip,  "");
                strcpy(bbs.filename,oldbbs.filename);
                bbs.fcount=0;
                bbs.filesize=oldbbs.filesize;
                bbs.size=oldbbs.size;
                bbs.line=oldbbs.line;
                bbs.hits=oldbbs.read;
                bbs.down=oldbbs.down;
                bbs.ok=oldbbs.ok%1000;
                bbs.no=(oldbbs.ok/1000)%1000;
                bbs.date=oldbbs.date;
                bbs.date2=oldbbs.date2;
                bbs.good=0;
                if (oldbbs.gd>='!') bbs.good=oldbbs.gd-'!';
                else if (oldbbs.gd>0) bbs.good=oldbbs.gd;
                if (bbs.good<1) bbs.good=0;
                if (bbs.good>=10) bbs.good=10;
                bbs.del=' ';
                if (oldbbs.del==68||oldbbs.del==1||oldbbs.del=='d'||oldbbs.del=='D') bbs.del='D';
                bbs.color=bbs.tag=bbs.tag2=bbs.link1=bbs.link2=bbs.link3=0;
                if (bbs.del=='D') continue; //삭제된것은 무시함

                if (i3==1) strcpy(bbs.tcode,"send");
                else if (bbs.hits>0) strcpy(bbs.tcode,"save");
                else strcpy(bbs.tcode,"mail");

                //첨부파일 변환
                sprintf(old_filename,"userroom/%s/%s/%s",c_han(pf.id),pf.id,bbs.filename);
                if (is_file(old_filename)) {
                    _same_file:
                    bbs.fcount=rand();
                    sprintf(new_filename,"mailbin/%s.%x",bbs.filename,bbs.fcount);
                    if (is_file(new_filename)) {
                        goto _same_file;
                    }
                    sys_tem("mv -f '%s' '%s'",old_filename,new_filename);
                    printf("첨부 파일변환  '%s' -> '%s'\n",old_filename,new_filename);
                }

                printf("추가->%-15s %5d. %-8s %-6s %-25.25s\n",table_name,count,oldbbs.id,bbs.keyword,oldbbs.title);
                add_table(0,sock2,table_name,body);
                count++;
            }
            fclose(fp1);
            if (fp2!=NULL) fclose(fp2);

        }
        mysql_query(sock2,"FLUSH TABLES");
        mysql_close(sock2);
	}
	mysql_free_result(qres);
	mysql_close(sock);
    mess("총 %d 명  %d 개의 메일이 변환되었습니다.",count_man,count);
}


xformat_id(int mode,char *def_file )
{
	FILE *fp1;
    char buff[100010];
    char buff1[100010];
	char buff2[100010];
	char ch,ch1,ch2,ch3,ch4;
    char filename[300],query[100000];
	int count=0;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;

	char table_name[100];
	char body[BODY_MAX];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 6101: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 6102: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}

	if (strlen(def_file)) strcpy(filename,def_file);
	else {
		//화일을 전송받아 filename에 저장한다.
		printf("\n XFORMAT TEXT ID 파일데이타를 전송하세요\n");
		if (!up_file(0,filename,No)) return;
	}

	unlink(TMP_FILE);
	printf(" 파일명:%s   (%d byte)\n",filename,file_size(filename));
	if ((fp1=fopen(filename,"r"))==NULL) return;
	printfL2();
	clear_pf();
	bzero(body,BODY_MAX);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        fprintf(stderr,"## ERR 1001: %s\n",mysql_error(&mysql));
		exit(1);
	}

	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		fprintf(stderr,"## ERR 1002: %s\n",mysql_error(sock));
		mysql_close(sock);
		exit(1);
	}

    if (mode==2) {
        if (yesno2("전체 회원(등급18미만)을 삭제한뒤 변환할까요?(y/N)>>",No)) {
            sprintf(query,"delete from user where type<18");
            mysql_query(sock, query);
        }
    }

    while(fgets(buff1,10000,fp1)!=NULL) {
        bzero(buff,sizeof(buff));
        bzero(buff2,sizeof(buff2));
		del_enter2(buff1);
		xstrncpy(buff,buff1,10);
        if (strlen(buff1)>10) strcpy(buff2,&buff1[10]);
        if (strlen(buff2)<300) all_trim(buff2);
//        printf(" B1*%s*%s B2*%s*\n",buff1,buff,buff2);
			 if (is_same(buff,"__[[종료[[")) break;
		else if (is_same(buff,"__[[중지[[")) break;
		else if (is_same(buff,"__[[완료[[")||strlen(buff1)>99990) {
            del_esc(pf.id);del_esc(pf.name);
            del_space(pf.id);del_space(pf.eid);del_space(pf.name);del_space(pf.email);
            addslashes(pf.memo1,sizeof(pf.memo1));addslashes(pf.memo2,sizeof(pf.memo5),sizeof(pf.memo5));addslashes(pf.memo3,sizeof(pf.memo5));addslashes(pf.memo4,sizeof(pf.memo5));
            addslashes(pf.memo5,sizeof(pf.memo5));addslashes(pf.memo6,sizeof(pf.memo5),sizeof(pf.memo5));addslashes(pf.memo7,sizeof(pf.memo5));addslashes(pf.memo8,sizeof(pf.memo5));
            addslashes(pf.addr1,sizeof(pf.addr2));addslashes(pf.addr2,sizeof(pf.addr2));
			strcpy(buff1,datestr(8,pf.inday));
			strcpy(buff2,datestr(8,pf.logout));
			if (strlen(pf.eid)<1) strcpy(pf.eid,pf.id);
			if (pf.del!='D') pf.del=' ';
            if (pf.type<0||pf.type>19) pf.type=0;
            if (strlen(pf.id)<2) {
                printf("%d %10s %10s %2d 빈ID (SKIP)\n",count+1,pf.id,pf.name,pf.type);
                clear_pf();
                fflush(NULL);sleep(1);
                continue;
            }

			sprintf(query,"SELECT count(*) FROM user WHERE id='%s'",pf.id);
			mysql_query(sock, query);
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres)) != NULL) {
				if (atoi(qrow[0])) {
                    printf("%d %10s %10s %2d 중복 (SKIP)\n",count+1,pf.id,pf.name,pf.type);
					clear_pf();
                    fflush(NULL);sleep(1);
					continue;
				}
			}
			printf("%d %10s %10s %2d 추가\n",++count,pf.id,pf.name,pf.type);

			sprintf(query, "insert into user (
			id,eid,name,passwd,
			del,
			id_no,email,
			post,addr1,addr2,
			tele,hand,
			offi,job,
			memo1,memo2,memo3,memo4,
			memo5,memo6,memo7,memo8,
			all_log,all_time,month_log,month_time,
			countd,countu,countw,down,
            inday,logout,type
			)
			values (
			'%s','%s','%s','%s',
			'%c',
			'%s','%s',
			'%s','%s','%s',
			'%s','%s',
            '%s','%d',
			'%s','%s','%s','%s',
			'%s','%s','%s','%s',
			'%d','%d','%d','%d',
			'%d','%d','%d','%d',
            '%s','%s','%d'
			);",
			pf.id,pf.eid,pf.name,pf.passwd,
			pf.del,
			pf.id_no,pf.email,
			pf.post,pf.addr1,pf.addr2,
			pf.tele,pf.hand,
			pf.offi,pf.job,
			pf.memo1,pf.memo2,pf.memo3,pf.memo4,
			pf.memo5,pf.memo6,pf.memo7,pf.memo8,
			pf.all_log,pf.all_time,pf.month_log,pf.month_time,
			pf.countd,pf.countu,pf.countw,pf.down,
			buff1,buff2,pf.type
			);
//           printf("%s\n", query);
			if (mysql_query(sock, query) == -1) {
				printf("## ERR 1009: %s\n%s\n",mysql_error(sock),query);
				mysql_close(sock);
				exit(1);
			}
			clear_pf();
		}
		else if (is_same(buff,"__[[아이[[")) strcpy(pf.id,buff2);
        else if (is_same(buff,"__[[아디[[")) strcpy(pf.id,buff2);
		else if (is_same(buff,"__[[영문[[")) strcpy(pf.eid,buff2);
        else if (is_same(buff,"__[[영아[[")) strcpy(pf.eid,buff2);
		else if (is_same(buff,"__[[이름[[")) strcpy(pf.name,buff2);
		else if (is_same(buff,"__[[암호[[")) strcpy(pf.passwd,buff2);
        else if (is_same(buff,"__[[주민[[")) strcpy(pf.id_no,buff2);
        else if (is_same(buff,"__[[참01[[")) strncpy(pf.memo1,buff2,70);
        else if (is_same(buff,"__[[참02[[")) strncpy(pf.memo2,buff2,70);
        else if (is_same(buff,"__[[참03[[")) strncpy(pf.memo3,buff2,70);
        else if (is_same(buff,"__[[참04[[")) strncpy(pf.memo4,buff2,70);
        else if (is_same(buff,"__[[참05[[")) strncpy(pf.memo5,buff2,70);
        else if (is_same(buff,"__[[참06[[")) strncpy(pf.memo6,buff2,70);
        else if (is_same(buff,"__[[참07[[")) strncpy(pf.memo7,buff2,70);
        else if (is_same(buff,"__[[참08[[")) strncpy(pf.memo8,buff2,70);
        else if (is_same(buff,"__[[직장[[")) strncpy(pf.offi,buff2,70);
        else if (is_same(buff,"__[[전화[[")) strncpy(pf.tele,buff2,70);
        else if (is_same(buff,"__[[핸드[[")) strncpy(pf.hand,buff2,14);
        else if (is_same(buff,"__[[우편[[")) strncpy(pf.post,buff2,7);
        else if (is_same(buff,"__[[주소[[")) strncpy(pf.addr1,buff2,100);
        else if (is_same(buff,"__[[주02[[")) strncpy(pf.addr2,buff2,100);
		else if (is_same(buff,"__[[가입[[")) pf.inday=str2date2(buff2);
		else if (is_same(buff,"__[[최종[[")) pf.logout=str2date2(buff2);
		else if (is_same(buff,"__[[총사[[")) pf.all_time=atoi(buff2);
		else if (is_same(buff,"__[[총접[[")) pf.all_log=atoi(buff2);
        else if (is_same(buff,"__[[삭제[[")) pf.del=buff2[0];
		else if (is_same(buff,"__[[월사[[")) pf.month_time=atoi(buff2);
		else if (is_same(buff,"__[[월접[[")) pf.month_log=atoi(buff2);
		else if (is_same(buff,"__[[수다[[")) pf.countd=atoi(buff2);
		else if (is_same(buff,"__[[수업[[")) pf.countu=atoi(buff2);
		else if (is_same(buff,"__[[수쓰[[")) pf.countw=atoi(buff2);
		else if (is_same(buff,"__[[다운[[")) pf.down=atoi(buff2);
		else if (is_same(buff,"__[[직업[[")) pf.job=atoi(buff2);
		else if (is_same(buff,"__[[타입[[")) pf.type=atoi(buff2);
        else if (is_same(buff,"__[[등급[[")) {
            pf.type=atoi(buff2);
            if (pf.type==-128) pf.type=5;
            if (pf.type<0||pf.type==99) {pf.type=0;pf.del='D';}
        }
	}
	fclose(fp1);
	mysql_close(sock);
	mess("### 총 %d 자료 변환이 끝났습니다.\n",count);
}


create_db2(MYSQL *sock, char *file1,char *file2)
{
	FILE *fp;
    char tmpfile[100],query[100000],bindir[500];
    char buff[100000];
    int ret=Yes;
	int start,count;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;

	sprintf(tmpfile,"%s__.tmp",file2);

	sprintf(query,"show variables");
    if (mysql_query(sock,query) == -1) {
        printf("## ERR 1123:%s\n%s\n",mysql_error(sock),query);
	}
    qres = mysql_store_result(sock);
	while( 1 ) {
		if ((qrow = mysql_fetch_row(qres))==NULL) break;
		if (strcmp(qrow[0],"basedir")==0) {
			strcpy(bindir,qrow[1]);
			break;
		}
	}
	mysql_free_result(qres);

    sprintf(buff,"%s/bin/mysqldump -d --user=%s %s %s > %s",
    bindir,DB_USER,DB_NAME,file1,tmpfile);
	system(buff);

    if ((fp=fopen(tmpfile,"r"))==NULL) return No;
	start=No;
	count=0;
    sprintf(query,"create table %s (",file2);

    while (fgets(buff,100000,fp)!=NULL) {
		del_enter(buff);
		if (strncmp(buff,"CREATE TABLE ",13)==0) start=Yes;
		else if (start) {
			strcat(query,buff);
			count++;
		}
	}
	fclose(fp);
    if (count>0) {
        if (mysql_query(sock,query)==-1) ret=No;
    }
	unlink(tmpfile);
    mysql_query(sock,"Flush privileges");
    mysql_query(sock,"Flush tables");
    fflush(NULL);
    return ret;
}
