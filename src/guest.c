//회원가입
#include "bbs.h"

main(int argc, char **argv)
{
	char id[100],name[100];
	read_db_name("db.cfg");
	read_cfg();
	read_aname(0);	//회원DB이름 읽어서 배열에 저장
	if (argc>1&&is_same(argv[1],"____editpf")) {  //ID편집
		edit_pf(argv[2],argv[3]);
	}
	else {
		guest_norm();	//일반적인 가입
	}
}


guest_norm()
{
	int n,i,key=No;
	char buff[140];

	clear_pf();
	_cont1:
	view("forum/main/frm/guest/guestsel.log");
	lineinput(buff,5);check_han(buff);printf("\n");
	if (is_char("NnQqPpXx",buff[0])) goto _quit;

	key=gg_id();
	if (key 					)  key=gg_name();
	if (key 					)  key=gg_pass();
	if (is_same(pf.name,"9999")) goto _done;
	if (key&&!bit(cfg.guestin,1))  key=gg_idno();
	if (key&&!bit(cfg.guestin,2))  key=gg_email();
	if (key&&!bit(cfg.guestin,3))  key=gg_addr();
	if (key&&!bit(cfg.guestin,4))  key=gg_tele();
	if (key&&!bit(cfg.guestin,5))  key=gg_hand();
	if (key&&!bit(cfg.guestin,6))  key=gg_job();
	if (key&&!bit(cfg.guestin,7))  key=gg_offi();  //직장,학교명
	if (key&&cfg.disp_memo1)	   key=gg_memo(1);
	if (key&&cfg.disp_memo2)	   key=gg_memo(2);
	if (key&&cfg.disp_memo3)	   key=gg_memo(3);
	if (key&&cfg.disp_memo4)	   key=gg_memo(4);
	if (key&&cfg.disp_memo5)	   key=gg_memo(5);
	if (key&&cfg.disp_memo6)	   key=gg_memo(6);
	if (key&&cfg.disp_memo7)	   key=gg_memo(7);
	if (key&&cfg.disp_memo8)	   key=gg_memo(8);
	if (!key) goto _quit;

	_done:
	while (key) {
		_cont2:
		view("forum/main/frm/guest/guestok.scr");
		lineinput(buff,10);printf("\n");check_han(buff);
		if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) goto _quit;
		if (strlen(buff)==1&&is_char("Yy",buff[0])) break;
		n=atoi(buff);
		if (n== 1) key=gg_id();
		if (n== 2) key=gg_name();
		if (n== 4) key=gg_pass();
		if (n== 5) key=gg_email();
		if (n== 6) key=gg_addr();
		if (n== 7) key=gg_addr();
		if (n== 8) key=gg_addr();
		if (n== 9) key=gg_tele();
		if (n==10) key=gg_hand();
		if (n==11) key=gg_job();
		if (n==12) key=gg_offi();
		if (n==20) key=gg_memo(1);
		if (n==21) key=gg_memo(2);
		if (n==22) key=gg_memo(3);
		if (n==23) key=gg_memo(4);
		if (n==24) key=gg_memo(5);
		if (n==25) key=gg_memo(6);
		if (n==26) key=gg_memo(7);
		if (n==27) key=gg_memo(8);
		if (n==99) break;
		if (!key) goto _quit;
	}

	save_guest();
	view("forum/main/frm/guest/bye.scr");
	return;

	_quit:
	view("forum/main/frm/guest/cancel.end");
	return;
}

save_guest()
{
	MYSQL *sock,mysql;
	FILE *fp;
	int n,n2;
	char query[BODY_MAX+500];
	pf.type=cfg.guesttype;
	pf.down=cfg.guestdown*1000;
	if (pf.del!='D') pf.del=' ';
	time(&pf.inday);

	addslashes(pf.passwd,sizeof(pf.passwd));
	addslashes(pf.addr1,sizeof(pf.addr1));
	addslashes(pf.addr2,sizeof(pf.addr2));
	addslashes(pf.tele,sizeof(pf.tele));
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


	sprintf(query, "insert into user (
	id,eid,name,passwd,
	id_no,email,del,
	post,addr1,addr2,
	tele,hand,
	offi,job,
	memo1,memo2,memo3,memo4,
	memo5,memo6,memo7,memo8,
	mymode,offmin,down,myflag,level,
	countw,countd,countu,
	inday,type
	)
	values (
	'%s','%s','%s','%s',
	'%s','%s','%c',
	'%s','%s','%s',
	'%s','%s',
	'%s',%d,
	'%s','%s','%s','%s',
	'%s','%s','%s','%s',
	'%d','%d','%d','%d','%d',
	'%d','%d','%d',
	'%s',%d
	);",
	pf.id,pf.eid,pf.name,pf.passwd,
	pf.id_no,pf.email,pf.del,
	pf.post,pf.addr1,pf.addr2,
	pf.tele,pf.hand,
	pf.offi,pf.job,
	pf.memo1,pf.memo2,pf.memo3,pf.memo4,
	pf.memo5,pf.memo6,pf.memo7,pf.memo8,
	pf.mymode,pf.offmin,pf.down,pf.myflag,pf.level,
	pf.countw,pf.countd,pf.countu,
	datestr(8,pf.inday),pf.type
	);

	if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		fprintf(stderr,"## ERR 1001: %s\n",mysql_error(&mysql));
		exit(1);
	}

	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		fprintf(stderr,"## ERR 1002: %s\n",mysql_error(sock));
		mysql_close(sock);
		exit(1);
	}

	if (mysql_query(sock, query) == -1) {
		fprintf(stderr, "## ERR 1003: %s\n",
		mysql_error(sock));
		fprintf(stderr, "%s\n", query);
		mysql_close(sock);
		exit(1);
	}
	mysql_close(sock);

	_done:
	view("forum/main/frm/guest/save1.log");
	return 0;
}





gg_id()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_id:
	strcpy(pf.id,"");
	if (count++>5)	return No;
	view("forum/main/frm/guest/id.scr");
	lineinput(buff,12);printf("\n");
	all_trim(buff);del_space(buff);
	if (is_quit(buff)) return No;
	if (strlen(buff)<3||check_file_char(buff,"system/notid.chr")) {
		if (yesno3("forum/main/frm/guest/id1.err",Yes)!=Yes) return No;
		goto _id;
	}
	strcpy(pf.id,buff);
	if (check_badname(buff)) {view("forum/main/frm/guest/id2.err");goto _id;}
	if (check_badchar(buff)) {view("forum/main/frm/guest/id3.err");goto _id;}
	if (check_sameid(0)) {
//		printf(",%s,%s,",pf2.id,pf2.name);
		strcpy(pf.name,pf2.name);
		view("forum/main/frm/guest/id4.err");goto _id;
	}
	strchng2(pf.id,"__","_");
	return Yes;
}


gg_name()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	while (1) {
		if (count++>5)	return No;
		view("forum/main/frm/guest/name.scr");
		del_space(buff);
		lineinput(buff,12);printf("\n");all_trim(buff);
		if (is_quit(buff)) return No;
		if (strlen(buff)<4||check_file_char(buff,"system/notname.chr")) {
			if (yesno3("forum/main/frm/guest/name1.err",Yes)!=Yes) {
				return No;
			}
			continue;
		}
		if (check_badname(buff)) {view("forum/main/frm/guest/name2.err");continue;}
		break;
	}
	strcpy(pf.name,buff);
	return Yes;
}



gg_eid()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	while (1) {
		if (count++>5)	return No;
		view("forum/main/frm/guest/eid.scr");
		del_space(buff);
		lineinput(buff,12);printf("\n");all_trim(buff);
		if (is_quit(buff)) return No;
		if (strlen(buff)<4||check_file_char(buff,"system/notname.chr")) {
			if (yesno3("forum/main/frm/guest/eid1.err",Yes)!=Yes) {
				return No;
			}
			continue;
		}
		if (check_badname(buff)) {view("forum/main/frm/guest/eid2.err");continue;}
		break;
	}
	strcpy(pf.eid,buff);
	return Yes;
}



gg_pass()
{
	int count,i,n,ret;
	char buff[100],buff1[100];
	char buff2[100],buff3[100];
	count=0;
	_pass:
	strcpy(buff1,"");strcpy(buff2,"");
	if (count++>8)	return No;
	view("forum/main/frm/guest/pass1.scr");
	passinput(buff1,12);printf("\n");check_han(buff1);del_space(buff1);
	if (strlen(buff1)==1&&is_char("NnQqPpXx",buff1[0])) return No;
	if (strlen(buff1)<3) {
		if (yesno3("forum/main/frm/guest/pass1.err",Yes)) goto _pass;
		else return No;
	}
	if (bit(cfg.guestin,24)&&check_easypass(buff1)) {
		if (yesno3("forum/main/frm/guest/pass2.err",Yes)) goto _pass;
		else return No;
	}
	view("forum/main/frm/guest/pass2.scr");
	passinput(buff2,12);printf("\n");check_han(buff2);del_space(buff2);
	if (strlen(buff2)==1&&is_char("NnQqPpXx",buff2[0])) return No;
	if (strcmp(buff2,buff1)!=0) {
		if (yesno3("forum/main/frm/guest/pass3.err",Yes)) goto _pass;
		else return No;
	}
	strcpy(pf.passwd,buff1);
	view("forum/main/frm/guest/pass.end");
	return Yes;
}

gg_idno()
{
	int count,i,n,ret;
	char buff[100],buff2[100],buff3[100];
	if (bit(cfg.guestin,1)) {strcpy(pf.id_no,"");return Yes;}
	count=0;
	_idno:
	strcpy(pf.id_no,"");
	if (count++>8)	goto _fail;
	view("forum/main/frm/guest/idno.scr");
	lineinput(buff,14);printf("\n");del_space(buff);check_han(buff);
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	if (is_same(buff,"9")) {
		strcpy(pf.id_no,"000000-0000000");
		goto _done;
	}
	if (strlen(buff)<12) {
		if (yesno3("forum/main/frm/guest/idno1.err",Yes)) goto _idno;
		else goto _fail;
	}
	strchng2(buff,"-","");
	xstrncpy(buff2,buff,6);
	strcpy(buff3,&buff[6]);
	sprintf(buff,"%s-%s",buff2,buff3);
	buff[14]=0;
	strcpy(g_buff1,buff);
	if (check_badidno(buff))   {view("forum/main/frm/guest/idno2.err");goto _idno;}
	if (!is_good_idno(buff))   {view("forum/main/frm/guest/idno5.err");goto _idno;}
	strcpy(pf.id_no,buff);
	if (check_sameid(1))	   {view("forum/main/frm/guest/idno3.err");goto _idno;}
	_done:
	view("forum/main/frm/guest/idno.end");
	return Yes;
	_fail:
	strcpy(pf.id_no,"");
	return No;
}

gg_addr()
{
	int count,i,n,ret;
	char buff[300],buff2[300];
	count=0;
	_addr1:
	if (count++>8)	return No;
	view("forum/main/frm/guest/addr1.scr");
	lineinput(buff,14);check_han(buff);printf("\n");all_trim(buff);
	if (is_same(buff,"9")) return Yes;
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	if (strlen(buff)<4) {
		if (yesno3("forum/main/frm/guest/addr1.err",Yes)) goto _addr1;
		else return No;
	}
	strcpy(g_buff1,buff);
	i=check_selectaddr(buff,buff2);
	if (i==2) goto _addr1;
	if (i==1) {
		view("forum/main/frm/guest/addr2.err");
		goto _addr1;
	}//없으면..
	all_trim(buff);
	xstrncpy(pf.addr1,buff ,70);
	xstrncpy(pf.post,buff2,7);

	count=0;
	_addr2:
	if (count++>8)	return No;
	view("forum/main/frm/guest/addr2.scr");
	lineinput(buff,70);printf("\n");all_trim(buff);
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	if (strlen(buff)<4) {
		if (yesno3("forum/main/frm/guest/addr3.err",Yes)) goto _addr1;
		else return No;
	}
	all_trim(buff);
	xstrncpy(pf.addr2,buff,70);
	view("forum/main/frm/guest/addr.end");
	return Yes;
}

gg_email()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_tele:
	if (count++>8)	return No;
	view("forum/main/frm/guest/email.scr");
	lineinput(buff,40);check_han(buff);printf("\n");
	if (strlen(buff)==0) return Yes;
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	strcpy(pf.email,buff);
	return Yes;
}

gg_tele()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_tele:
	if (count++>8)	return No;
	view("forum/main/frm/guest/tele.scr");
	lineinput(buff,20);check_han(buff);printf("\n");
	if (strlen(buff)==0) {
		strcpy(pf.tele,"");
		return Yes;
	}
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	if (strlen(buff)<6) {
		if (yesno3("forum/main/frm/guest/tele1.err",Yes)) goto _tele;
		else return No;
	}
	strcpy(pf.tele,buff);
	return Yes;
}

gg_hand()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_hand:
	if (count++>8)	return No;
	view("forum/main/frm/guest/hand.scr");
	lineinput(buff,14);check_han(buff);printf("\n");
	if (strlen(buff)==0) {
		strcpy(pf.hand,"");
		return Yes;
	}
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	strcpy(pf.hand,buff);
	return Yes;
}


gg_job()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_job:
	if (count++>8)	return No;
	view("forum/main/frm/guest/job.scr");
	lineinput(buff,2);check_han(buff);printf("\n");check_han(buff);
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	n=atoi(buff);
	if (n<1||n>19) {
		if (yesno3("forum/main/frm/guest/job1.err",Yes)) goto _job;
		strcpy(buff,"");
		return No;
	}
	if (n<1||n>19) n=1;
	pf.job=n;
	return Yes;
}


gg_offi()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_offi:
	if (count++>8)	return No;
	if (!view("forum/main/frm/guest/offi%d.scr",pf.job))
		view("forum/main/frm/guest/offi.scr");
	lineinput(buff,70);check_han(buff);printf("\n");
	if (strlen(buff)==0) {
		strcpy(pf.offi,"");
		return Yes;
	}
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	if (strlen(buff)<2) {
		if (yesno3("forum/main/frm/guest/offi1.err",Yes)) goto _offi;
		else return No;
	}
	strcpy(pf.offi,buff);
	return Yes;
}

gg_memo(int mode)
{
	view("forum/main/frm/guest/memo%d.scr",mode);
	if (mode==1&&cfg.disp_memo1) get_str(pf.memo1,70);
	if (mode==2&&cfg.disp_memo2) get_str(pf.memo2,70);
	if (mode==3&&cfg.disp_memo3) get_str(pf.memo3,70);
	if (mode==4&&cfg.disp_memo4) get_str(pf.memo4,70);
	if (mode==5&&cfg.disp_memo5) get_str(pf.memo5,70);
	if (mode==6&&cfg.disp_memo6) get_str(pf.memo6,70);
	if (mode==7&&cfg.disp_memo7) get_str(pf.memo7,70);
	if (mode==8&&cfg.disp_memo8) get_str(pf.memo8,70);
	printf("\n");
	return Yes;
}

gg_offmin()
{
	int count,i,n,ret;
	char buff[100],buff2[100];
	count=0;
	_tele:
	if (count++>8)	return No;
	view("forum/main/frm/guest/offmin.scr");
	lineinput(buff,40);check_han(buff);printf("\n");
	if (strlen(buff)==0) return Yes;
	if (strlen(buff)==1&&is_char("NnQqPpXx",buff[0])) return No;
	pf.offmin=atoi(buff);
	return Yes;
}


check_badname(char *id)
{
	if (is_same(cfg.guestid,id)||is_same(cfg.hostname,id)) return Yes;
	if (is_same(id,"root")||stristr(id,"guest")||stristr(id,"손님")) return Yes;
	if (in_file("system/notgid.txt",id)) return Yes;
	return No;
}


check_badchar(char *buff)
{
	int i=0;
	unsigned char c,ch;
	while ((c=buff[i++])&&i<(int)strlen(buff)) {
			 if (c>='0'&&c<='9') ;
		else if (c=='&'||c=='<'||c=='>'||c=='?'||c==';'||c=='\\') return Yes;
		else if (is_char("+=<>{}[]$&@!^?/.,;*|^",c)) return Yes;
		else if (c==34||c==39||c==96)				 return Yes;
		else if (bit(cfg.guestmode,10)&&!((c>='0'&&c<='9')||(c>='a'&&c<='z')||(c>='A'&&c<='Z'))) return Yes;
		else if (bit(cfg.guestmode,11)&&c>=164) return Yes;
		else if (bit(cfg.guestmode,12)&&c>=202) return Yes;
		else if (i==0&&c=='-') return Yes;
		else if (c>='a'&&c<='z') ;
		else if (c>='A'&&c<='Z') ;                           //
		else if (c>='('&&c<=')') ;                           //
		else if (c=='_'||c=='-') ;
		else if (c<48) return Yes;
	}
	return No;
}


check_badidno(char *idno)
{
	if (in_file("system/notgidno.txt",idno)) return Yes;
	return No;
}



//mode==0 ID만 검사
//mode==1 주민 검사
//mode==2 둘다 검사
check_sameid(int mode)
{
	MYSQL		*sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_ROW	qrow;
	char query[500];
	int found=No;

		 if (mode==0) sprintf(query,"SELECT * FROM user WHERE id='%s'",pf.id);
	else if (mode==1) sprintf(query,"SELECT * FROM user WHERE id_no='%s'",pf.id_no);
	else if (mode==2) sprintf(query,"SELECT * FROM user WHERE id='%s' or id_no='%s'",pf.id,pf.id_no);

	if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) exit(1);
	if ((mysql_select_db(sock, DB_NAME)) == -1) exit(1);
	if (mysql_query(sock, query) == -1) {
		fprintf(stderr, "## ERR 1020 : %s\n",mysql_error(sock));
		fprintf(stderr, "%s\n", query);
		mysql_close(sock);
		exit(1);
	}
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL) {
		strcpy(pf2.id	,qrow[fnoid("id")]   );
		strcpy(pf2.name ,qrow[fnoid("name")] );
		strcpy(pf2.id_no,qrow[fnoid("id_no")]);
		pf2.type=atoi(qrow[fnoid("type")]);
//		printf("ID : %s Name:%s \n",qrow[fnoid("id")],qrow[fnoid("name")]);
		found=Yes;
	}
	mysql_free_result(qres);
	mysql_close(sock);
	return found;
}



is_good_idno(char *idstr)
{
	int i,j,k,a[20];
	char buff[300];

	if (strlen(idstr)<8) return No;
	strcpy(buff,idstr);buff[2]=0;
	i=atoi(buff)+1900;
	strcpy(buff,idstr);
	if (buff[6]=='-') {
		buff[6] = '0';
		for(i = 0; i < 14; i++) a[i] = buff[i] - 48;
		j = a[0]*2+a[1]*3+a[2]*4+a[3]*5+a[4]*6+a[5]*7+a[7]*8+a[8]*9+a[9]*2+a[10]*3+a[11]*4+a[12]*5;
		j = j % 11;
		k = 11 - j;
		if(k > 9) k = k % 10;
		j = buff[13] - 48;
		if(j != k) return No;
	}
	else {
		for(i = 0; i < 13; i++) a[i] = buff[i] - 48;
		j = a[0]*2+a[1]*3+a[2]*4+a[3]*5+a[4]*6+a[5]*7+a[6]*8+a[7]*9+a[8]*2+a[9]*3+a[10]*4+a[11]*5;
		j = j % 11;
		k = 11 - j;
		if(k > 9) k = k % 10;
		j = buff[12] - 48;
		if(j != k) return No;
	}
	return Yes;
}


//0:보통  1:없음  2:재입력
check_selectaddr(char *addr,char *post)
{
	FILE *fp;
	char buff[205];
	char buffaddr[100];
	char buff1[205];
	char buff2[205];
	char buff3[205];
	char abuff[200][101];
	int  i,n,top,linenum;
	strcpy(post,"");
/*
   02 100-011 서울시 중구 충무로1가
   02 100-012 서울시 중구 충무로2가
   02 100-013 서울시 중구 충무로3가
   02 100-014 서울시 중구 충무로4가
*/
	if ((fp=fopen("forum/main/frm/guest/_post.txt","r"))==NULL) {
		mess("forum/main/frm/guest/_post.txt 파일이 없습니다.");
		strcpy(addr,"");
		strcpy(post,"");
		return No;
	}
	strcpy(buffaddr,addr);
	del_space(buffaddr);
	i=0;
	while (i<200) {
		if (fgets(buff,200,fp)==NULL) break;
		strcpy(buff1,buff);del_space(buff1);
		if (strlen(buff1)<3||!stristr(buff1,buffaddr)) continue;
		all_trim(buff);
		xstrncpy(abuff[i++],buff,100);
	}
	fclose(fp);
	if (i==0) return 1; 	   //찾는자료 없음
	if (i==1) { 			   //1개 찾았음
		if (strlen(abuff[0])<10) return 1;
		post_str(abuff[0],buff1,buff2,buff3);		//문자열을 전화,우편번호,주소로
		strcpy(addr,buff3);
		strcpy(post,buff2);
		all_trim(addr);all_trim(post);
		return No;
	}
	top=0;
	while(1) {
		cls();
		view("forum/main/frm/guest/selecta1.scr");
		linenum=0;
		if (top<0||top>199) top=0;
		i=top;
		while(linenum<15&&i<200) {
			if (strlen(abuff[i])<3) break;
			post_str(abuff[i],buff1,buff2,buff3);		//문자열을 전화,우편번호,주소로
			printf("%4d. (%-7.7s) %s\n",i+1,buff2,buff3); //  1. (701-300) 대구시 동구 신서동
			i++;
			linenum++;
		}
		view("forum/main/frm/guest/selecta2.scr");
		lineinput(buff,20);check_han(buff);check_cmd(buff);printf("\n");
		n=atoi(buff);
		if		(is_same(mmc[0],"b")||is_same(mmc[0],"a")) top-=15;
		else if (is_same(mmc[0],"p")) return 2;  //재입력
		else if (is_same(mmc[0],"x")) return Yes;
		else if (is_same(mmc[0],"q")) return Yes;
		else if (is_same(mmc[0],"m")) return Yes;
		else if (n>0&&n<201) {
			if (strlen(abuff[n-1])<3) continue;
			post_str(abuff[n-1],buff1,buff2,buff3); 	  //문자열을 전화,우편번호,주소로
			if (strlen(buff3)<3) return 2;
			strcpy(addr,buff3);
			strcpy(post,buff2);
			all_trim(addr);all_trim(post);
			return No;		  //찾는자료
		}
		else top+=15;
	}
	return Yes;
}


//02 100-014 서울시 중구 충무로4가
//			   문자열	  전화		우편	   주소
post_str(char *buff0,char *buff1,char *buff2,char *buff3)		//문자열을 전화,우편번호,주소로
{
	char buff[300];
	int i,i1,i2,i3,mode;
	char c,ch;
	strcpy(buff,buff0);
	strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");
	i1=i2=i3=0;
	all_trim(buff);
	strchng2(buff,"   "," ");
	strchng2(buff,"  "," ");
	strchng2(buff,"  "," ");
	strchng2(buff,"  "," ");
	mode=0;
	for (i=0;i<(int)strlen(buff);i++) {
		c=buff[i];
		if (c==' ') mode++;
		else if (mode==0) buff1[i1++]=c;   //전화
		else if (mode==1) buff2[i2++]=c;   //우편
		else			  buff3[i3++]=c;   //주소
		buff1[i1]=0;
		buff2[i2]=0;
		buff3[i3]=0;
	}
	all_trim(buff1);
	all_trim(buff2);
	all_trim(buff3);
}


check_easypass(char *buff)
{
	int n,i,j;
	if (stristr(buff,pf.id)||stristr(buff,pf.name)) return Yes;
	if (stristr(pf.id,buff)||stristr(pf.name,buff)) return Yes;
	n=0;
	for (i=0;i<8;i++) {
		for (j=i+1;j<8;j++) {
			if (buff[i]==buff[j]) n++;
		}
	}
	if (n>3) return Yes;
	return No;
}


edit_pf(char *tid,char *runid)
{
	char buff[100];
	int n,who;
	MYSQL		*sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_ROW	qrow;
	char query[10000];

	if (!read_pf(runid)) {mess("%s ID검색 실패",runid);return;}
	who=check_who();
	if (!read_pf(tid)) {mess("%s ID검색 실패",tid);return;}

	view("forum/main/frm/pf/ed_pf.log");
	while(1) {
		view("forum/main/frm/pf/ed_pf.scr");
		lineinput(buff,5);check_han(buff);printf("\n");
		n=atoi(buff);
			 if (is_char("TtswmxXpP",buff[0])) break;
		else if (is_char("qQ",buff[0])) {
			if (yesno("\n ## 변경하신 내용을 취소할까요? (Y/n) >>",Yes)) exit(1);
			continue;
		}
		else if (n==1) gg_pass();
		else if (n==2) gg_eid();
		else if (n==3) gg_addr();
		else if (n==4) gg_tele();
		else if (n==5) gg_hand();
		else if (n==6) gg_job();
		else if (n==7) gg_offi();
		else if (n==8) gg_offmin(); 	//키off
		else if (n==11) gg_memo(1);
		else if (n==12) gg_memo(2);
		else if (n==13) gg_memo(3);
		else if (n==14) gg_memo(4);
		else if (n==15) gg_memo(5);
		else if (n==16) gg_memo(6);
		else if (n==17) gg_memo(7);
		else if (n==18) gg_memo(8);
	}
	if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		fprintf(stderr,"## ERR 1001: %s\n",mysql_error(&mysql));
		exit(1);
	}
	if ((mysql_select_db(sock, DB_NAME)) == -1) {
		fprintf(stderr,"## ERR 1002: %s\n",mysql_error(sock));
		mysql_close(sock);
		exit(1);
	}
	sprintf(query, "update user set
	passwd='%s',email='%s',eid='%s',
	post='%s',addr1='%s',addr2='%s',
	tele='%s',hand='%s',offi='%s',job='%d',
	offmin='%d',
	memo1='%s',memo2='%s',memo3='%s',memo4='%s',
	memo5='%s',memo6='%s',memo7='%s',memo8='%s'
	where num=%d",
	pf.passwd,pf.email,pf.eid,
	pf.post,pf.addr1,pf.addr2,
	pf.tele,pf.hand,pf.offi,pf.job,
	pf.offmin,
	pf.memo1,pf.memo2,pf.memo3,pf.memo4,
	pf.memo5,pf.memo6,pf.memo7,pf.memo8,
	pf.num
	);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 5143: %s\n%s\n",mysql_error(sock),query);
		return;
	}
	view("forum/main/frm/pf/ed_pf.bye");
	mysql_close(sock);
}


//가입해지
ed_out(char *tid)
{
	int mode;
	int now,found,ret;
	int pass_edit=No;
	char now_id[10];
	char buff[80];
	char buff2[80];
	FILE *fp;

	if (!read_pf(tid)) {
		mess("%s ID 검색 실패\n",tid);
		return;
	}
	cls();
	view_pf(pf.id);
	xy(0,21);
	if (pf.type>=14) {
		printf(" %s (%s)님은 특별회원으로 지정되어 있으므로\n",pf.id,pf.name);
		printf(" 운영진의 허락이 있어야 가입해지 신청이 가능합니다.\n");
		printf(" 다시 한번 확인 하십시요.\n");
		printfL2();
		pressenter();
		return;
	}

	if (pf.type==0) {
		printf(" %s (%s)님은 가입해지 상태입니다.\n",pf.id,pf.name);
		printf(" 다시 한번 확인 하십시요.\n");
		printfL2();
		pressenter();
		return;
	}

	ret=No;
	if (pf.id_no[0]==0||bit(cfg.guestin,3)) goto _ok;
	else {
		printf(" 가입 해지 신청자의 주민등록 번호를 확인합니다.\n");
		printf(" 예)701231-1234123  입력 >>");
		lineinput(buff,14);
		del_space(pf.id_no);
		del_space(buff);
		printf("\n");
		if (is_same(pf.id_no,buff)) goto _ok;
	}
	goto _fail;

	_ok:
	printfL2();
	printf(" %s(%s)님의 가입해지신청을 하면 일정기간 재가입이 금지됩니다.\n",pf.id,pf.name);
	printf("또한 운영진의 허락이 있어야 사용이 가능합니다.\n");
	if (!yesno("가입해지신청을 하시겠습니까?",No)) goto _fail;
	if (pf.type>0) {
		MYSQL	  *sock,mysql;
		MYSQL_RES *qres;
		MYSQL_ROW qrow;
		char query[500];
		sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
		mysql_select_db(sock,DB_NAME);
		sprintf(query,"update user set type=3 WHERE id='%s'",pf.id);
		mysql_query(sock, query);
		mysql_close(sock);
	}
	printfL2();
	printf(" %s (%s)님은 가입이 해지되었습니다.\n",pf.id,pf.name);
	printf(" 만일 일정기간내에 다시 서어비스를 사용하시려면\n");
	printf(" 손님으로 접속해서 손님전용게시판에 적어주세요.\n");
	printf(" 그동안 사용해주셔서 감사합니다.\n");
	printfL2();
	pressenter();
	return;

	_fail:
	printf("\n");
	printfL2();
	printf(" %s (%s)님은 가입해지신청이 되지 않았습니다.\n",pf.id,pf.name);
	printf(" 다시 확인하십시요. \n");
	printfL2();
	pressenter();
}
