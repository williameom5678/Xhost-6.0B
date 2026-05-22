#include "bbs.h"

//화면출력모드
set_off(int mode)
{
	int n,oldmode=pf.mymode;
	char buff[100];
	pf.mymode=set_bit(pf.mymode,mode,bit(pf.mymode,mode)?0:1);
	re_print=Yes;
	strcpy(buff,"");
	if (mode== 2) strcpy(buff,rbit(pf.mymode, 2,"로고보임","로고안보임"));
	if (mode== 6) strcpy(buff,rbit(pf.mymode, 6,"안시보임","안시안보임")); //setansi
	if (mode== 7) strcpy(buff,rbit(pf.mymode, 7,"로고보임","로고안보임")); //setjob
	if (mode== 9) strcpy(buff,rbit(pf.mymode, 9,"명령보임","명령안보임")); //setjob
	if (mode==11) strcpy(buff,rbit(pf.mymode,11,"라인유지","자동줄넘김")); //setline
	if (oldmode!=pf.mymode&&strlen(buff)>0) {
		printf("\n ### 설정변경  %s ###\n",buff);fflush(stdout);
		sleep(1);
	}
}


//손님가입메뉴
do_guest()
{
	char buff[100];
	int n,mode=0;
	re_print=Yes;
    //go_top(0);
    //go_code("guest");
    //if (!is_same(go.code,"guest")) return No;
    if (bit(cfg.guestmode,14)) return No;  //가입불가능
	if (bit(cfg.infomode,9)||guest_mode||pf.type>=14) {
		set_stat2(18,"/guest");    //외부
		mode=atoi(go.wtimes);
        view("forum/main/frm/guest/guestwai.log");
		sprintf(buff,"%d",mode);
		n=sys_tem("bin/guest %d",mode);
//		  n=sys_exec(1,30*60,"bin/guest","guest",buff,"","");
		set_stat(1,"");
		if (n==1) ;
		else if (n==2) log_rc(0);
		else if (n==3) host_end(0);
		else if (bit(cfg.guestmode,4)) log_rc(0);
		else if (bit(cfg.guestmode,3)) host_end(0);
	}
	else message("손님만 가능합니다");
	go_prev();
	re_print=Yes;
	return (Yes);
}



//동호회 손님가입메뉴
//동호회의 회원자료에서 타입이 1로 등록한다.
// 0:거부 1:손님 2:대기 3:회원
do_cguest()
{
	int oldtype=cpf.type;
	if (!club_mode) return;
	sys_tem("bin/cguest '%s' '%s'",club_go.code,pf.id);
	if (go.type=='r') go_prev();
	check_cpf();			 //등급읽기 -> now_type
	if (oldtype==0&&cpf.type!=oldtype) re_club=Yes;
	re_print=Yes;
}


//가입해지신청을 함
do_pfout()
{
	char buff[100];
	if (guest_mode||bit(allmode,3)) return;
	if (bit(cfg.mode,18)) return;
	sys_tem("bin/ed_pf '%s' '%s' 99",pf.id,pf.id);
//	  sys_exec(1,30*60,"bin/ed_pf","ed_pf",pf.id,pf.id,"99");
//	  set_signal();  //시그날 재설정
	re_print=Yes;
}


// 문서를 보여주는 명령
run_pagescreen()
{
	char buff[200];
	if (go.type!='p'&&go.type!='h') return No;
	cls();
    sprintf(buff,"forum/%s/logo/%s.mnu",club_go.code,go.code);
	if (go.type=='h') view(buff);
	else			  view_text(buff);
	return Yes;
}


//상태기록 화일 저장
//각 tty별로 저장한다.
set_stat(int mode,char *buffstr)
{
	char buff[180],buff2[180],filename[100];
	FILE *fp;

	strcpy(buff2,buffstr);
	strcpy(moni.hostname,hostname);
	moni.type=pf.type;
	moni.mode2=0;
	moni.hostno=cfg.hostno;
	xstrncpy(moni.what,buff2,70);
	strcpy(moni.club,club_go.code);
	strcpy(moni.gocode,go.code);
    xstrncpy(moni.goname,go.name,20);
	moni.mode=mode;
	if (dark_mode) moni.mode=99;
	if (moni.mode<1) moni.mode=1;
	moni.pfnum=pf.num;
	strcpy(moni.id,pf.id);
	strcpy(moni.name,pf.name);
    moni.msg=pf.msg;     //초대 메세지
	moni.pid=getpid();
	moni.login=START_TIME;		  //접속시작시간
    moni.offmin=pf.offmin;
	strcpy(moni.tty,tty);
	if ( (is_char("ok",go.type)&&mode==5)||
         (is_char(BBSTYPE,go.type)&&mode==5&&bit(bcfg.mode,15)) ) return;
    sprintf(filename,"user/moni/user.%d.%s",cfg.hostno,no_spc(tty));
    if ((fp=fopen(filename, "w+"))==NULL) {
        check_dir("user/moni");
        fp=fopen(filename, "w+");
    }
    fprintf(fp,"%s\n%s\n%s\n",moni.id,moni.gocode,moni.goname);
    fseek(fp,400,SEEK_SET);
    fwrite(&moni,sizeof_moni,1,fp);
	fclose(fp);
}

//상태기록 화일 저장  현재 이름 바로 지정
set_stat2(int mode,char *buff)
{
	GO oldgo;
	char buff2[100];
	oldgo=go;
	strcpy(buff2,buff);
		 if (stristr(buff,"ranklog" )) strcpy(buff2,"최종접속");
	else if (stristr(buff,"rank"    )) strcpy(buff2,"순위확인");
	else if (stristr(buff,"bsysop"  )) strcpy(buff2,"게시판담당메뉴");
	else if (stristr(buff,"csysop"  )) strcpy(buff2,"동호회시삽메뉴");
	else if (stristr(buff,"sysop"   )) strcpy(buff2,"시삽메뉴");
	else if (stristr(buff,"ed_pf"   )) strcpy(buff2,"회원신상수정");
	else if (stristr(buff,"findname")) strcpy(buff2,"회원검색");
	else if (stristr(buff,"findbbs" )) strcpy(buff2,"자료검색");
	else if (stristr(buff,"quest"   )) strcpy(buff2,"설문지응답중");
	else if (stristr(buff,"/guest"  )) strcpy(buff2,"신규가입신청중");
	else if (stristr(buff,"/cguest" )) strcpy(buff2,"동호회가입신청중");
	else if (stristr(buff,"shell"   )) strcpy(buff2,"시스템쉘작업");
	else if (stristr(buff,"xcd"     )) strcpy(buff2,"사용자영역");
	else							   strcpy(buff2,go.name);
	sprintf(go.name,"%-30.30s",buff2);
	set_stat(mode,buff);
	go=oldgo;
}


del_stat(char *tty) 	  //상태기록 화일 해당 포트의 접속을 해제한다.
{
    unlink_file("user/moni/user.%d.%s",cfg.hostno,no_spc(tty));
}

del_stat_id(char *tid)		 //상태기록 화일 해당 포트의 접속을 해제한다.
{
	del_stat_("",tid);
}


del_stat_(char *tty,char *tid)		 //상태기록 화일 해당 포트의 접속을 해제한다.
{
}

