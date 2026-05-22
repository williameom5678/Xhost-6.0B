//기본 유틸리티
#include "bbs.h"
#include <unistd.h>    //디렉토리 화일명 변환함수때문에 필요
#include <dirent.h>    //디렉토리 화일명 변환함수때문에 필요
#include <fcntl.h>
#include <stdarg.h>

addslashes(char *buff,int size)
{
	int i,i2=0,len;
    char buff2[size+100];
	len=(int)strlen(buff);
    bzero(buff2,size+100);
	for (i=0;i<len&&i2<size;i++) {
		if (buff[i]=='\\'||buff[i]=='\"'||buff[i]=='\'') buff2[i2++]='\\';
		buff2[i2++]=buff[i];
	}
	strcpy(buff,buff2);
}

read_db_name(char *filename) {
    FILE *fp;
    char buff[100];
    if (!(fp=fopen(filename,"r"))) {
        printf("%s CFG READ error\n",filename);
        exit(1);
    }
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_HOST,buff);
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_USER,buff);
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_PASSWD,buff);
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_NAME,buff);
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_MAIL,buff);
    fgets(buff,20,fp);del_enter(buff);strcpy(DB_CM,buff);
    fclose(fp);
}

read_cfg()
{
	MYSQL	*sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	MYSQL_FIELD *qfield;
	char query[500],buff[500];
	int i,n;
    cfg.itype=cfg.wtype=0;
    cfg.rtype=cfg.dtype=0;
    strcpy(cfg.hostname,"XHOST-][");
    strcpy(cfg.sysop,"sysop");

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 0001: %s\n",mysql_error(&mysql));
        return No;
    }
    if ((mysql_select_db(sock, DB_NAME)) == -1) {
        printf("## ERR 0002: %s\n",mysql_error(sock));
        return No;
    }

	sprintf(query,"SELECT * FROM cfg");
	if (mysql_query(sock, query) == -1) return No;
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) == NULL) {
		sprintf(query,"insert into cfg (sysop) values ('sysop')");
		mysql_query(sock,query);
		return No;
	}
	i=0;
	while ((qfield = mysql_fetch_field(qres))) {
        //mess("%d.%s:%s,\n",i,qfield->name,qrow[i]);;;;;;;;
			 if (qrow[i]==NULL);
		else if (strcmp(qfield->name,"sysop")==0)        strcpy(cfg.sysop,qrow[i]);
		else if (strcmp(qfield->name,"passwd")==0)       strcpy(cfg.passwd,qrow[i]);
		else if (strcmp(qfield->name,"itype")==0)        cfg.itype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"rtype")==0)        cfg.rtype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"dtype")==0)        cfg.dtype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"wtype")==0)        cfg.wtype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"count_server")==0) cfg.count_server=atoi(qrow[i]);
		else if (strcmp(qfield->name,"sip")==0)          strcpy(cfg.sip,qrow[i]);
		else if (strncmp(qfield->name,"nip",3)==0)       {strcpy(buff,&qfield->name[3]);cfg.nip[atoi(buff)]=atoi(qrow[i]);}
		else if (strcmp(qfield->name,"gtype")==0)        cfg.gtype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"gage1")==0)        cfg.gage1=atoi(qrow[i]);
		else if (strcmp(qfield->name,"gage2")==0)        cfg.gage2=atoi(qrow[i]);
		else if (strcmp(qfield->name,"noticex")==0)      cfg.noticex=atoi(qrow[i]);
		else if (strcmp(qfield->name,"noticey")==0)      cfg.noticey=atoi(qrow[i]);
		else if (strcmp(qfield->name,"age1")==0)         cfg.age1=atoi(qrow[i]);
		else if (strcmp(qfield->name,"age2")==0)         cfg.age2=atoi(qrow[i]);
		else if (strcmp(qfield->name,"memo1")==0)        strcpy(cfg.memo1,qrow[i]);
		else if (strcmp(qfield->name,"memo2")==0)        strcpy(cfg.memo2,qrow[i]);
		else if (strcmp(qfield->name,"memo3")==0)        strcpy(cfg.memo3,qrow[i]);
		else if (strcmp(qfield->name,"memo4")==0)        strcpy(cfg.memo4,qrow[i]);
		else if (strcmp(qfield->name,"memo5")==0)        strcpy(cfg.memo5,qrow[i]);
		else if (strcmp(qfield->name,"memo6")==0)        strcpy(cfg.memo6,qrow[i]);
		else if (strcmp(qfield->name,"memo7")==0)        strcpy(cfg.memo7,qrow[i]);
		else if (strcmp(qfield->name,"memo8")==0)        strcpy(cfg.memo8,qrow[i]);
		else if (strcmp(qfield->name,"hostname")==0)     strcpy(cfg.hostname,qrow[i]);
        else if (strcmp(qfield->name,"basedir")==0)      strcpy(cfg.basedir,qrow[i]);
		else if (strcmp(qfield->name,"disp_memo1")==0)   cfg.disp_memo1=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo2")==0)   cfg.disp_memo2=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo3")==0)   cfg.disp_memo3=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo4")==0)   cfg.disp_memo4=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo5")==0)   cfg.disp_memo5=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo6")==0)   cfg.disp_memo6=atoi(qrow[i]);
		else if (strcmp(qfield->name,"disp_memo7")==0)   cfg.disp_memo7=atoi(qrow[i]);
        else if (strcmp(qfield->name,"disp_memo8")==0)   cfg.disp_memo8=atoi(qrow[i]);
		else if (strcmp(qfield->name,"skip_intro")==0)   cfg.skip_intro=atoi(qrow[i]);
		else if (strncmp(qfield->name,"atype",5)==0)     {strcpy(buff,&qfield->name[5]);strcpy(cfg.atype[atoi(buff)],qrow[i]);}
		else if (strncmp(qfield->name,"ajob",4)==0)      {strcpy(buff,&qfield->name[4]);strcpy(cfg.ajob[atoi(buff)],qrow[i]);}
		else if (strcmp(qfield->name,"guesttype")==0)    cfg.guesttype=atoi(qrow[i]);
		else if (strcmp(qfield->name,"guestin")==0)      cfg.guestin=atoi(qrow[i]);
        else if (strcmp(qfield->name,"alarm_time")==0)   cfg.alarm_time=atoi(qrow[i]);
        else if (strcmp(qfield->name,"waitkey")==0)      cfg.waitkey=atoi(qrow[i]);
        else if (strcmp(qfield->name,"view_notice")==0)  cfg.view_notice=atoi(qrow[i]);
        else if (strcmp(qfield->name,"relog")==0)        cfg.relog=atoi(qrow[i]);
        else if (strcmp(qfield->name,"allsay")==0)       cfg.allsay=atoi(qrow[i]);
        i++;
	}
	mysql_free_result(qres);
	mysql_close(sock);

	if (cfg.guesttype<1) cfg.guesttype=1;
	if (cfg.count_server<1) cfg.count_server=1; //접속서버수
    if (cfg.alarm_time<1) cfg.alarm_time=10;
    if (cfg.waitkey<1) cfg.waitkey=5;
	cfg.hostno%=20;
	if (cfg.count_server<cfg.hostno) cfg.count_server=cfg.hostno;
	if (!bit(cfg.mprocmode,0)) cfg.count_server=1; //접속서버수
    c_proc=is_file("c_proc.tag");
	return Yes;
}


read_bcfg()
{
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	MYSQL_FIELD *qfield;
	char table_name[100],query[500];

    bcfg.tline=15;
	strcpy(bcfg.sysop,"");strcpy(bcfg.sysop1,"");strcpy(bcfg.sysop2,"");strcpy(bcfg.sysop3,"");
	bcfg.bform=bcfg.line=bcfg.tline=0;
	bcfg.itype=bcfg.rtype=bcfg.dtype=bcfg.wtype=0;
	bcfg.total=bcfg.date=bcfg.date2=0;
    bcfg.use_file=bcfg.use_hide=0;

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) return No;
	if ((mysql_select_db(sock, DB_NAME)) == -1) return No;

	sprintf(query,"SELECT * FROM bcfg WHERE table_name='%s'",table_name);
	if (mysql_query(sock, query) == -1) return No;
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) == NULL) {
		sprintf(query,"insert into bcfg (table_name) values ('%s')",table_name);
		mysql_query(sock,query);
	}
	else {
		int i,n;
		i=0;
		while ((qfield = mysql_fetch_field(qres))) {
//			  printf("%d.%s:%s\n",i,qfield->name,qrow[i]);
				 if (qrow[i]==NULL);
			else if (strcmp(qfield->name,"name")==0)        strcpy(bcfg.name,qrow[i]);
			else if (strcmp(qfield->name,"sysop")==0)       strcpy(bcfg.sysop,qrow[i]);
			else if (strcmp(qfield->name,"sysop1")==0)      strcpy(bcfg.sysop1,qrow[i]);
			else if (strcmp(qfield->name,"sysop2")==0)      strcpy(bcfg.sysop2,qrow[i]);
			else if (strcmp(qfield->name,"sysop3")==0)      strcpy(bcfg.sysop3,qrow[i]);
			else if (strcmp(qfield->name,"passwd")==0)      strcpy(bcfg.passwd,qrow[i]);
			else if (strcmp(qfield->name,"itype")==0)       bcfg.itype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"rtype")==0)       bcfg.rtype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"dtype")==0)       bcfg.dtype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"wtype")==0)       bcfg.wtype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"ictype")==0)      bcfg.ictype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"rctype")==0)      bcfg.rctype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"dctype")==0)      bcfg.dctype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"wctype")==0)      bcfg.wctype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"bform")==0)       bcfg.bform=atoi(qrow[i]);
			else if (strcmp(qfield->name,"total")==0)       bcfg.total=atoi(qrow[i]);
			else if (strcmp(qfield->name,"tline")==0)       bcfg.tline=atoi(qrow[i]);
			else if (strcmp(qfield->name,"line")==0)        bcfg.line=atoi(qrow[i]);
			else if (strcmp(qfield->name,"num_hits")==0)    bcfg.num_hits=atoi(qrow[i]);
			else if (strcmp(qfield->name,"num_new")==0)     bcfg.num_new=atoi(qrow[i]);
			else if (strcmp(qfield->name,"date")==0)        bcfg.date=str2date2(qrow[i]);
			else if (strcmp(qfield->name,"date2")==0)       bcfg.date2=str2date2(qrow[i]);
			else if (strcmp(qfield->name,"use_ok")==0)      bcfg.use_ok=atoi(qrow[i]);
            else if (strcmp(qfield->name,"use_file")==0)    bcfg.use_file=qrow[i][0];
            else if (strcmp(qfield->name,"use_hide")==0)    bcfg.use_hide=qrow[i][0];
            else if (strcmp(qfield->name,"use_good")==0)    bcfg.use_good=qrow[i][0];
            else if (strcmp(qfield->name,"use_good3")==0)   bcfg.use_good3=qrow[i][0];
			i++;
		}
	}
	mysql_free_result(qres);
	mysql_close(sock);
	if (bcfg.tline<1) bcfg.tline=15;
	return Yes;
}


read_ccfg()
{
	char buff[100];
	char query[500];
	FILE *fp;
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	MYSQL_FIELD *qfield;
	//동호회 환경읽기
	ccfg.age1=ccfg.age2=ccfg.autoguest=ccfg.chatnum=0;
	ccfg.cintype=ccfg.disp_memo1=ccfg.disp_memo2=ccfg.disp_memo3=ccfg.disp_memo4=ccfg.disp_memo5=0;
	ccfg.gage1=ccfg.gage2=ccfg.gtype=ccfg.guestin=ccfg.guesttype=ccfg.hidetype=0;
	ccfg.intype=ccfg.modeopen=ccfg.notice=ccfg.noticet=ccfg.noticex=ccfg.noticey=0;
	ccfg.sametype=ccfg.skip_intro=ccfg.stop=ccfg.timelogo=0;
	strcpy(ccfg.enterp,"");
	strcpy(ccfg.memo1,"");strcpy(ccfg.memo2,"");strcpy(ccfg.memo3,"");strcpy(ccfg.memo4,"");strcpy(ccfg.memo5,"");
	strcpy(ccfg.name,"");strcpy(ccfg.passwd,"");strcpy(ccfg.sysop,"");
    if (is_same(club_go.code,"main")) return No;

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 5231: %s\n",mysql_error(&mysql));
		return No;
	}
	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		printf("## ERR 5232: %s\n",mysql_error(sock));
		mysql_close(sock);
		return No;
	}

	sprintf(query,"SELECT * FROM ccfg WHERE club='%s'",club_go.code);
    if (mysql_query(sock, query) == -1) {
        printf("## %s 동호회 환경파일 없음\n",club_go.code);
		mysql_close(sock);
		return No;
    }
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL) {
		int i,n;
		i=0;
		while ((qfield = mysql_fetch_field(qres))) {
            //mess("%d.%s:%s\n",i,qfield->name,qrow[i]);
                 if (qrow[i]==NULL) ;
            else if (strcmp(qfield->name,"name")==0)        strcpy(ccfg.name,qrow[i]);
            else if (strcmp(qfield->name,"sysop")==0)       strcpy(ccfg.sysop,qrow[i]);
			else if (strcmp(qfield->name,"passwd")==0)      strcpy(ccfg.passwd,qrow[i]);
			else if (strcmp(qfield->name,"enterp")==0)      strcpy(ccfg.enterp,qrow[i]);
			else if (strcmp(qfield->name,"notice")==0)      ccfg.notice=atoi(qrow[i]);
			else if (strcmp(qfield->name,"noticet")==0)     ccfg.noticet=atoi(qrow[i]);
			else if (strcmp(qfield->name,"autoguest")==0)   ccfg.autoguest=atoi(qrow[i]);
			else if (strcmp(qfield->name,"guesttype")==0)   ccfg.guesttype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"guestin")==0)     ccfg.guestin=atoi(qrow[i]);
			else if (strcmp(qfield->name,"gtype")==0)       ccfg.gtype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"gage1")==0)       ccfg.gage1=atoi(qrow[i]);
			else if (strcmp(qfield->name,"gage2")==0)       ccfg.gage2=atoi(qrow[i]);
			else if (strcmp(qfield->name,"modeopen")==0)    ccfg.modeopen=atoi(qrow[i]);
			else if (strcmp(qfield->name,"noticex")==0)     ccfg.noticex=atoi(qrow[i]);
			else if (strcmp(qfield->name,"noticey")==0)     ccfg.noticey=atoi(qrow[i]);
			else if (strcmp(qfield->name,"chatnum")==0)     ccfg.chatnum=atoi(qrow[i]);
			else if (strcmp(qfield->name,"intype")==0)      ccfg.intype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"cintype")==0)     ccfg.cintype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"stop")==0)        ccfg.stop=atoi(qrow[i]);
			else if (strcmp(qfield->name,"sametype")==0)    ccfg.sametype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"hidetype")==0)    ccfg.hidetype=atoi(qrow[i]);
			else if (strcmp(qfield->name,"timelogo")==0)    ccfg.timelogo=atoi(qrow[i]);
			else if (strcmp(qfield->name,"age1")==0)        ccfg.age1=atoi(qrow[i]);
			else if (strcmp(qfield->name,"age2")==0)        ccfg.age2=atoi(qrow[i]);
			else if (strcmp(qfield->name,"name")==0)        strcpy(ccfg.name,qrow[i]);
			else if (strcmp(qfield->name,"memo1")==0)       strcpy(ccfg.memo1,qrow[i]);
			else if (strcmp(qfield->name,"memo2")==0)       strcpy(ccfg.memo2,qrow[i]);
			else if (strcmp(qfield->name,"memo3")==0)       strcpy(ccfg.memo3,qrow[i]);
			else if (strcmp(qfield->name,"memo4")==0)       strcpy(ccfg.memo4,qrow[i]);
			else if (strcmp(qfield->name,"memo5")==0)       strcpy(ccfg.memo5,qrow[i]);
			else if (strcmp(qfield->name,"disp_memo1")==0)  ccfg.disp_memo1=atoi(qrow[i]);
			else if (strcmp(qfield->name,"disp_memo2")==0)  ccfg.disp_memo2=atoi(qrow[i]);
			else if (strcmp(qfield->name,"disp_memo3")==0)  ccfg.disp_memo3=atoi(qrow[i]);
			else if (strcmp(qfield->name,"disp_memo4")==0)  ccfg.disp_memo4=atoi(qrow[i]);
			else if (strcmp(qfield->name,"disp_memo5")==0)  ccfg.disp_memo5=atoi(qrow[i]);
			else if (strcmp(qfield->name,"skip_intro")==0)  ccfg.skip_intro=atoi(qrow[i]);
			else if (strncmp(qfield->name,"atype",5)==0)    {strcpy(buff,&qfield->name[5]);strcpy(ccfg.atype[atoi(buff)],qrow[i]);}
            else if (strcmp(qfield->name,"itype")==0)       ccfg.itype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"rtype")==0)       ccfg.rtype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"dtype")==0)       ccfg.dtype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"wtype")==0)       ccfg.wtype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"ictype")==0)      ccfg.ictype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"rctype")==0)      ccfg.rctype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"dctype")==0)      ccfg.dctype=atoi(qrow[i]);
            else if (strcmp(qfield->name,"wctype")==0)      ccfg.wctype=atoi(qrow[i]);
			i++;
		}
	}
	mysql_free_result(qres);
	mysql_close(sock);
	return Yes;
}


// 동호회 코드 찾아서 club_go에 저장
find_club(char *code)
{
	FILE *fp;
	GO go1,oldgo;
	int i;
	int found=No;
	if (strlen(code)<1) return No;
	oldgo=go;
	club_mode=No;
	strcpy(club_go.code,"main");
	strcpy(club_go.dir,".");
	sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
	if (is_same(code,"main")) return Yes;
	if ((fp=fopen(NOW_MENU,"r+"))!=NULL) {
		while(fread(&go1,sizeof_go,1,fp)) {
			if (is_same(go1.code,code)&&go1.type=='s') {
				found=Yes;
				club_go=go1;
				club_mode=Yes;
				sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
				read_ccfg();
				break;
			}
		}
		fclose(fp);
	}
	go=oldgo;
	return found;
}


int check_pass(char *pass,int num,char *mess)
{
	char buff2[10];
	int i;
	if (strlen(pass)<1) return Yes;
	for (i=1;i<4;i++) {
		printf("\n");
		printf("%s",mess);
		passinput(buff2,num);  //암호입력
		printf("\n");
		if (is_same(pass,buff2)) return Yes;
		printf("  암호가 틀립니다.\n");
	}
	return No;
}

int check_pass2(int pass,int num,char *mess)
{
	char buff[10];
	sprintf(buff,"%d",pass);
	return (check_pass(buff,num,mess));
}

//입력한 내용을 mmc(문자)와 mmn(번호) 으로 분해한다
//구분자는 - , 이다

//6:등록 8:다운 18:작업
set_statdown(int mode)		 //메세지 수신방지
{
	FILE *fp;
	int i=0;
	MONI moni;
	char buff[200];
	char filename[100],filename2[100];
	sprintf(filename,"user/moni/moni%d.dat",cfg.hostno);
	if ((fp=fopen(filename,"r+"))==NULL) return;
	while (fread(&moni,sizeof_moni,1,fp)) {
		if(moni.mode>0&&
			is_same(moni.tty,tty)&&
			moni.mode!=mode) {
			OLD_MONI_MODE=moni.mode;  //복구를 위해..
			moni.mode=mode;
			fseek(fp,i*sizeof_moni,SEEK_SET);
			mymoni_rec=i;
			fwrite(&moni,sizeof_moni,1,fp);
			break;
		}
		i++;
	}
	fclose(fp);
    fflush(NULL);
	//다운,업시 시간확인금지해제
	if (mode==6||mode==8) allmode=set_bit(allmode2,2,1);
}


set_tmpfile()		//임시화일지정하기
{
	sprintf(TMP_FILE ,"tmp/tmp0%d%s",cfg.hostno,no_spc(tty));   //호스트번호별임시화일
	sprintf(TMP_FILE1,"tmp/tmp1%d%s",cfg.hostno,no_spc(tty));   //호스트번호별임시화일
	sprintf(TMP_FILE2,"tmp/tmp2%d%s",cfg.hostno,no_spc(tty));   //호스트번호별임시화일
	sprintf(LT_FILE  ,"tmp/tmpt%d%s",cfg.hostno,no_spc(tty)); // 임시화일
}
set_bcfgfile()
{
	sprintf(BCFG_FILE,"%s/bbsdata/%s/bcfg",club_go.dir,go.code);
}

clear_menu()
{
	go.deep=9;
	go.type=' ';
	bzero(go.num,5);
	bzero(go.code,9);
	bzero(go.name,31);
	bzero(go.wtimes,4);
	bzero(go.dir,61);
}

char *byte2str(int size)
{
	static char buff[20];
	if		(size<1000) sprintf(buff,"%dB",size);
	else if (size>=1000&&size<1024) sprintf(buff,"%.1fK",(float)size/1000);
	else if (size>=1024&&size<10000) sprintf(buff,"%.1fK",(float)size/1024);
	else if (size>=10024&&size<1000000) sprintf(buff,"%dK",size/1024);
	else if (size>=1000000&&size<10000000) sprintf(buff,"%.1fM",(float)size/1000000);
	else if (size>=10000000) sprintf(buff,"%dM",size/1000000);
	return (buff);
}


xedit(const char *fmt,...)
{
	char buff[300];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	xedit_(buff);
	return Yes;
}


xedit2(const char *fmt,...)
{
	char buff[300];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	xedit_(buff);
	if(file_size(buff)<5) unlink(buff);
	return Yes;
}


xedit_(char *buff)
{
	int i;
	del_esc3(buff);del_clear(buff);
	if (strlen(buff)<1) {printf("\n ### editor1 파일지정안됨\n");return;}
	xy(1,30);
	for (i=30;i--;) printf("\n");
//    sys_tem("bin/editor1 -w '%s'",buff);
    sys_tem("bin/editor1 '%s'",buff);
}


check_han(char *buff)
{
	int i,n,found=No;
	char buff1[200];
	char buff2[4];
    if (strlen(buff)<2) return No;
    if (strlen(buff)==2||strlen(buff)==4) {
        found=Yes;
             if (strcmp(buff,"우")==0) strcpy(buff,"dn");
        else if (strcmp(buff,"ㅇㅇ")==0) strcpy(buff,"dd");
        else if (strcmp(buff,"ㅣㄴ")==0) strcpy(buff,"ls");
        else if (strcmp(buff,"ㅣㅋ")==0) strcpy(buff,"lz");
        else if (strcmp(buff,"ㅣㅅ")==0) strcpy(buff,"lt");
        else if (strcmp(buff,"ㅡㅡ")==0) strcpy(buff,"mm");
        else if (strcmp(buff,"ㅕㄴ")==0) strcpy(buff,"us");
        else if (strcmp(buff,"ㅣㅜ")==0) strcpy(buff,"ln");
        else if (strcmp(buff,"ㅣㅑ")==0) strcpy(buff,"li");
        else if (strcmp(buff,"ㄱㅁ")==0) strcpy(buff,"ra");
        else if (strcmp(buff,"ㄱㄷ")==0) strcpy(buff,"re");
        else if (strcmp(buff,"ㄱㅅ")==0) strcpy(buff,"rt");
        else if (strcmp(buff,"ㄴ묘")==0) strcpy(buff,"say");
        else found=No;
        if (found) return Yes;
    }

    if (strlen(buff)>3) return No;
	if (strlen(buff)==2&&!ishangul(buff[0])) return No;
	if (strlen(buff)==3&&buff[0]!='/') return No;
	if (strlen(buff)==3&&buff[0]=='/'&&!ishangul(buff[0])) return No;
	if (strlen(buff)==3&&buff[0]=='/') strcpy(buff2,&buff[1]);
	else strcpy(buff2,buff);


	strcpy(buff1,"ㅁㅠㅊㅇㄷㄹㅎㅗㅑㅓㅏㅣㅡㅜㅐㅔㅂㄱㄴㅅㅕㅍㅈㅌㅛㅋ");
	for (i=0;i<26;i++) {
		if (buff1[i*2+0]==buff2[0]&&buff1[i*2+1]==buff2[1]) {
			buff2[0]='a'+i;
			buff2[1]=0;
			found=Yes;
			break;
		}
	}
	if (found) {
		if (strlen(buff)==3&&buff[0]=='/') sprintf(buff,"/%s",buff2);
		else							   strcpy(buff,buff2);
	}
	return found;
}


bbs_man(char *id)
{
	if (pf.type>=17) return Yes;
	if (club_mode&&cpf.type>=17) return Yes;
	if (is_same(go.code,"rmail")||is_same(go.code,"cmail")||
		is_same(go.code,"userroom")||is_same(go.code,"mbox")) return Yes;
    if (is_same(bcfg.sysop,id)||
        is_same(bcfg.sysop1,id)||
        is_same(bcfg.sysop2,id)||
        is_same(bcfg.sysop3,id)) return Yes;
	return No;
}


str_typenum(char *filename,char *str)
{
	FILE *fp;
	int n,i,ret,found;
	char buff1[300],buff2[300];
	char mms[30][180];

	if (str[0]==0||(fp=fopen(filename,"r+"))==NULL) return 0;
	found=No;
	ret=0;
	while (!found&&fgets(buff1,200,fp)!=NULL) {
		for (i=0;i<30;i++) strcpy(mms[i],"");
		sscanf(buff1,"%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
		mms[0],mms[1],mms[2],mms[3],mms[4],mms[5],mms[6],mms[7],mms[8],mms[9],
		mms[10],mms[11],mms[12],mms[13],mms[14],mms[15],mms[16],mms[17],mms[18],mms[19],
		mms[20],mms[21],mms[22],mms[23],mms[24],mms[25],mms[26],mms[27],mms[28],mms[29]);
		for (i=1;!found&&i<30;i++) {
			if (is_same(mms[i],str)) {
				found=Yes;
				break;
				ret=atoi(mms[0]);
			}
		}
	}
	fclose(fp);
	return ret;
}

int ishan(unsigned char *str)
{
	int i;
	for(i=0;i<(int)strlen(str);i+=2) {
		if(!is_hangul(str+i)) return 0;
	}
	return 1;
}

int is_hangul(unsigned char *str)
{
	/* 순수한 한글인지 검사 */
	if(str[0]>=0xb0 && str[0]<=0xc8 && str[1]>=0xa1 && str[1]<=0xfe) return 1;
	return 0;
}


//암호모음
spass(int mode,char buff)
{
	char filename[200];
	strcpy(filename,"system/spass.dat");
}


#include <utmp.h>
#define STRUCT_UTMP struct utmp
char *view_network(char *tty)
{
	register STRUCT_UTMP utmp_entry;
	static char hostbuff[20];
	FILE *fp;
	STRUCT_UTMP utmp;
	if (bit(allmode2,10)&&strlen(hostname)>0) {
		strcpy(hostbuff,hostname);
		return (hostbuff);
	}
	strcpy(hostbuff,tty);
//	  printf("잠시테스트중.. 잠시후 rc로 재접속하세요.\n");printf(cfg.utmpfile);pressenter();
	if (strlen(cfg.utmpfile)<3||(fp=fopen(cfg.utmpfile,"r"))==NULL) return (hostbuff);
	while (fread (&utmp,1,sizeof(utmp),fp)) {  //읽어냄
		if (utmp.ut_name[0]&&!strncmp(tty, utmp.ut_line, sizeof (utmp.ut_line))) {
			xstrncpy(hostbuff,utmp.ut_host,20);
			break;
		}
	}
	fclose(fp);
	del_space(hostbuff);
	del_esc(hostbuff);
	return (hostbuff);
}



str_filedir(char *str,char *dir,char *filename)
{
	char buff1[300],buff2[300];
	int i;
	strcpy(dir,"");
	strcpy(filename,"");
	strcpy(buff1,str);
	for (i=(int)strlen(buff1)-2;i>=0;i--) {
		if (buff1[i]=='/') {
			strcpy(buff2,&buff1[i+1]);	   //파일명
			buff1[i+1]=0;
			break;
		}
	}
	if (i<0) {
		strcpy(dir,"./");
		strcpy(filename,buff1);
	}
	else {
		buff2[12]=0;
		strcpy(dir,buff1);
		strcpy(filename,buff2);
	}
}


//디렉토리와 화일명을 입력받아 분해한다.
get_filename(char *dir, char *filename,char *def_ups)
{
	int n,i;
	char buff[380];
	char buff2[380];
	strcpy(dir,"");
	strcpy(filename,"");
	if (strlen(def_ups)>0) printf("%s/",def_ups);
	lineinput(buff,120);check_han(buff);printf("\n");
	if (strlen(buff)<1) return No;
	else if (is_same(buff,"q")||is_same(buff,"p")) return No;
	else if (is_same(buff,"x")||is_same(buff,".")) return No;
	if (buff[0]!='/'&&strlen(def_ups)>0) {
		sprintf(buff2,"%s/%s",def_ups,buff);
		strcpy(buff,buff2);
	}
	str_filedir(buff,dir,filename);
	return Yes;
}

//메뉴를 초기 메뉴코드로 선택함
set_top()
{
	strcpy(go.code,"top");
	strcpy(go.name,"초기메뉴");
	go.type='m';
	club_mode=No;
	club_go.rec=0;
	strcpy(club_go.dir,".");
	strcpy(club_go.code,"main");
}


char *bbs_tail()
{
	static char tail[10];
	int mode=0;
	strcpy(tail,"");
		 if (is_typebbs) mode=1;
	else if (is_typepds) mode=2;
	//화면 표시 시작
	if		(is_same(go.code,"top"))          strcpy(tail,"top");
	else if (is_same(go.code,"rmail"))        strcpy(tail,"rma");
	else if (is_same(go.code,"mbox"))         strcpy(tail,"rmb");
    else if (is_same(go.code,"cmail"))        strcpy(tail,"rmc");
    else if (is_same(go.code,"wmail"))        strcpy(tail,"rmw");
    else if (is_same(go.code,"dbox"))         strcpy(tail,"rmd");
	else if (is_same(go.code,"userroom"))     strcpy(tail,"use");
	else if (is_char(go.wtimes,'*'))          strcpy(tail,"nos");
	else if (is_char(go.wtimes,'-'))          strcpy(tail,"noo");
	else if (is_same(go.code,"notice"))       strcpy(tail,"not");
	else if (is_same(go.code,"bbs_all"))      strcpy(tail,"zab");
	else if (is_same(go.code,"pds_all"))      strcpy(tail,"zap");
	else if (is_same(go.code,"dncart"))       strcpy(tail,"dnc");
	else if (go.type=='m')                    strcpy(tail,"sub");
	else if (go.type=='g')                    strcpy(tail,"gub");
	else if (go.type=='y')                    strcpy(tail,"gup");
	else if (go.type=='d')                    strcpy(tail,"dir");
	else if (go.type=='w')                    strcpy(tail,"wtx");
	else if (mode==1&&is_typevtx)			  strcpy(tail,"vtx");
	else if (go.type=='q')                    strcpy(tail,"que");
	else if (is_typesecu)					  strcpy(tail,"sec");
    else if (is_typecons&&!bbs_man(pf.id))    strcpy(tail,"sek");
	else if (is_typecons)					  strcpy(tail,"sem");
	else if (go.type=='b')                    strcpy(tail,"zbb");
	else if (go.type=='z')                    strcpy(tail,"zbp");
	else if (mode==1)						  strcpy(tail,"bbs");
	else if (mode==2)						  strcpy(tail,"pds");
	else									  strcpy(tail,"def");
	return (tail);
}



save_rec(int mode,int job,char *buff)
{
	char filename[300];
	char buff2[300];
	char stty[10];
	char shostname[40];
	if (bit(allmode,29)) return;
	if (bit(allmode,30)) return;
	if (strlen(buff)<3) return;
	strcpy(shostname,hostname);shostname[30]=0;del_space(shostname);
	if (strlen(shostname)<1) strcpy(shostname,".");
	strcpy(stty,&tty[3]);strcat(stty,"    ");stty[4]=0;
	if (job<0||job>24) job=24;
	if (strlen(go.code)<1) strcpy(go.code,".");
	if (strlen(club_go.code)<1) strcpy(club_go.code,".");
	if (strlen(pf.id)<1) strcpy(pf.id,".");
	sprintf(filename,"user/rec/rec_%s.txt",now_str(12));
	sprintf(buff2,"%s %3d %s %-8s %2d %-8s %-8s %2d %-4s%d %-30s %s\n",
	now_str(3),cfg.hostno,stty,pf.id,pf.type,club_go.code,go.code,job,awork[job>24?24:job],mode,shostname,buff);
	del_esc(buff2);
	if (!bit(cfg.mrecmode,4)) put_line(buff2,filename);
}


check_cmd(char *buffstr)
{
	int i,i1,i2,i3;
	int n1,n2;
	int first,lastno;
	int mmt[301];
	char c;
	char buff[220];
	char buff2[220];
	char mms[70][200];

	//최기화
	bzero(&mmn,sizeof(mmn));
	bzero(&mmc,sizeof(mmc));
	bzero(&mmt,sizeof(mmt));
	bzero(&mms,sizeof(mms));

	if (buffstr[0]==0||strlen(buffstr)>170) return;
	strcpy(buff,buffstr);
	i=i1=i2=i3=n1=n2=0;
	first=0;

	//명령->mms로 분해
	i1=i2=0;
	for (i=0;i<(int)strlen(buffstr)&&i1<30;i++) {
		c=buffstr[i];
		if (c==0||c=='\n'||c=='\r') break;
		else if (c==' '||c==',') {i1++;i2=0;}
		else mms[i1][i2++]=c;
	}

	//mms를 숫자로 분해
	first=0;
	for (i=0;i<30&&first<300;i++) {
		strcpy(buff,mms[i]);
		del_space(buff);
		if (buff[0]==0) continue;
		if(is_char(buff,'-')) {        // - 포함여부    -10 10-20  20-
			if (strlen(buff)<2);	   // -한자면 무시
			else if (buff[0]=='-') {     //  -??
				n2=atoi(buff+1);
				for (i2=1;i2<=n2&&first<300;i2++) mmt[first++]=i2;
			}
			else if (buff[strlen(buff)-1]=='-') {     //  ??-
				strchng(buff2,buff,"-","");
				n1=atoi(buff2);if(n1<1) n1=1;
				while (n1>=0&&first<300) mmt[first++]=n1++;
			}
			else {								 //??-??
				n1=atoi(buff);
				n2=0;
				i2=0; while (buff[i2]) if (buff[i2++]=='-') n2=atoi(buff+i2);
				if (n1<1) n1=1;
				if (n2<1) n2=1;
				if (n1<=n2) for (i2=n1;i2<=n2&&first<300;i2++) mmt[first++]=i2;
				else		for (i2=n2;i2<=n1&&first<300;i2++) mmt[first++]=i2;
			}
		}
		else mmt[first++]=atoi(buff);
	}


	if (is_bbspds) {
		for (i=1;i<15;i++) {
			if (is_same(mms[i],"con")) {
				for (i2=0;i2<50;i2++) {
					mmt[i2+1]=list_anum[i2];
					sprintf(mms[i+i2],"%d",mmt[i2+1]);
				}
				break;
			}
			else if (is_same(mms[i],"rcon")) {
				for (i2=0;i2<50;i2++) {
					mmt[i2+1]=list_anum[49-i2];
					sprintf(mms[i+i2],"%d",mmt[i2+1]);
				}
				break;
			}
		}
	}
	//0 또는 같은숫자가 나온것은 무시한다.
	//mmt -> mmn으로
	for (i=0;i<101;i++) mmn[i]=0;
	mmn[0]=mmt[0];	   //첫번호는 무조건
	first=1;
	for (i=1;i<300&&first<101;i++) {
		if (mmt[i]>0) {
			for (i2=0;i2<101;i2++) if (mmt[i]==mmn[i2]) break;
			if (i2>=101&&mmt[i]>=0) mmn[first++]=mmt[i];
		}
	}
	//같은 문자가 나온것은 무시한다.
	//mms -> mmc로
	first=0;
	for (i=0;i<30&&first<100;i++) {
		mms[i][20]=0;
		if (mms[i][0]!=0) {
			for (i2=0;i2<10;i2++) if (is_same(mmc[i2],mms[i])) break;
			if (i2>=10) strcpy(mmc[first++],mms[i]);
		}
	}
	strlwr(mmc[0]);    //첫번째 명령은 소문자로
}


//file1->file2 소팅
xsort(int mode,char *file1,char *file2)
{
	char buff[500];
	if (strlen(file1)<1||strlen(file2)<1||is_same(file1,file2)) return;
	unlink(file2);
	if (mode==0) sprintf(buff,"sort '%s' -o '%s'",file1,file2);
	else		 sprintf(buff,"sort -r '%s' -o '%s'",file1,file2);
	system(buff);
}


//한글을 끝에서 부터 카운터 해서 짝이맞지않으면 지운다.
int text_cut(char *str, int len)
{
    int i,is_ok,i2;
    is_ok=Yes;
    i2=strlen(str);
    if (len<i2) i2=len;
    str[i2]=0;

    for (i=len;i>0;i--) {
        if ((unsigned char)str[i-1]>130) is_ok=!is_ok; //한글이다.
        else break;
    }
    if (!is_ok) str[strlen(str)-1]=0;
}

sz(char *filename)
{
	int n;
	if (strlen(filename)<1) n=-1;
	else n=sys_tem("sz %s",filename);
	printf("\n");
	fflush(NULL);
	return n;
}

rz()
{
	int n;
	n=sys_tem("rz");
	printf("\n");
	fflush(NULL);
	return n;
}


sz_file(char *filename)
{
	int n,n2,ret;
	char buff[280];
	char   DEF_UPS[81];    // UPS 기본DIR
	char   DEF_DNS[51];    // DNS 기본DIR

	if (!is_file(filename)) goto _fail;
	strcpy(g_buff4,pf.type==19?"9.DNS  ":"");
	view("forum/main/frm/down/select.log");
	lineinput(buff,2);check_han(buff);printf("\n");n2=atoi(buff);
	if (strlen(buff)<1) n2=1;
	if (is_char("nNqQxXpP0",buff[0])) goto _fail;
	set_statdown(8);	   //메세지 수신방지
	if (pf.type==19&&n2==9) {
		_cont4:
		view("forum/main/frm/down/dns.log");
		lineinput(DEF_DNS,50);check_han(DEF_DNS);printf("\n");
		if (strlen(DEF_DNS)<2) goto _fail;
		if (!is_dir(DEF_DNS)||in_file2("system/cannot.dir",DEF_DNS)) {
			printf(" 디렉토리를 찾을수 없습니다.\n");
			goto _cont4;
		}
		sys_tem("cp -f %s %s",filename,DEF_DNS);
	}
	else			{view("forum/main/frm/down/zmodem.log");sz(filename);      }
	view("forum/main/frm/down/downok.log");   //전송취소
	set_statdown(OLD_MONI_MODE);	   //메세지 수신방지
	return Yes;

	_fail:
	view("forum/main/frm/down/downfaip.log");   //전송취소
	set_statdown(OLD_MONI_MODE);	   //메세지 수신방지
	return No;
}

rz_file(char *filename)  //화일전송받기  ->파일명에 저장
{
	int n,n2,ret;
    char olddir[280];
	char newdir[280];
	char buff[280];
	char rzfilename[280];

	_cont:
	strcpy(filename,"");
	getcwd(olddir,sizeof(olddir));		//현재의 디렉토리
	strcpy(g_buff4,"");
	if (bit(allmode,14)||(pf.type==18&&!bit(cfg.downmode,17))||(pf.type==19&&!bit(cfg.downmode,18)))
		strcpy(g_buff4,"99.UPS");
	view("forum/main/frm/down/upload.log");
	lineinput(buff,4);check_han(buff);n2=atoi(buff);
	if (strlen(buff)<1) n2=1;
	if (is_char("nNqQxXpP0",buff[0])) goto _fail;
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	if (c_proc) printf("NEWDIR:%s\n",newdir);
	rm_tmpup();
	if (n2==1||n2==2) {
		set_statdown(6);	  //메세지 수신방지
		check_dir(newdir);
		if (n2==1) {
			view("forum/main/frm/down/uploadz.log");
			ch_dir(newdir);
			rz();
			if (c_proc) {
				getcwd(buff,sizeof(buff));		//현재의 디렉토리
				printf("현재위치:%s  전송완료\n",buff);
				system("ls -l");
				pressenter();
			}
		}
		set_statdown(OLD_MONI_MODE);	   //메세지 수신방지
//		  sys_tem("%s/bin/xlower",olddir);      //현재의 디렉토리
		if (dir_filename(rzfilename,"./")>0&&strlen(rzfilename)>0)
			sprintf(filename,"tmp/up%d%s/%s",cfg.hostno,no_spc(tty),rzfilename);
		ch_dir(olddir); 			 //원래 디렉토리
	}
	else if (n2==88) {
		autoup=autoup?No:Yes;
		goto _cont;
	}
	else if (n2==99&&(bit(allmode,14)||(pf.type==18&&!bit(cfg.downmode,17))||(pf.type==19&&!bit(cfg.downmode,18)))) {
		up_file(99,filename,Yes);	//시삽 지정 업
	}
	else goto _fail;

	if (autoup) nostop=Yes; 	//자동등록
	view("forum/main/frm/down/uploado.log");   //Enter키
	strcpy(buff,filename);
	n=file_size(filename);
	if (c_proc) {
		getcwd(buff,sizeof(buff));		//현재의 디렉토리
		printf("파일명:%s 크기:%d\n",filename,n);
	}
	if (strlen(filename)<1||!is_file(filename)||n<1) goto _fail;
	pure_name(0,buff);				//화일명에서 순수한 화일부분만 뽑아냄
	strcpy(g_buff1,buff);			//화일명
	sprintf(g_buff2,"%d",n);        //화일크기
	if (autoup) nostop=Yes; 	//자동등록
	view("forum/main/frm/down/uploade.log");   //전송완료
	if (!good_filename(filename)) goto _fail;
	if (autoup||yesno("",Yes)) chmod(filename,0777);
	else goto _fail;
	return Yes;

	_fail:
	ch_dir(olddir); 	 //원래 디렉토리
	view("forum/main/frm/down/uploadc.log");   //전송취소
	if (is_file(filename)) unlink(filename);
	rm_tmpup();
	return No;
}


//TMP_FILE 에 적는다.  mode=99:UPS저장	mode==98:비게시판내용입력
input_tmp(int mode)
{
	char buff[100];
	int ret=Yes,n=0;
	strcpy(buff,"");
	if (mode==99)				 n=99;
	else if (bit(bcfg.wmode,19)) n=3;
	else if (bit(bcfg.wmode, 7)) n=1;
	else {
		strcpy(g_buff4,pf.type>=18?"99.UPS":"");
		if (!view("forum/main/frm/editor/select.%s",mode==98?".log":bbs_tail())) {
			printf(" 1.화면편집기 2.라인편집기 3.설명Zmodem %s 0.취소\n",g_buff4);
			printf(" 번호선택(ENTER:화면편집기) >> ");
		}
		lineinput(buff,10);check_han(buff);printf("\n");
		n=atoi(buff);
		if (is_char("qp0QPxX",buff[0])) goto _fail;
	}

	unlink(TMP_FILE);
		 if (n== 3) ret=up_text(1,TMP_FILE);  //다운받아서지정화일로 바꾼다.
	else if (n== 4) ret=up_text(2,TMP_FILE);  //다운받아서지정화일로 바꾼다.
	else if (n==99) ret=up_text(99,TMP_FILE);
	else if (n== 2) ret=bbs_editor(2);
	else			ret=bbs_editor(1);

	if (ret==No||!is_file(TMP_FILE)) goto _fail;	  //취소시
	return ret;

	_fail:
	unlink(TMP_FILE);
	return No;
}


edit_tmp()
{
	char buff[280],buff1[280];
	int i,n,key,ret=No;
	strcpy(g_buff4,pf.type>=18?"99.UPS":"");
	view("forum/main/frm/editor/select.%s",bbs_tail());
	lineinput(buff,10);check_han(buff);printf("\n");
	n=atoi(buff);
	if (is_char("qp0QPxX",buff[0])) return No;
		 if (n== 3) ret=up_text(1,TMP_FILE);  //다운받아서지정화일로 바꾼다.
	else if (n== 4) ret=up_text(2,TMP_FILE);  //다운받아서지정화일로 바꾼다.
	else if (n==99) ret=up_text(99,TMP_FILE);
	else			ret=xedit(TMP_FILE);
	return ret;
}



bbs_editor(int mode)
{
	int key;
	char buff[60];
	FILE *fp1;
	FILE *fp2;
	int i;
	char c;
	int ret=Yes;
	if (strlen(TMP_FILE)<1) {printf("\n### TMP_FILE 파일지정안됨\n");return No;}
	if (mode<10) unlink(TMP_FILE);
	mode%=10;
	if (mode<=1) for (i=0;i<30;i++) printf("\n");
//    if (mode==1&&strlen(pf.id)>0&&bit(pf.mymode,11)) sys_tem("bin/editor%d -w '%s'",mode,TMP_FILE);
//    else sys_tem("bin/editor%d '%s'",mode,TMP_FILE);
    sys_tem("bin/editor%d '%s'",mode,TMP_FILE);
	if (!is_file(TMP_FILE)) return No;
	if (bit(bcfg.wmode,17)&&file_size(TMP_FILE)<10) {
		unlink(TMP_FILE);
		view("forum/main/frm/editor/writeert.%s",bbs_tail());
		return No;
	}
	return (ret);
}




rm_tmpup()
{
	char buff[300];
	if (strlen(tty)<1) return;
	sprintf(buff,"rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
	system(buff);
}


//mode=1:zmodem  99:UPS 0:선택
//check 파일 존재여부 검사
up_file(int mode,char *filename,int check)	 //화일을 전송받아 filename에 저장한다.
{
	FILE *fp;
	int i,i2,n,ret=No,num=1;
	char buff[380],buff1[380],buff2[380],dir[380];
	char from_user=No;
	char newdir[300];
	char OLDDIR[300];
	char filename2[380];
	int downmode=0,count=0;
	char   DEF_UPS[81];    // UPS 기본DIR
	char   DEF_DNS[51];    // DNS 기본DIR

	getcwd(OLDDIR,sizeof(OLDDIR));		//현재의 디렉토리
	strcpy(filename,"");
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	if (mode==99&&(bit(allmode,14)||pf.type>=18)) num=99;
	else {
		if (is_file(newdir)) sys_tem("rm %s -rf",newdir);
		if (bit(bcfg.wmode,19)) num=1;		//강제적으로 Zmode선택
		else {
			_cont:
			strcpy(g_buff4,"");
			if (bit(allmode,14)||(pf.type==18&&!bit(cfg.downmode,17))||(pf.type==19&&!bit(cfg.downmode,18)))
				strcpy(g_buff4,"99.UPS");
			if (!view("forum/main/frm/editor/upload.%s",bbs_tail()))
				view("forum/main/frm/editor/upload.def");
			lineinput(buff,4);printf("\n");check_han(buff);
			num=atoi(buff);
			if (num==88) {
				autoup=autoup?No:Yes;
				goto _cont;
			}
		}
	}
	_ups:
	if (num==99) {
		count=0;
		_cont1:
		if (!bit(allmode,14)&&pf.type<18) goto _fail;
		if (count++>5)	goto _fail;
		if (!(bit(allmode,14)||(pf.type==18&&!bit(cfg.downmode,17))||(pf.type==19&&!bit(cfg.downmode,18)))) goto _fail;

		for (i2=0;i2<3;i2++) {
			view("forum/main/frm/editor/upsfile.log");
			lineinput(filename,50);printf("\n");
			if (is_same(filename,"q")||is_same(filename,"p")) goto _fail;
			strchng2(filename,"//","/");
			del_space(filename);
			if (!is_file(filename)) goto _cont1;
			xstrncpy(g_buff2,dir,99);
			strcpy(g_buff3,filename2);
			n=file_size(filename);
			sprintf(g_buff4,"%d",n);
			if (view("forum/main/frm/editor/confirmu.log")) {
				if (!yesno2("",Yes)) goto _fail;
			}
			return Yes;
		}
	}
	if (is_char("0qQxXpP",buff[0])) goto _fail;
	if (num==99) goto _ups;
	else view("forum/main/frm/editor/zmodem.log");

	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	check_dir(newdir);
	ch_dir(newdir);
	getcwd(buff,sizeof(buff));		//현재의 디렉토리
	if (is_same(buff,OLDDIR)) {
		printf(" 전송디렉토리 만들기 실패:*%s*\n",newdir);
		goto _fail;
	}
	view("forum/main/frm/editor/up_start.log");
	n=rz();
	if (c_proc) {
		getcwd(buff,sizeof(buff));		//현재의 디렉토리
		printf("현재위치:%s  전송완료\n",buff);
		system("ls -l");
		pressenter();
	}
	if (n!=0||dir_filenum("./")<1) {
		view("%s/frm/editor/upload.err",OLDDIR);
		goto _fail;
	}
	//전송성공
	sys_tem("chmod 777 *");
	dir_filename(buff,"./");     //현재방에 있는 화일명중 1개
	ch_dir(OLDDIR); 	 //원래 디렉토리

	if (!check) goto _ok;
	if (!good_filename(buff)) goto _fail;

	//등록 확인
	_ok:
	ch_dir(OLDDIR); 	 //원래 디렉토리
	sprintf(buff1,"%s/%s",newdir,buff);
	strchng2(buff1,"//","/");
	if (!is_file(buff1)) goto _fail;
	xstrncpy(g_buff2,buff1,99);
	strcpy(g_buff3,buff);
	sprintf(g_buff4,"%d",file_size(buff1));
	if (autoup) nostop=Yes; 	//자동등록
	view("forum/main/frm/editor/confirm.log");
	if (!autoup&&!yesno2("",Yes)) goto _fail;
	strcpy(filename,buff1);
    if (c_proc) mess("실제등록파일:%s",filename);
	return Yes;

	_fail:
	ch_dir(OLDDIR); 	 //원래 디렉토리
	strcpy(filename,"");
	rm_tmpup();
	return No;
}

//mode=1:zmodem  99:UPS 0:선택
up_text(int mode,char *filename)   //화일을 전송받아 filename에 저장한다.
{
	int i,n,ret=No,num;
	char buff[380];
	char buff2[380];
	char from_user=No;
	char newdir[300];
	char OLDDIR[300];
	char dir[380];
	char filename2[380];
	char   DEF_UPS[81];    // UPS 기본DIR
	char   DEF_DNS[51];    // DNS 기본DIR

	getcwd(OLDDIR,sizeof(OLDDIR));		//현재의 디렉토리
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	rm_tmpup();
	check_dir(newdir);

	if (mode==0) {
		strcpy(g_buff1,"");strcpy(g_buff2,"");strcpy(g_buff3,"");strcpy(g_buff4,"");
		strcpy(g_buff4,"");
		if (bit(allmode,14)||(pf.type==18&&!bit(cfg.downmode,17))||(pf.type==19&&!bit(cfg.downmode,18)))
			strcpy(g_buff4,"99.UPS");
		if (!view("forum/main/frm/editor/uploadt.%s",bbs_tail()))
			view("forum/main/frm/editor/upload.def");
		fflush(NULL);
		lineinput(buff,20);check_han(buff);printf("\n");
		if (is_char("0qQxXpP",buff[0])) goto _fail;
		mode=atoi(buff);
	}
	_ups:
	if (mode==99) {
		if (!bit(allmode,14)&&pf.type<18) return No;
		view("forum/main/frm/editor/upstext.log");
		lineinput(buff,50);printf("\n");
		if (is_same(buff,"q")||is_same(buff,"p")) goto _fail;
		if (!is_file(buff)) goto _fail;
		file_copy(buff,filename);
		if (!bit(cfg.downmode,5)) {
			xstrncpy(g_buff2,dir,99);
			strcpy(g_buff3,filename2);
			sprintf(g_buff4,"%d",file_size(filename));
			view("forum/main/frm/editor/confirmt.log");
			if (!yesno2("",Yes)) goto _fail;
		}
		return Yes;
	}
	else view("forum/main/frm/editor/zmodem.log");

	//파일 받기 시작
	sprintf(newdir,"tmp/up%d%s",cfg.hostno,no_spc(tty));
	check_dir(newdir);
	ch_dir(newdir);
	getcwd(buff,sizeof(buff));		//현재의 디렉토리
	if (is_same(buff,OLDDIR)) {
		printf(" 전송디렉토리 만들기 실패:*%s*\n",newdir);
		goto _fail;
	}
	if (c_proc) {
		printf("현재위치:%s\n",buff);
		printf("NEWDIR:%s\n",newdir);
	}
	view("forum/main/frm/editor/up_start.log");
	n=rz();
	if (c_proc) {
		getcwd(buff,sizeof(buff));		//현재의 디렉토리
		printf("현재위치:%s  전송완료 n=%d\n",buff,n);
		system("ls -l");
		pressenter();
	}
	fflush(stdout);
	if (n!=0||dir_filenum("./")<1) {
		view("%s/frm/editor/upload.err",OLDDIR);
		goto _fail;
	}
	//전송성공
	sys_tem("chmod 777 *");
//	  sys_tem("%s/bin/xlower",OLDDIR);  //소문자로 변경
	ret=No;
	dir_filename(buff,"./");          //현재방에 있는 화일명중 1개
	ch_dir(OLDDIR); 				   //원래 디렉토리

	if (!good_filename(buff)) goto _fail;
	sprintf(buff2,"%s/%s/%s",OLDDIR,newdir,buff);
	file_move(buff2,filename);
	chmod(filename,0777);
	rm_tmpup();
	return Yes;

	_fail:
	ch_dir(OLDDIR); 	 //원래 디렉토리
	unlink(filename);
	rm_tmpup();
	return No;
}


clear_bbs()
{
    bbs.del=' ';
    bbs.hits=bbs.down=bbs.good=bbs.line=bbs.size=0;
	bbs.date=bbs.date2=bbs.filesize=bbs.fcount=bbs.ok=bbs.no=bbs.an=0;
    bbs.posi=bbs.depth=bbs.tag=bbs.tag2=bbs.color=0;
    bbs.link1=bbs.link2=bbs.link3=0;
    bbs.del=' ';
    strcpy(bbs.id,"");strcpy(bbs.name,"");
    strcpy(bbs.title,"");strcpy(bbs.keyword,"");
    strcpy(bbs.filename,"");strcpy(bbs.note,"");strcpy(bbs.userip,"");
    strcpy(bbs.tid,"");strcpy(bbs.tclub,"");strcpy(bbs.tcode,"");
    strcpy(bbs.email,"");strcpy(bbs.passwd,"");strcpy(bbs.homepage,"");
}


clear_pf()
{
    pf.num=pf.type=pf.job=0;
	pf.del=' ';
    pf.login=pf.inday=pf.logout=pf.birthday=0;
	pf.all_log=pf.all_time=pf.month_log=pf.month_time=0;
	pf.countd=pf.countu=pf.countw=pf.down=0;
	strcpy(pf.id,"");strcpy(pf.eid,"");strcpy(pf.name,"");
    strcpy(pf.offi,"");strcpy(pf.eid,"");strcpy(pf.name,"");
	strcpy(pf.tele,"");strcpy(pf.hand,"");
	strcpy(pf.post,"");strcpy(pf.addr1,"");strcpy(pf.addr2,"");
	strcpy(pf.memo1,"");strcpy(pf.memo2,"");strcpy(pf.memo3,"");strcpy(pf.memo4,"");
	strcpy(pf.memo5,"");strcpy(pf.memo6,"");strcpy(pf.memo7,"");strcpy(pf.memo8,"");
}


// 가기 코드 찾아서 go에 저장
find_go(char *code)
{
	FILE *fp;
	int found=No;
	GO go1,oldgo;
	oldgo=go;
	strcpy(go.code,"");
	go.rec=0;
	go.type='m';
	re_print=Yes;
	re_logo=Yes;
	re_bbs=Yes;
	list_mode=No;
	sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
	strcpy(filt_str,"");
	if (strlen(code)<1) return No;
	if (is_goindex(NOW_MENU,code)) {
		if ((fp=fopen(NOW_MENU,"r"))!=NULL) {
			while(fread(&go1,sizeof_go,1,fp)) {
				if (go1.type>0&&go1.type!='t'&&is_same(go1.code,code)) {
					found=Yes;
					go=go1;
					break;
				}
			}
			fclose(fp);
		}
	}
	if (!found) go=oldgo;
	return found;
}

is_goindex(char *menu,char *gocode)
{
	FILE *fp1,*fp2;
	GO tgo;
	int found=No;
	char menufile[300];
	strcpy(menufile,menu);
	strchng2(menufile,".dat",".inx");
	if ((fp1=fopen(menufile,"r"))==NULL) {
		make_goindex(menu);
		fp1=fopen(menufile,"r");
	}
	if (fp1==NULL) return Yes; //없으면 있는것으로 간주
	while(fread(&tgo.code,sizeof(tgo.code),1,fp1)) {
		if (is_same(tgo.code,gocode)) {
			found=Yes;
			break;
		}
	}
	fclose(fp1);
	return (found);
}

make_goindex(char *menu)
{
	FILE *fp1,*fp2;
	char menufile[300];
	GO tgo;
	strcpy(menufile,menu);
	strchng2(menufile,".dat",".inx");
	if ((fp1=fopen(menu,"r"))==NULL) return;
	if ((fp2=fopen(menufile,"w"))==NULL) return;
	while(fread(&tgo,sizeof_go,1,fp1)) {
		if (tgo.type>=' '&&strlen(tgo.code)>0) {
			fwrite(&tgo.code,sizeof(tgo.code),1,fp2);
		}
	}
	fclose(fp1);
	fclose(fp2);
}


