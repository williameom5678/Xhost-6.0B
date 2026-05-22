// 내용 : 명령어분석
#include "bbs.h"

//특별한 메뉴인가?
check_smenu(char *buffcmd)
{
	char buff[200],buff1[200];
	int i;
	if (go.type=='s') {      //동호회를 선택하였다.
		club_go=go;
		club_mode=Yes;
		re_club=Yes;
		strcpy(sub_go,mmc[2]);
		p_command=Yes;
	}
	else if (do_order_command(go.code,buffcmd));
	else if (go.type=='t') {
		strcpy(buff1,"?");
			 if (is_same(go.wtimes,"loc2")) sprintf(buff1,"%d",pf.type);
		else if (is_same(go.wtimes,"loc3")) sprintf(buff1,"%d",pf.job);
		else if (is_same(go.wtimes,"loc4")) sprintf(buff1,"%d",get_age(pf)/10);
		else if (is_same(go.wtimes,"loc5")) sprintf(buff1,"%d",get_age(pf)/10);
		strchng2(go.dir,"?",buff1);
		strcpy(auto_cmd,go.dir);
		if (strlen(auto_cmd)<1) strcpy(auto_cmd,go.code);
	}
	else if (go.type=='r') {
		if (is_same(go.wtimes,"cmd")) {
			strcpy(auto_cmd,go.dir);
			if (strlen(auto_cmd)<1) strcpy(auto_cmd,go.code);
			return;
		}
		else {
			sprintf(buff,"%s",go.code);
			strcpy(mmc[0],go.code);
			strcpy(mmc[1],"");strcpy(mmc[2],"");strcpy(mmc[3],"");
			mmn[0]=0;mmn[1]=0;mmn[2]=0;mmn[3]=0;
		}
		if (in_file2("system/nocode.txt",mmc[0])) return;
		if (do_basic_command(buff,buff));
		else  do_order_command(buff,buffcmd);
		if (go.type=='r') go_prev();
	}
	else if (go.type=='p'||go.type=='h') {
		run_pagescreen();
		re_print=Yes;
		goto _fail;
	}
	else if (is_char(EXETYPE,go.type)) {		  //외부명령일때
		exec_menu(0);
	}
	return;

	_fail:
	i=0;
	while(i++<30&&is_char("phrt",go.type)) {
		go_prev();
	}
}


//command 가 메뉴상에 있는 선택번호인가?
do_menu_command()
{
	FILE *fp;
	int ret=No;
	GO	oldgo,tgo,oldclub;
	int n,i;
	int found=No;
	char buff[180];
	char buff2[180];
	char deep;

	if (strlen(mmc[0])==0||strlen(mmc[0])>4||go.type!='m') return No;

	p_command=No;			//마지막 입력이 P인가?
	if (strlen(mmc[0])==1&&
	   (strcasecmp(mmc[0],"z")==0||strcasecmp(mmc[0],"p")==0||
		strcasecmp(mmc[0],"t")==0||strcasecmp(mmc[0],"n")==0||
		strcasecmp(mmc[0],"w")==0||strcasecmp(mmc[0],"x")==0||
		strcasecmp(mmc[0],"a")==0||strcasecmp(mmc[0],"b")==0)) return No;
	if (strcasecmp(mmc[0],"ls")==0||strcasecmp(mmc[0],"xx")==0||
		strcasecmp(mmc[0],"lz")==0||strcasecmp(mmc[0],"xx")==0||
		strcasecmp(mmc[0],"say")==0||strcasecmp(mmc[0],"say")==0) return No;
	oldgo=go;	//원래의 가기코드 저장
	oldclub=club_go;
	found=No;
	printf("\n 잠깐만 기다려주십시요...\n");

	//기본만들어둔 메뉴구조읽는다.
	sprintf(buff,"%s/menustru/%s.ind",club_go.dir,go.code);
	if ((fp=fopen(buff,"r"))!=NULL) {
		while(fread(&tgo,sizeof_go,1,fp)) {
			if (is_same(tgo.num,mmc[0])) {
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	if (!found) {  //레벨의 하위메뉴에서 검색 시작으로
		if ((fp=fopen(NOW_MENU,"r"))==NULL) return No;
		fseek(fp,(go.rec+1)*sizeof_go,SEEK_SET);
		while(fread(&tgo,sizeof_go,1,fp)) {
			if (tgo.type>' '&&strlen(tgo.code)>1) break;
		}
		deep=tgo.deep;
		fseek(fp,tgo.rec*sizeof_go,SEEK_SET);
		while(fread(&tgo,sizeof_go,1,fp)&&deep<=tgo.deep) {
	//		printf("1113*%d*%s->%s*%s*\n",tgo.deep,go.code,tgo.code,mmc[0]);
			if (deep==tgo.deep&&is_same(tgo.num,mmc[0])&&strlen(tgo.code)>0&&tgo.type>' ') {
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	if (!found) return No;

	go=tgo;
	re_print=Yes;
	re_logo=Yes;
	re_bbs=Yes;
	list_mode=No;
	ret=Yes;
	read_bcfg();

	if (go.type=='t') check_smenu("");
	else if (check_type('j')||check_type('i')) {
		go=oldgo;		//다시 복귀함
		re_logo=No;
		return No;	   //진입가능등급?
	}
	else if (go.type=='r') {
		strcpy(mmc[0],go.code);
		do_order_command(mmc[0],"");
		go=oldgo;		//다시 복귀함
		p_command=Yes;
		if (go.type=='r') go_prev();
	}
	else if (is_char(EXETYPE,go.type)) {		  //외부명령일때
		p_command=Yes;
		exec_menu();
		go=oldgo;		//다시 복귀함
		if (is_char(EXETYPE,go.type)) go_prev();
	}
	else if (go.type=='s') {      //동호회를 선택하였다.
		check_smenu("");
	}
	else if (go.type=='p'||go.type=='h') check_smenu("");
	else if (is_same(go.code,"wmail"))   check_smenu("");
	return Yes;
}


//command 가 게시판의 자료 선택번호인가?
do_list_command()
{
	int ret=No;
	int key;
	int nn=0;
	int short_no=No;
	int found=No;

	if (empty(mmc[0])||mmn[0]<1||!is_bbspds) return (No);
	//만일 화면에 나타난 숫자의 마지막 2자리만 입력했을때
	nn=mmn[0];
	if (nn>0) {
		if (!bbs_read(0,nn)) {				 //해당번호 내용출력
			message("해당번호를 찾을수없습니다.");
		}
		ret=Yes;
	}
	return (ret);
}


//기본명령어 처리
do_basic_command(char *buff,char *buffstr)
{
	int ret=Yes;
	int i;
	char ch,buff2[100];
	//기본명령 실행
	if (mmc[0][0]==0&&go.type=='m') return (Yes);
	if (strlen(mmc[0])==2||strlen(mmc[0])==4) check_han(mmc[0]);

	if (is_same(go.code,"rmail")&&list_mode&&(**mmc==0||stristr("f b p m go re an ls dir w r x xy xx",mmc[0]))) {
		mail_readok();
	}

	if (in_file2("system/nocode.txt",mmc[0])) return Yes;
	ret=No;
	if (is_bbspds) {
		ret=Yes;
			 if (is_same(mmc[0],"f")&&list_mode) bbs_read(2,bbs.num);
		else if (is_same(mmc[0],"b")&&list_mode) bbs_read(-2,bbs.num);
		else if (is_same(mmc[0],"f"))        run_bbsscreen(1,0);
		else if (is_same(mmc[0],"b"))        run_bbsscreen(-1,0);
		else if (is_same(mmc[0],"ls")&&mmn[1]) run_bbsscreen(0,mmn[1]);
		else if (is_same(mmc[0],"lz")&&mmn[1]) run_bbsscreen(0,mmn[1]);
		else if (is_same(mmc[0],"ls"))       run_bbsscreen(-3,0);
		else if (is_same(mmc[0],"lz"))       run_bbsscreen(-3,0);
		else if (is_same(mmc[0],"d"))        bbs_del(3); //삭제 (삭제자료실로 옮김)
		else if (is_same(mmc[0],"dd"))       bbs_del(0); //삭제
		else if (is_same(mmc[0],"e"))        bbs_edit(mmn[1]);
		else if (is_same(mmc[0],"ed"))       bbs_edit(mmn[1]);
		else if (is_same(mmc[0],"w"))        bbs_write(0);
		else if (is_same(mmc[0],"ws"))       bbs_write(99);
		else if (is_same(mmc[0],"up"))       bbs_write(0);
		else if (is_same(mmc[0],"ups"))      bbs_write(99);
		else if (is_same(mmc[0],"down"))     bbs_down(0);          //자료다운
		else if (is_same(mmc[0],"dn"))       bbs_down(0);          //자료다운
		else if (is_same(mmc[0],"see"))      bbs_down(2);          //자료다운
		else if (is_same(mmc[0],"ra"))       bbs_re();
		else if (is_same(mmc[0],"rn"))       bbs_re();
		else if (is_same(mmc[0],"rt"))       bbs_re(); //답변
		else if (is_same(mmc[0],"rr"))       bbs_re();            //잡담
		else if (stristr(go.code,"mail")&&is_same(mmc[0],"r"))     bbs_re();            //참고
		else if (is_same(mmc[0],"re"))       bbs_re();            //참고
		else if (is_same(mmc[0],"an"))       bbs_re();            //답변전용명령
		else if (is_same(mmc[0],"at"))       bbs_re();
		else if (is_same(mmc[0],"li"))       bbs_search();
		else if (is_same(mmc[0],"lt"))       bbs_search();
		else if (is_same(mmc[0],"ln"))       bbs_search();
		else if (is_same(mmc[0],"lf"))       bbs_search();
		else if (is_same(mmc[0],"lk"))       bbs_search();
		else if (is_same(mmc[0],"le"))       bbs_search();
		else if (is_same(mmc[0],"lu"))       bbs_search();
		else if (is_same(mmc[0],"ld"))       bbs_search();
		else if (is_same(mmc[0],"lg"))       bbs_search();
		else if (is_same(mmc[0],"lc"))       bbs_search();
		else if (is_same(mmc[0],"lkw"))      bbs_search();
		else if (is_same(mmc[0],"mv"))       bbs_copy(buff);
		else if (is_same(mmc[0],"mvv"))      bbs_copy(buff);
		else if (is_same(mmc[0],"mvmain"))   bbs_copy(buff);
		else if (is_same(mmc[0],"mvvmain"))  bbs_copy(buff);
		else if (is_same(mmc[0],"mvclub"))   bbs_copy(buff);
		else if (is_same(mmc[0],"mvvclub"))  bbs_copy(buff);
		else if (is_same(mmc[0],"cp"))       bbs_copy(buff);
		else if (is_same(mmc[0],"cpp"))      bbs_copy(buff);
		else if (is_same(mmc[0],"cpmain"))   bbs_copy(buff);
		else if (is_same(mmc[0],"cppmain"))  bbs_copy(buff);
		else if (is_same(mmc[0],"cpclub"))   bbs_copy(buff);
		else if (is_same(mmc[0],"cppclub"))  bbs_copy(buff);
		else if (is_same(mmc[0],"pr"))       bbs_down(3);
		else if (is_same(mmc[0],"no"))       bbs_ok(0);
		else if (is_same(mmc[0],"ok"))       bbs_ok(1);
		else if (is_same(mmc[0],"okdel"))    bbs_ok(8);
		else if (is_same(mmc[0],"gd"))       bbs_gd(0);
		else if (is_same(mmc[0],"gdg"))      bbs_gd(1);
		else if (is_same(mmc[0],"gds"))      bbs_gd(3);
		else if (is_same(mmc[0],"gdd"))      bbs_gd(-1);
		else ret=No;
	}
	if (ret==No) {
		ret=Yes;
			 if (is_same(mmc[0],"lz")&&go.type=='m');
		else if (is_same(mmc[0],"ls")&&go.type=='m');
		else if (is_same(mmc[0],"z"))        re_print=Yes;     //화면재표시
		else if (is_same(mmc[0],"go"))       {
			if (mmc[1][0]==0) findmenu(0);
			else if (go_code(mmc[1])) {strcpy(sub_go,mmc[2]);check_smenu(buffstr);}
			else re_print=No;
		} //가기명령수행
		else if (is_same(mmc[0],"w")&&is_same(go.code,"top")) go_code("wmail"); //메일바로가기
		else if (is_same(mmc[0],"w")&&is_same(go.code,"mail")) go_code("wmail"); //메일바로가기
		else if (is_same(mmc[0],"w")&&is_same(go.code,"rmail")) go_code("wmail"); //메일바로가기
		else if (is_same(mmc[0],"w")&&is_same(go.code,"smail")) go_code("wmail"); //메일바로가기
		else if (is_same(mmc[0],"wm"))       go_code("wmail"); //메일바로가기
		else if (is_same(mmc[0],"rm"))       go_code("rmail");
		else if (is_same(mmc[0],"t"))        go_top(0);               //처음으로
		else if (is_same(mmc[0],"n")&&list_mode) bbs_read(1,bbs.num);
		else if (is_same(mmc[0],"a")&&list_mode) bbs_read(-1,bbs.num);
		else if (is_same(mmc[0],"n"))        go_next(0);
		else if (is_same(mmc[0],"a"))        go_back(0);
		else if (is_same(mmc[0],"hh"))       set_off(9);
		else if (is_same(mmc[0],"m"))        go_prev();
		else if (is_same(mmc[0],"mk"))       system("make m");
		else if (!club_mode&&!list_mode&&go.type=='m'&&is_same(go.code,"top")&&bit(cfg.mode,30)&&is_same(mmc[0],"p")) host_end(0);
		else if (is_same(mmc[0],"p"))        go_prev();
		else if (is_same(mmc[0],"ii"))       go_code("notice");   //공지사항보기
		else if (is_same(mmc[0],"r"))        go_code("rmail");
		else if (is_same(mmc[0],"i"))        view_notice(0,"notice");
		else if (is_same(mmc[0],"tty"))      {
			system("id");fflush(NULL);
			printf("ID:%s NAME:%s TYPE:%d PORT:%s PID:%d HOSTNO:%d PORT:%d\n",pf.id,pf.name,pf.type,tty,getpid(),cfg.hostno,SERVER_PORT[0]);      //파일편집
			printf("HOST:%s  NIP:%s 서버수:%d\n",hostname,cfg.sip,cfg.count_server);
			printf("분산:%s ",rbit(cfg.mprocmode,0,"않함","함"));
			printf("LOCK:%s ",rbit(cfg.mprocmode,1,"동작","무시"));
			printf("%s\n",rbit(cfg.mprocmode,3,"FILELOCK","XLOCK"));
			printf("서버IP:( ");
			for (i=0;i<=cfg.count_server;i++) printf("%d ",cfg.nip[i]);
			printf(")\n");
			fflush(NULL);
		}
		else if (is_same(mmc[0],"tty2"))      {
			for (i=0;i<5;i++)
				printf("PORT:%d\n",SERVER_PORT[i]);      //파일편집
			fflush(NULL);
		}
		else if (is_same(mmc[0],"load"))     re_flash();
		else if (strlen(mmc[0])>2&&is_same(mmc[1],"say"))   to_say(0,mmc[0],"");    //귓속말 보내기
//운영자용명령
		else ret=No;

//		  if (ret) check_smenu(buffstr);
	}

	return (ret);
}

do_order_command(char *buff,char *buffstr)
{
	int key=Yes;
	char buff2[200];
	int i,i1;

	i1=atoi(&buff[1]);
	if (in_file2("system/nocode.txt",buff)) return Yes;
		 if (is_same(buff,"wmail")) wmail(1,"");
	else if (is_same(buff,"fmail")) wmail(98,"");
	else if (is_same(buff,"vmail")) wmail(98,"");
	else if (is_same(buff,"chat" )) {
		if (!is_same(go.code,"chat")) {go_top(0);find_go("chat");}
		do_chat(1);
	}
	else if (stristr(buff,"chat_")) {
		if (!stristr(go.code,"chat_")) {go_top(0);find_go(buff);}
		do_chat(1);
	}
	else if (is_same(buff,"find"    )) findmenu(3);
	else if (is_same(buff,"findpds2")) findmenu(4);                //디렉토리검사
	else if (is_same(buff,"findpds3")) findmenu(5);                //디렉토리검사
	else if (is_same(buff,"cfindpf" )) sys_tem("bin/pf '%s' set_cfindpf '%s'",pf.id,pf.id);       //동호회가입신청
	else if (is_same(buff,"cguest"  )) do_cguest();       //동호회가입신청
	else if (club_mode&&is_same(buff,"cchat")) do_chat(2);        //동호회대화실
	else if (is_same(buff,"guest"   )) do_guest();  //회원가입메뉴
	else if (is_same(buff,"pf_out"  )) do_pfout();        //가입신청해지
	else if (is_same(buff,"sysmail" )) do_sysmail(1);   //시삽수신편지
	else if (is_same(buff,"sysmail2")) do_sysmail(2);   //시삽수신편지
	else if (is_same(buff,"sysmail3")) do_sysmail(3);   //시삽수신편지
	else if (is_same(buff,"sbook"	)) search_book();
	else if (is_same(buff,"mlist"	)) maillist();
	else if (is_same(buff,"maillist")) maillist();
	else if (is_same(buff,"mailbook")) maillist();
	else if ((buff[0]=='m'||buff[0]=='M')&&(i1>0&&i1<100)) mm_code(i1);    //추천가기코드
	else if (is_same(buff,"to"      )) to_say(0,"",buffstr);    //귓속말 보내기
	else if (is_same(buff,"ear"     )) to_say(0,"",buffstr);    //귓속말 보내기
	else if (is_same(buff,"say"     )) to_say(0,"",buffstr);    //귓속말 보내기
	else if (is_same(buff,"ear2"    )) to_say(3,"",buffstr);    //귓속말 보내기
	else if (is_same(buff,"say2"    )) to_say(3,"",buffstr);    //귓속말 보내기
	else if (is_same(buff,"all"     )) to_all_say(0,0,buffstr); //전체메세지
	else if (is_same(buff,"all1"    )) to_all_say(1,0,buffstr); //전체메세지
	else if (is_same(buff,"all2"    )) to_all_say(2,0,buffstr); //전체메세지
	else if (is_same(buff,"all3"    )) to_all_say(3,0,buffstr); //전체메세지
	else if (is_same(buff,"all4"    )) to_all_say(4,0,buffstr); //전체메세지
	else if (is_same(buff,"all9"    )) to_all_say(9,0,buffstr); //전체메세지
	else if (is_same(buff,"/m"      )) {buff2cmd(buffstr,buff2,2);to_memo(0,mmc[1],buff2);}  //메세지보내기
	else if (is_same(buff,"/mm"     )) {buff2cmd(buffstr,buff2,2);to_memo(0,mmc[1],buff2);}  //메세지보내기
	else if (is_same(buff,"mm"      )) {buff2cmd(buffstr,buff2,2);to_memo(0,mmc[1],buff2);}  //메세지보내기
	else if (is_same(buff,"/x"))       host_end(0);             //종료
	else if (is_same(buff,"//"      )) view("forum/main/frm/say/macro.txt");
	else if (buff[0]=='/')             to_say(0,"",buffstr);    //귓속말
	else if (buff[0]=='.')             sys_menu(buffstr);       //시스템 관련 특별작업
	else if (is_same(buff,"findpf"))   findpf();
	else if (is_same(buff,"findbbs"))  bbs_find("findbbs");
	else if (is_same(buff,"findpds"))  bbs_find("findpds");
	else if (is_same(buff,"findpf1"))  bbs_find("findpf1");
	else if (is_same(buff,"findpf2"))  bbs_find("findpf2");
	else if (is_same(buff,"findpf3"))  bbs_find("findpf3");
    else if (is_same(buff,"lv"))       {
        if (club_mode) view("forum/main/frm/pf/clv.scr");
        else view("forum/main/frm/pf/lv.scr");
    }
	else if (is_same(buff,"log"))      {
		if (pf.type>=16&&strlen(mmc[1])>0) sys_tem("bin/viewlog 1 '%s' '%s'",mmc[1],club_go.code);
		else sys_tem("bin/viewlog 1 '%s' '%s'",pf.id,club_go.code);
	}
	else if (is_same(buff,"rc"))       log_rc(0);               //재접속
	else if (is_same(buff,"rcc"))      log_rc(1);               //재접속
	else if (is_same(buff,"login"))    log_rc(0);               //재접속
	else if (is_same(buff,"v"))        printf(VTXOFF);
	else if (now_type>=18&&strlen(buffstr)>2&&is_char("?~.!",buffstr[strlen(buffstr)-1])) to_all_say(8,0,buffstr); //전체메세지
	else if (is_same(buff,"zz"))       {
		printf(VTXOFF);printf(WTXOFF);view("forum/main/frm/system/_zz.scr");
		re_print=Yes;
	}
	else if (is_same(buff,"rlog")||is_same(buff,"relog")||is_same(buff,"login"))     {
		set_id_end();	   //해당 아이디 접속기록 종결
		start_id(1,"");
		re_print=Yes;			//화면출력
		re_logo=Yes;			//보조화면출력
		re_bbs=Yes; 			//게시판로딩
		re_club=No; 			//동호회초기화
		go_top(0);
	}
	else if (is_same(buff,"xx")||is_same(buff,"xy")||is_same(buff,"bye"))      {strcpy(auto_cmd,"x");host_end();}            //종료
	else if (is_same(buff,"x"))        {strcpy(auto_cmd,"x");endhost_ok();}
	else if (is_same(buff,"tm"))       sys_tem("bin/xbcal");
	else if (is_same(buff,"cal"))      sys_tem("bin/xbcal");
	else if (is_same(buff,"us" ))      view_user(0,0,mmc[1]);
	else if (is_same(buff,"h"))        view_help(0);     //도움말
	else if (is_same(buff,"?"))        view_help(0);        //도움말
	else if (is_same(buff,"c"))        view_help(0);        //명령어안내
	else if (is_same(buff,"help"))     view_help(2);
	else if (is_same(buff,"abc"))      edit_pf(mmc[1]);    //회원신상수정
	else if (is_same(buff,"pfc"))      edit_pf(mmc[1]);    //
	else if (is_same(buff,"pf"))       view_pfh(mmc[1]);     //회원신상
	else if (is_same(buff,"cpf"))      view_cpfh(mmc[1]);     //동호회신상

	else if (is_same(buff,"lst"))      bbs_search();        //전체문자 찾기
	else if (is_same(buff,"lsc"))      bbs_search();        //내용중 문자 찾기
	else if (is_same(buff,"lsl"))      bbs_search();        //내용중 문자 찾기
	else if (is_same(buff,"msg")||is_same(buff,"me"))  set_msg(0,mmc[1]);
	else if (is_same(buff,"ver"))      mess("V:%s M:%s D:%s",VER1,MAKENUM,MAKEDATE);
	else key=No;
	if (key&&is_char("rejnp",go.type)) go_prev();
	return key;
}

//MARK
typedef struct {
	char  mode;
	char  club[9];
	char  go  [9];
	char  sp  [40];
	int   sp1;
	int   sp2;
	time_t date;
} MARK;

my_mark(int mode)	   //0불러오기	1:저장
{
	FILE *fp;
	char filename[300];
	char buff[200];
	int i,n,found=No;
	MARK mark;
	GO old_club_go,old_go;
	int old_club_mode;
	old_go=go;
	old_club_go=club_go;
	old_club_mode=club_mode;
	if (guest_mode||bit(cfg.mode,5)) {
		mess("메뉴저장기능 사용불가능");
		return;
	}
	sprintf(filename,"userdata/%s/%s/mark.dat",c_han(pf.id),pf.id);
	n=mmn[1];
	if (n<0||n>9) n=0;
	if (mode==0) {
		if ((fp=fopen(filename,"r"))==NULL) return;
		fseek(fp,n*sizeof(mark),SEEK_SET);
		found=fread(&mark,sizeof(mark),1,fp);
		fclose(fp);
		if (is_same(old_club_go.code,mark.club)) strcpy(auto_cmd,mark.go);
		else sprintf(auto_cmd,"go %s %s",mark.club,mark.go);
		re_print=Yes;
		message("메뉴위치 %d 복구",n);
	}
	else if (mode==1) {
		if ((fp=fopen(filename,"r+"))==NULL) fp=fopen(filename,"w+");
		if (fp!=NULL) {
			mark.mode=1;
			strcpy(mark.club,club_go.code);
			strcpy(mark.go,go.code);
			time(&mark.date);
			fseek(fp,n*sizeof(mark),SEEK_SET);
			fwrite(&mark,sizeof(mark),1,fp);
			fclose(fp);
		}
		message("메뉴위치 %d 저장",n);
	}
}


findmenu(int mode)
{
	char buff[300];
	unlink(TMP_FILE2);
	sys_tem("bin/findmenu %d '%s' '%s'",mode,club_go.code,TMP_FILE2);
	file2buff(auto_cmd,TMP_FILE2,30);
}


logodndn()
{
	if (!bit(cfg.logomode,11)) {mess("logodndn 금지");return;}
	if (go.type=='m') sys_tem("%s %s/logo/%s.mnu",cfg.sz,club_go.dir,go.code);
	if (is_bbspds	) sys_tem("%s %s/logo/%s.*",cfg.sz,club_go.dir,go.code);
}


view_pfh()
{
}

view_cpfh()
{
}

bbs_find()
{
}


view_help(int mode)
{
	int n;
	char buff[300];
	if (mode==2) {
		while(1) {
			view("forum/main/frm/help/_help.scr");
			lineinput(buff,3);check_han(buff);printf("\n");
			n=atoi(buff);
			if (is_quit(buff)) break;
			if (n>0&&n<999) view("forum/main/frm/help/_help%d.hlp",n);
		}
	}
	else if (mode==0) { 	//전체화면으로 보여줌
		set_bbs_logo("hlp",buff);
		view(buff);
	}
}

edit_pf(char *tid)
{
	re_print=Yes;
	if (pf.type<18||strlen(tid)<3) strcpy(tid,pf.id);
	if (pf.type==0||guest_mode) {	  //테스트용으로 지정
		mess("손님은 사용할수 없습니다.");
		return;
	}
	sys_tem("bin/guest ____editpf '%s' '%s'",tid,pf.id);
	if (is_same(tid,pf.id)) read_pf(pf.id);  //자기의 신상일때 다시 읽음
}

