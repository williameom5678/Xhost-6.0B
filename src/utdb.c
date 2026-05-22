// DB 관련 루틴
//회원관련 유틸리티
#include "bbs.h"

//qrow -> pf로 저장
void qrow2pf(MYSQL_ROW qrow)
{
	int i;
	clear_pf();
	for (i=0;i<50;i++) {
		if (qrow[i]==NULL) continue;
		if (strlen(a_idname[i])<1) continue;
		//printf("%d:%s(%s)\n",i,a_idname[i],qrow[i]);
			 if (strcmp(a_idname[i],"num"       )==0) pf.num=atoi(qrow[i]);
		else if (strcmp(a_idname[i],"id"        )==0) strcpy(pf.id,qrow[i]);
		else if (strcmp(a_idname[i],"eid"       )==0) strcpy(pf.eid,qrow[i]);
		else if (strcmp(a_idname[i],"name"      )==0) strcpy(pf.name,qrow[i]);
		else if (strcmp(a_idname[i],"passwd"    )==0) strcpy(pf.passwd,qrow[i]);
		else if (strcmp(a_idname[i],"email"     )==0) strcpy(pf.email,qrow[i]);
		else if (strcmp(a_idname[i],"type"      )==0) pf.type=atoi(qrow[i]);
		else if (strcmp(a_idname[i],"id_no"     )==0) strcpy(pf.id_no  ,qrow[i]);
		else if (strcmp(a_idname[i],"email"     )==0) strcpy(pf.email  ,qrow[i]);
		else if (strcmp(a_idname[i],"gofirst"   )==0) strcpy(pf.gofirst,qrow[i]);
		else if (strcmp(a_idname[i],"memo1"     )==0) strcpy(pf.memo1  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo2"     )==0) strcpy(pf.memo2  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo3"     )==0) strcpy(pf.memo3  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo4"     )==0) strcpy(pf.memo4  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo5"     )==0) strcpy(pf.memo5  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo6"     )==0) strcpy(pf.memo6  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo7"     )==0) strcpy(pf.memo7  ,qrow[i]);
		else if (strcmp(a_idname[i],"memo8"     )==0) strcpy(pf.memo8  ,qrow[i]);
        else if (strcmp(a_idname[i],"post"      )==0) strcpy(pf.post   ,qrow[i]);
		else if (strcmp(a_idname[i],"addr1"     )==0) strcpy(pf.addr1  ,qrow[i]);
		else if (strcmp(a_idname[i],"addr2"     )==0) strcpy(pf.addr2  ,qrow[i]);
		else if (strcmp(a_idname[i],"offi"      )==0) strcpy(pf.offi   ,qrow[i]);
		else if (strcmp(a_idname[i],"tele"      )==0) strcpy(pf.tele   ,qrow[i]);
		else if (strcmp(a_idname[i],"hand"      )==0) strcpy(pf.hand   ,qrow[i]);

		else if (strcmp(a_idname[i],"moon"      )==0) pf.moon       =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"sex"       )==0) pf.sex        =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"job"       )==0) pf.job        =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"offmin"    )==0) pf.offmin     =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"all_log"   )==0) pf.all_log    =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"all_time"  )==0) pf.all_time   =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"month_log" )==0) pf.month_log  =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"month_time")==0) pf.month_time =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"countd"    )==0) pf.countd     =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"countu"    )==0) pf.countu     =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"countw"    )==0) pf.countw     =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"down"      )==0) pf.down       =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"myflag"    )==0) pf.myflag     =atoi(qrow[i]);
		else if (strcmp(a_idname[i],"mymode"    )==0) pf.mymode     =atoi(qrow[i]);
        else if (strcmp(a_idname[i],"del"       )==0) pf.del        =qrow[i][0];
		else if (strcmp(a_idname[i],"birthday"  )==0) pf.birthday   =str2date2(qrow[i]);
		else if (strcmp(a_idname[i],"inday"     )==0) pf.inday      =str2date2(qrow[i]);
		else if (strcmp(a_idname[i],"login"     )==0) pf.login      =str2date2(qrow[i]);
		else if (strcmp(a_idname[i],"logout"    )==0) pf.logout     =str2date2(qrow[i]);

		else if (strcmp(a_idname[i],"level"     )==0) pf.level      =str2date2(qrow[i]);
		else if (strcmp(a_idname[i],"point"     )==0) pf.point      =str2date2(qrow[i]);
        else if (strcmp(a_idname[i],"msg"       )==0) pf.msg        =atoi(qrow[i]);
	}
	if (pf.del!='D') pf.del=' ';
	del_space(pf.id);
	if (strstr(pf.id,"__")) strchng2(pf.id,"__","_");
    if (pf.type<0||pf.type>19) pf.type=0;
}


//아이디를 읽어서 회원화일에서 찾은뒤 pf에 저장한다.
read_pf(char *id)
{
	return read_pf_(0,id);
}

read_pf2(char *id)
{
	return read_pf_(2,id);
}

read_pf_(int mode,char *id)
{
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	FILE *fp;
	PF oldpf;
	int found=No;
	int i,ii,n;
	int id_num=0;
	int last,first,now;
	char tid[30],tid2[30],buff[100];
	char query[500];

	if (mode==2) {
		oldpf=pf;	//현재의 PF 백업
		strcpy(pf2.id,"guest");
		strcpy(pf2.name,"guest");
		pf2.type=0;
	}

	strcpy(tid,id);strlwr(tid);del_space(tid);del_esc(tid);
	if (strlen(tid)<3) return No;
	if (in_file2("system/guestid.id",tid)) return No;

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 5101: %s\n",mysql_error(&mysql));
		return No;
	}
	if ((mysql_select_db(sock,DB_NAME)) == -1) {
		printf("## ERR 5102: %s\n",mysql_error(sock));
		mysql_close(sock);
		return No;
	}

	sprintf(query,"SELECT * FROM user WHERE id='%s'",id);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 5103: %s\n%s\n",mysql_error(sock),query);
		return No;
	}
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL) {
		qrow2pf(qrow);
		if (strlen(pf.eid)<1) strcpy(pf.eid,pf.id);
		if (strlen(pf.id)>0) found=Yes;

	}
	mysql_free_result(qres);
	mysql_close(sock);
//	  printf("FOUND:%d(%s) ID:%s Name:%s TY:%d DEL:%c \n",found,id,pf.id,pf.name,pf.type,pf.del);

	if (!found) {
		if (mode==2) pf=oldpf;
		return No;
	}

	_found:
	if (pf.num<0) pf.num=0;
	pf.mymode=set_bit(pf.mymode,29,0);
    if (pf.offmin<1) pf.offmin=cfg.waitkey;
	if (mode==2) {pf2=pf;pf=oldpf;}
	return (found);
}



//현재의 동호회에 아이디를 찾는다.	->cpf에 저장
read_cpf(char *id)
{
	int i,ii,n,count,found=No;
	CPF cpf2;
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	MYSQL_FIELD *qfield;
	char buff[100];
	char query[500],table_name[500];
	if (is_same(club_go.code,"main")) return Yes;

	strcpy(cpf.id,"");strcpy(cpf.name,"");
	strcpy(cpf.memo1,"");strcpy(cpf.memo2,"");strcpy(cpf.memo3,"");strcpy(cpf.memo4,"");strcpy(cpf.memo5,"");
	cpf.type=0;
	cpf.del=' ';

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 5131: %s\n",mysql_error(&mysql));
		return No;
	}
    if ((mysql_select_db(sock,DB_CM)) == -1) {
		printf("## ERR 5132: %s\n",mysql_error(sock));
		mysql_close(sock);
		return No;
	}
    sprintf(table_name,"cuser_%s",club_go.code);
	sprintf(query,"SELECT * FROM %s WHERE id='%s' and del!='D'",table_name,id);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 5133: %s\n%s\n",mysql_error(sock),query);
		return No;
	}
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) == NULL) return No;
	i=0;
	while ((qfield = mysql_fetch_field(qres))) {
        //printf("%d.%s:%s\n",i,qfield->name,qrow[i]);
             if (qrow[i]==NULL);
		else if (strcmp(qfield->name,"num")==0)          cpf.num=atoi(qrow[i]);
		else if (strcmp(qfield->name,"id")==0)           strcpy(cpf.id,qrow[i]);
		else if (strcmp(qfield->name,"name")==0)         strcpy(cpf.name,qrow[i]);
		else if (strcmp(qfield->name,"type")==0)         cpf.type=atoi(qrow[i]);
        else if (strcmp(qfield->name,"del")==0)          cpf.del=qrow[i][0];
		else if (strcmp(qfield->name,"memo1")==0)        strcpy(cpf.memo1,qrow[i]);
		else if (strcmp(qfield->name,"memo2")==0)        strcpy(cpf.memo2,qrow[i]);
		else if (strcmp(qfield->name,"memo3")==0)        strcpy(cpf.memo3,qrow[i]);
		else if (strcmp(qfield->name,"memo4")==0)        strcpy(cpf.memo4,qrow[i]);
		else if (strcmp(qfield->name,"memo5")==0)        strcpy(cpf.memo5,qrow[i]);
		else if (strcmp(qfield->name,"countw")==0)       cpf.countw=atoi(qrow[i]);
		else if (strcmp(qfield->name,"countu")==0)       cpf.countu=atoi(qrow[i]);
		else if (strcmp(qfield->name,"countd")==0)       cpf.countd=atoi(qrow[i]);
		else if (strcmp(qfield->name,"all_log")==0)      cpf.all_log=atoi(qrow[i]);
		else if (strcmp(qfield->name,"all_time")==0)     cpf.all_time=atoi(qrow[i]);
		else if (strcmp(qfield->name,"month_log")==0)    cpf.month_log=atoi(qrow[i]);
		else if (strcmp(qfield->name,"month_time")==0)   cpf.month_time=atoi(qrow[i]);
		else if (strcmp(qfield->name,"inday")==0)        cpf.inday=str2date2(qrow[i]);
		else if (strcmp(qfield->name,"logout")==0)       cpf.logout=str2date2(qrow[i]);
		i++;
	}
	mysql_free_result(qres);
	if (cpf.del!='D') cpf.del=' ';
	mysql_close(sock);
	if (!strlen(cpf.id)||!strlen(cpf.name)) return No;
	return Yes;
}


view_pf (char *tid) {
	viewpf(1,tid,0);
}
view_pfs(char *tid) {
	viewpf(8,tid,0);
}
view_pfw(char *tid,int who) {
	viewpf(9,tid,who);
}
view_pfw2(PF pf2,int who)
{
	PF oldpf;
	oldpf=pf;
	pf=pf2;
	if (who>=5) view("forum/main/frm/pf/pfs.scr");
	else if (who>=2&&pf.type<18) view("forum/main/frm/pf/pfs.scr");
	else if (who>=2&&pf.type>=18) printf("## %s 님은 볼수없는 등급%d입니다.",pf.id,pf.type);
	else view("forum/main/frm/pf/pf.scr");
	pf=oldpf;
}


viewpf(int mode,char *tid,int who)
{
	PF oldpf;
	int i;
	oldpf=pf;
	if (!read_pf2(tid)) goto _fail;

	_cont1:
	pf=pf2;
	for (i=0;i<23;i++) printf("\n");
		 if (mode==1) view("forum/main/frm/pf/pf.scr");
	else if (mode==8&&who<5&&pf.type>=18) view("forum/main/frm/pf/pf.scr");
	else if (mode==8) view("forum/main/frm/pf/pfs.scr");
	else if (mode==9&&who>=4) view("forum/main/frm/pf/pfs.scr");
	else if (mode==9&&who<=3) view("forum/main/frm/pf/pf.scr");
	pf=oldpf;
	return;

	_fail:
	pf=oldpf;
	mess(" %s 회원을 찾을수 없습니다.",tid);return;
	return;

}

view_cpf(char *tid,int type)
{
	CPF oldcpf;
	if (!club_mode) {
		mess("동호회서만 가능한 명령입니다.");
		return;
	}
	oldcpf=cpf;
	if (!read_cpf(tid)) {
		mess("%s 회원을 동호회 회원명부 에서 찾을수 없습니다.",tid);
		cpf=oldcpf;
		return;
	}
	if (type>=17) disp_cpf(cpf,2);
	else		  disp_cpf(cpf,1);
	cpf=oldcpf;
}



//cpf의 아이디를 출력
disp_cpf(CPF cpf,int who)
{
	PF oldpf;
	read_pf2(cpf.id);
	if (pf2.type>=18) {
		strcpy(pf2.passwd,"");
		pf2.type=1;
	}
	if (who>=2) {
		if (!view("forum/%s/frm/pf/cpfs.scr",club_go.code)) {
			if (!view("forum/main/frm/pf/cpfs.scr")) goto _cont;
		}
	}
	else {
		_cont:
		if (!view("forum/%s/frm/pf/cpf.scr",club_go.code)) view("forum/main/frm/pf/cpf.scr");
	}
}


get_age(PF pf3)
{
	char buff[30];
	int n,n2,n3;
	if (pf3.type<1) return 0;
	strcpy(buff,pf3.id_no);buff[2]=0;
	n2=now_year()%100;
	if (n2<80) n2+=100;
	n=atoi(buff);
	if (n<=0) return 0;
	n3=n2-n;
	if (n3<0) n3=0;
	if (n3>99) n3=99;
	return n3;
}


check_who()
{
	int who=0;		  //1:동호회 운영진 2:동호회 시삽  3:root권한
	if (pf.type==16&&cpf.type<17)	 cpf.type=17;
	if (pf.type==17&&cpf.type<18)	 cpf.type=18;
	if (pf.type>=18&&cpf.type<19)	 cpf.type=19;
	if (pf.type==16)				  who=1;
	if (pf.type==17)				  who=2;
	if (pf.type==18)				  who=3;
	if (pf.type==19)				  who=4;
	if (club_mode) {
		if (is_same(ccfg.sysop,pf.id))	 cpf.type=19;
		if (cpf.type>=17&&who<1)		 who=1;
		if (cpf.type==18&&who<2)		 who=2;
		if (cpf.type==19&&who<2)		 who=2;
	}
		 if (is_same(bcfg.sysop,pf.id)&&who<1) who=1;
	else if (is_same(bcfg.sysop1,pf.id)&&who<1) who=1;
	else if (is_same(bcfg.sysop2,pf.id)&&who<1) who=1;
	else if (is_same(bcfg.sysop3,pf.id)&&who<1) who=1;
	return who;
}




int fnoid(char *name)
{
	int i;
	for (i=0;i<50;i++) {
//		  printf("%d,%s,%s\n",i,a_idname[i],name);
		if (strcasecmp(a_idname[i],name)==0) return i;
	}
	return -1;
}


//필드명읽음
void read_aname(int mode)
{
	int i;
	MYSQL		*sock,mysql;
	MYSQL_RES	*qres;
    char query2[5000];
	MYSQL_FIELD *qfield;
    char query[5000];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 5106: %s\nDB_HOST:%s,DB_USER:%s,DB_PASSWD:%s\n",mysql_error(&mysql),DB_HOST,DB_USER,DB_PASSWD);
		return;
	}
	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		printf("## ERR 5107: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
	sprintf(query,"SELECT * FROM user limit 1");
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 5108: %s\n%s\n",mysql_error(sock),query);
		return;
	}

	qres= mysql_store_result(sock);
    for (i=0;i<70;i++) strcpy(a_idname[i],"");
	i=0;

    while (i<70&&(qfield = mysql_fetch_field(qres))) {
      //printf("%d %s\n",i,qfield->name);
      strcpy(a_idname[i++],qfield->name);
	}
    mysql_free_result(qres);
    mysql_close(sock);
}



int fnobbs(char *name)
{
	int i;
	for (i=0;i<50;i++) {
//		  printf("%d,%s,%s\n",i,a_bbsname[i],name);
		if (strcasecmp(a_bbsname[i],name)==0) return i;
	}
	return -1;
}

int check_table(MYSQL *sock, char *table) {
	MYSQL_RES	*result;
	MYSQL_ROW	row;
	if ( (result = mysql_list_tables (sock,NULL)) == NULL ) return 0;
	while ( (row = mysql_fetch_row(result)) != NULL) {
		if ( strcmp((char *) row[0], table) == 0) {
			mysql_free_result(result);
			return Yes;
		}
	}
	mysql_free_result(result);
	return No;
}

//필드명읽음  공지사항에서 읽음
//나중에 text에서 읽음.
void read_abbsname(int mode)
{
	int i;
	char query[500];
	MYSQL		*sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_FIELD *qfield;

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) return;
	if ((mysql_select_db(sock, DB_NAME)) == -1) return;
	sprintf(query,"SELECT * FROM def_bbs");
	if (mysql_query(sock, query) == -1) {
        printf("## ERR 3343: %s\n%s\n",mysql_error(sock),query);
		return;
	}
	qres= mysql_store_result(sock);
    for (i=0;i<70;i++) strcpy(a_bbsname[i],"");
	i=0;
	while ((qfield = mysql_fetch_field(qres))) {
      //printf("%d %s\n",i,qfield->name);
	  strcpy(a_bbsname[i++],qfield->name);
	}
	mysql_free_result(qres);
	mysql_close(sock);
}



//qrow -> bbs로 저장
void qrow2bbs(MYSQL_ROW qrow)
{
	int i;
	clear_bbs();
	for (i=0;i<50;i++) {
		if (qrow[i]==NULL||strlen(a_bbsname[i])<1) continue;
	  //   printf("%d:%s='%s'\n",i,a_bbsname[i],qrow[i]);pressenter();
			 if (strcmp(a_bbsname[i],"id"       )==0) strcpy(bbs.id,qrow[i]);
		else if (strcmp(a_bbsname[i],"name"     )==0) strcpy(bbs.name,qrow[i]);
		else if (strcmp(a_bbsname[i],"title"    )==0) strcpy(bbs.title,qrow[i]);
		else if (strcmp(a_bbsname[i],"keyowrd"  )==0) strcpy(bbs.keyword,qrow[i]);
		else if (strcmp(a_bbsname[i],"passwd"   )==0) strcpy(bbs.passwd,qrow[i]);
		else if (strcmp(a_bbsname[i],"size"     )==0) bbs.size=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"filename" )==0) strcpy(bbs.filename,qrow[i]);
		else if (strcmp(a_bbsname[i],"email"    )==0) strcpy(bbs.email,qrow[i]);
		else if (strcmp(a_bbsname[i],"homepage" )==0) strcpy(bbs.homepage,qrow[i]);
		else if (strcmp(a_bbsname[i],"userip"   )==0) strcpy(bbs.userip,qrow[i]);
		else if (strcmp(a_bbsname[i],"tcode"    )==0) strcpy(bbs.tcode,qrow[i]);
		else if (strcmp(a_bbsname[i],"tclub"    )==0) strcpy(bbs.tclub,qrow[i]);
		else if (strcmp(a_bbsname[i],"tid"      )==0) strcpy(bbs.tid,qrow[i]);
		else if (strcmp(a_bbsname[i],"date"     )==0) bbs.date=str2date2(qrow[i]);
		else if (strcmp(a_bbsname[i],"date2"    )==0) bbs.date2=str2date2(qrow[i]);
		else if (strcmp(a_bbsname[i],"filesize" )==0) bbs.filesize=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"num"      )==0) bbs.num=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"fcount"   )==0) bbs.fcount=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"hits"     )==0) bbs.hits=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"down"     )==0) bbs.down=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"line"     )==0) bbs.line=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"good"     )==0) bbs.good=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"ok"       )==0) bbs.ok=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"no"       )==0) bbs.no=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"an"       )==0) bbs.an=atoi(qrow[i]);
        else if (strcmp(a_bbsname[i],"del"      )==0) bbs.del=qrow[i][0];
		else if (strcmp(a_bbsname[i],"pos"      )==0) bbs.pos=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"depth"    )==0) bbs.depth=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"link1"    )==0) bbs.link1=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"link2"    )==0) bbs.link2=atoi(qrow[i]);
		else if (strcmp(a_bbsname[i],"link3"    )==0) bbs.link3=atoi(qrow[i]);
	}
	if (bbs.del!='D') bbs.del=' ';
	if (bbs.pos<1) bbs.pos=1;
}


create_db(MYSQL *sock, char *file1,char *file2)
{
	FILE *fp;
    char tmpfile[100],query[100000],bindir[500];
    char buff[100000];
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

	if ((fp=fopen(tmpfile,"r"))==NULL) return;
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
        if (mysql_query(sock,query) == -1) {
            fflush(NULL);
            sleep(1);
            mysql_query(sock,"Flush tables");
            if (mysql_query(sock,query) == -1) {
                printf("\nQ:%s\n\n%s\n\n",query,mysql_error(sock));
                pressenter();
            }
        }
	}
	unlink(tmpfile);
    mysql_query(sock,"Flush privileges");
    mysql_query(sock,"Flush tables");
    fflush(NULL);
}


drop_table(char *table_name)
{
	char query[100];
	MYSQL *sock,mysql;

	if (strlen(table_name)<1) return;
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2001: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		printf("## ERR 3202: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
	}
	sprintf(query,"DROP TABLE IF EXISTS %s",table_name);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 1206: %s\n",mysql_error(sock));
		printf("## %s\n",query);
		return;
	}
	printf("### DROP TABLE %s 완료\n",table_name);
	mysql_query(sock,"FLUSH PRIVILEGES");
	mysql_query(sock,"FLUSH TABLES");
	mysql_close(sock);
}


char *check_query(char *str)
{
    static char buff[5000];
    static char buff2[5000];
    if (!strstr(str,"where")) return (str);
    strcpy(buff,str);
    strchng2(buff,"  "," ");
    strchng2(buff,"where and","where ");
    strchng2(buff,"where order ","order ");
    strcpy(str,buff);
    return (str);
}
