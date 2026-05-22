////////////////////////////////////////////////////////////////////////
// XHOST: 리눅스용 BBS HOST  개발:김성대(053-964-1002) BBS:053-963-2190
// 게시판 담당자의 메뉴
///////////////////////////////////////////////////////////////////////////
#include "bbs.h"

main(int argc, char **argv)
{
	int i,n=0,n1,n2;
	char buff[500],buff2[500];
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[200];
	char query[5000];

    read_db_name("db.cfg");
	cls();
	read_aname();				//회원정보 필드읽기
	read_abbsname();			//게시판정보 필드읽기
	read_cfg();
	findport(tty);
	set_tmpfile();

	if (argc<4) {
		printf("사용법  bsysop <가기코드> <동호회코드> <ID> [모드] \n");
		printf("사용법  bsysop hello game 시삽\n");
		getchar();
		return;
	}
	strcpy(go.code,argv[1]);				 //가기코드
	strcpy(club_go.code,argv[2]);				  //동호회 코드
	read_ccfg();
	if (!read_pf(argv[3])) {
		mess("%s 검색실패",argv[3]);
		return;
	}
	read_cpf(argv[3]);					  //해당되는 동호회의 아이디를 찾는다.
	who=check_who();				 //1:동호회 운영진 2:동호회 시삽  3:root권한

	if (who<1) {
		mess("%s(W:%d,T:%d) 게시판메뉴사용불가능등급",pf.id,who,pf.type);
		return;
	}
	sprintf(table_name,"%s_%s",club_go.code,go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 2101: %s\n",mysql_error(sock));
		return;
	}
    if ((mysql_select_db(sock, DB_CM)) == -1) {
		printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}

	sprintf(query,"SELECT count(*) FROM %s",table_name);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))!=NULL) {
			NOW_ALLNO=atoi(qrow[0]);
		}
		mysql_free_result(qres);
	}

	read_bcfg();

	while (1) {
		cls();
		xy(1,1);
        print_(1," %s 메뉴 (총:%d  W:%d)",table_name,NOW_ALLNO,who);
		printf("     1. 가기코드 이름   : %s\n",bcfg.name);
        printf("     2. 출력모양번호    : %d\n",bcfg.bform);
		printf("     3. 게시판 담당지정 : %s,%s,%s,%s\n",bcfg.sysop,bcfg.sysop1,bcfg.sysop2,bcfg.sysop3);
        printf("     4. 게시판 진입제한 : I:%d / R:%d / W:%d / D:%d   Ic:%d / Rc:%d / Wc:%d / Dc:%d   \n",
                    bcfg.itype,bcfg.rtype,bcfg.wtype,bcfg.dtype,bcfg.ictype,bcfg.rctype,bcfg.wctype,bcfg.dctype);
		printf("     5. 명령어 위치 X,Y : %d , %d\n",bcfg.cmd_x,bcfg.cmd_y);
        printf("     6. 한페이지 줄수   : %d \n",bcfg.tline);
		printf("    91. 화면 관리\n");
		printf("    92. 게시물자동변환\n");
		printf(" 선택 (저장:P / 취소:Q) >>");
		lineinput(buff,10);check_han(buff);printf("\n");n=atoi(buff);
		if (is_same(buff,"q")) return;
		if (is_quit(buff)) break;
		if (is_same(buff,"n")) break;
		else if (n==1) {
			printf("\n 이름>>");
			get_str(bcfg.name,70);
		}
		else if (n==2) {
            printf("\n
 1.기본        2.비공개      3.공지            4.찬성/반대     5.방명록
 6.참고자료    7.예비        8.강좌            9.예비         10.뉴스
11.자료실     12.제목전용   13.제목전용자료실 14.예비         15.자료실
16.예비       17.예비       18.예비           19.예비         20.예비
21.전체게시판 22.전체자료실
번호>>");
            bcfg.bform=get_num(bcfg.bform,3);
		}
		else if (n==3) {
			printf("\n 시삽 >>");get_str(bcfg.sysop,20);
			printf("\n 시삽1>>");get_str(bcfg.sysop1,20);
			printf("\n 시삽2>>");get_str(bcfg.sysop2,20);
			printf("\n 시삽3>>");get_str(bcfg.sysop3,20);
		}
		else if (n==4) {
            printf("\n 진입메인등급 (%2d) >>",bcfg.itype) ;bcfg.itype=get_num(bcfg.itype,2);
            printf("\n 읽기메인등급 (%2d) >>",bcfg.rtype) ;bcfg.rtype=get_num(bcfg.rtype,2);
            printf("\n 쓰기메인등급 (%2d) >>",bcfg.wtype) ;bcfg.wtype=get_num(bcfg.wtype,2);
            printf("\n 다운메인등급 (%2d) >>",bcfg.dtype) ;bcfg.dtype=get_num(bcfg.dtype,2);
            printf("\n 진입동호등급 (%2d) >>",bcfg.ictype);bcfg.ictype=get_num(bcfg.ictype,2);
            printf("\n 읽기동호등급 (%2d) >>",bcfg.rctype);bcfg.rctype=get_num(bcfg.rctype,2);
            printf("\n 쓰기동호등급 (%2d) >>",bcfg.wctype);bcfg.wctype=get_num(bcfg.wctype,2);
            printf("\n 다운동호등급 (%2d) >>",bcfg.dctype);bcfg.dctype=get_num(bcfg.dctype,2);
		}
		else if (n==5) {
			printf("\n 명령 X위치>>");bcfg.cmd_x=get_num(bcfg.cmd_x,2);
			printf("\n 명령 Y위치>>");bcfg.cmd_y=get_num(bcfg.cmd_y,2);
		}
        else if (n==6) {
            printf("\n 한페이지줄수>>");bcfg.tline=get_num(bcfg.tline,2);
		}
        else if (n==91) set_blogo();
        else if (n==92) sys_tem("bin/txt2bbs %s %s %s",club_go.code,go.code,pf.id);
	}

	sprintf(query,"update bcfg set
        name='%s',bform='%d',
		sysop='%s',sysop1='%s',sysop2='%s',sysop3='%s',
        line='%d',tline='%d',
        itype='%d',dtype='%d',wtype='%d',rtype='%d',
        ictype='%d',dctype='%d',wctype='%d',rctype='%d'
		where table_name='%s'",
        bcfg.name, bcfg.bform,
		bcfg.sysop, bcfg.sysop1, bcfg.sysop2, bcfg.sysop3,
        bcfg.line,bcfg.tline,
		bcfg.itype, bcfg.dtype, bcfg.wtype, bcfg.rtype,
        bcfg.ictype, bcfg.dctype, bcfg.wctype, bcfg.rctype,
		table_name);
	if ((mysql_query(sock, query))==-1) {
        printf("\n%s\n%s",query,mysql_error(sock));
	}
	mysql_close(sock);

}


set_blogo()
{
	FILE *fp;
	int n=0,i,count;
	int key;
	int can_edit=No;		//편집가능함?
	char buff[240];
	char buff2[240];
	char tcode[60];
	char now_id[60];
	char filename[200];
	char filename2[200];
	char id_file[200];
	char cfg_file[200];
	char dir[200];
	char cmd;
	char olddir[180];
	char *aname[40]={
	"진입로고  ","심야진입  ","메뉴화면  ","등록화면  ","등록완료  ",
	"상단화면  ","말 머 리  ","말머리선택","명령도움  ","읽기도움  ",
	"하단명령  ","읽기선택  ","하단선택  ","기본설명  ","출력형태  ",
	"읽기상단  ","읽기형태  ","FORM설정  ","LX  화면  ","진입 VTX  ",
	"진입 JPG  ","설문자료  ","M1~M9 명령","하단 BL1"  ,"하단 BL2  ",
	"손님진입  ","야간진입  ","비안시화면","진입아디"  ,""          ,
	"손님진입 M","야간진입 M","비안시   M",""          ,""          ,
	""          ,""          ,""          ,"광고 AD?"  ,"광고 TA?" };
	char *atail[40]={
	"log","lo5","mnu","bbs","bb2",
	"top","hea","hsl","hlp","hl2",
	"bot","cm1","cm2","qsh","frm",
	"ftm","dsp","for","slx","vtx",
	"jpg","qst","dim","bl1","bl2",
	"lo4","lo5","lo2","sid","tmp",
	"mn4","mn5","mn2","tmp","tmp",
	"tmp","tmp","tmp","ad0","ta0"};
	char afile[40][50];

	getcwd(olddir,sizeof(olddir));		//현재의 디렉토리
	sprintf(dir,"forum/%s/logo",club_go.code);
	strcpy(tcode,go.code);			  //가기코드

	club_mode=No;
	for (i=0;i<40;i++) sprintf(afile[i],"%s.%s",tcode,atail[i]);

	while (1) {
		cls();
		print_(" %s 게시판 화면 편집 메뉴",tcode);
		for (i=0;i<40;i++) {
			xy((i/20)*42,(i%20)+3);
			sprintf(buff,"forum/%s/logo/%s",club_go.code,afile[i]);
			printf("%2d.%-10s(%-12s)%6dB\n",i+1,aname[i],afile[i],file_size(buff));
		}
		xy(1,23);
		printf(" 편집(E) 삭제(D) 등록(UP) 다운(DN) 도움(H)\n");
		printf(" 전체다운(AD) 전체업(AU) 전체삭제(AK)  >>");
		lineinput(buff,5);check_han(buff);printf("\n");
		if (is_char("pPqQxX0",buff[0])) break;
		check_cmd(buff);
		strcpy(filename,"");
		if (mmn[1]==0) mmn[1]=mmn[0];
		if (mmn[1]>0&&mmn[1]<=40) {
			sprintf(filename,"forum/%s/logo/%s",club_go.code,afile[mmn[1]-1]);
		}

		if ((mmn[1]==39||mmn[1]==40)&&
			(is_same(mmc[0],"e")||is_same(mmc[0],"d")||is_same(mmc[0],"up")||is_same(mmc[0],"dn"))) {
			printf(" 화면선택번호는? (0~9) >>");
			lineinput(buff,2);
			n=atoi(buff);
			if (is_quit(buff)||strlen(buff)==0||n>9) continue;
			if (mmn[1]==39) {
				sprintf(buff2,"ad%d",n);
				strchng2(filename,"ad0",buff2);
			}
			else {
				sprintf(buff2,"ta%d",n);
				strchng2(filename,"ta0",buff2);
			}
		}

		if (mmn[0]>0&&mmn[0]<=40) {
			view(filename);
			printf("파일명:\"%s\"  크기:%dbyte\n",filename,file_size(filename));
			pressenter();
			continue;
		}
			 if (is_same(mmc[0],"h")) view_text("frm/help/logo.hlp");
		else if (is_same(mmc[0],"ad")) {
			if (yesno("해당 게시판의 전체화면를 다운받겠습니까? (Y/n) >>",Yes))
				sys_tem("%s 'forum/%s/logo/%s.*'",cfg.sz,club_go.code,go.code);
			continue;
		}
		else if (is_same(mmc[0],"ak")) {
			if (yesno("해당 게시판의 전체화면를 삭제하겠습니까? (y/N) >>",No))
				sys_tem("rm -f forum/%s/logo/%s.*",club_go.code,go.code);
			continue;
		}
		else if (is_same(buff,"au")) {
			if (yesno("해당 게시판의 전체화면를 자동등록하겠습니까? (Y/n) >>",Yes)) {
				printf("\n ******* 연속업로드를 해도 됩니다. *********\n");
				getcwd(olddir,sizeof(olddir));		//현재의 디렉토리
				sys_tem("rm tmp/up%d%s -rf",cfg.hostno,no_spc(tty));
				sprintf(buff2,"tmp/up%d%s",cfg.hostno,no_spc(tty));
				check_dir(buff2);
				chdir(buff2);
				rz();
				chdir(olddir);
				sys_tem("cp -f tmp/up%d%s/%s.* forum/%s/logo/",cfg.hostno,no_spc(tty),go.code,club_go.code);
				rm_tmpup(); 	   //임시디렉토리 지움
			}
			continue;
		}
		else if (strlen(filename)<1);
		else if (is_same(mmc[0],"e" )) xedit(filename);
		else if (is_same(mmc[0],"up")) {
			printf(" ### %s 로고를 등록합니다. ###\n",filename);
			if (up_file(0,buff,No)&&is_file(buff)) {   //화일을 전송받아 filename에 저장한다.
				file_copy(buff,filename);
				rm_tmpup(); 	   //임시디렉토리 지움
			}
		}
		else if (is_same(mmc[0],"dn")) sz_file(filename);   //화일전송
		else if (is_same(mmc[0],"d" )) {
			printf(" %s 화일을 삭제합니다. 삭제를 할까요? (Y/n) >>",filename);
			if (yesno("",Yes)) unlink(filename);
		}
	}
}


