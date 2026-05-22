////////////////////////////////////////////////////////////////////////
//	  게시판 관련 루틴
////////////////////////////////////////////////////////////////////////
#include "bbs.h"

bbs_write(int ups_mode)
{
	FILE *fp;
	char buff[250];
	char buff2[250];
	char dir[280],table_name[100];
	char filename[280];
	char qfilename[180];
	char filename2[180];
	int n,nn,i,ret,tsize;
	int quest_mode;
	int quest_sec_mode=No;	//설문지 비공개여부
	int is_nofile=No;
	int bbs_mode=is_typebbs;
	int old_down=pf.down;
	int now_num;
	char from_user=No;		//사용자영역에서 전송
	time_t down_start_time;
	time_t down_end_time;
	BBS oldbbs;

	oldbbs=bbs;
	//메일이면 적는 루틴이 다름
	if (is_same(go.code,"rmail")||is_same(go.code,"wmail")||is_same(go.code,"cmail")||is_same(go.code,"dbox")||is_same(go.code,"mbox")) {
		wmail(1,"");
		return Yes;
	}

	ret=Yes;
	re_bbs=Yes;
	re_print=Yes;

    check_dir("tmp");
	clear_bbs();

	if (pf.type<18) {
		if (!club_mode&&view("forum/main/frm/down/nowrmain.log")) goto _fail;
		if ( club_mode&&view("forum/main/frm/down/nowrclub.log")) goto _fail;
	}

	sprintf(qfilename,"%s/logo/%s.qst",club_go.dir,go.code); //설문지화일

	sprintf(buff,"%s/logo/%s.nwr",club_go.dir,go.code);
	if (is_file(buff)) {view(buff);goto _fail;}
	sprintf(buff,"%s/logo/all.nwr",club_go.dir);
	if (is_file(buff)) {view(buff);goto _fail;}

	if (pf.type<19&&ups_mode) ups_mode=0;
	if (ups_mode) printf(" ##UPS MODE##\n");
	if (guest_mode) {
			 if (bit(cfg.infomode,1));
		else if (go.type=='g');
		else if (go.type=='y');
		else  {
			if (!view("forum/main/frm/error/errorw.log")) mess("손님은 적을수 없습니다.");
			return No;
		}
	}

	//등록여부질문
	if (!bit(bcfg.wmode,18)) {
		if (view("forum/main/frm/editor/uploadq.%s",bbs_tail())) {
			if (!yesno2("",!bit(bcfg.downmode,16))) goto _fail;
		}
	}

	sprintf(filename,"%s/logo/%s.liw",club_go.dir,go.code);
	ret=No;
		 if (!is_char(BBSTYPE,go.type))   message("등록 가능 메뉴가 아닙니다.");
	else if (go.type=='z'||go.type=='b')  message("전체자료실엔 등록할수 없습니다.");
	else if (bbs_man(pf.id)) ret=Yes;  //담당자일때 통과
	else if (bit(bcfg.modelist,6)&&!in_file2(filename,pf.id)) return No;
	else if (is_same(go.code,"userroom")) message("사용자 영역에는 저장이 안됩니다.");
	else if (check_type('w')) ret=No; //메뉴 가능 등급확인
	else ret=Yes;

	if (!ret) return No;
	if (!guest_mode&&wtimes()) return No;	  //적는 횟수 검사

	//등록시안내화면
	view("%s/logo/%s.bbs",club_go.dir,go.code);

	unlink(TMP_FILE);
	unlink(TMP_FILE1);
	unlink(TMP_FILE2);
	clear_bbs();

	//설문응답
	quest_mode=No;
	if (!bit(bcfg.wmode,6)&&is_file(qfilename)) {
		if (bit(bcfg.wmode,7)||yesno3("forum/main/frm/write/sul1.log",Yes)) {
			file_line(buff,qfilename,1);	//첫줄 파악
			if (stristr(buff,"_{비공")&&yesno3("forum/main/frm/write/sul2.log",Yes))
				quest_sec_mode=Yes;  //설문지 비공개여부
			set_stat2(5,"설문응답");     //쓰기
			sys_tem("bin/quest %s %s %s",pf.id,qfilename,TMP_FILE2);
			quest_mode=Yes;
			if (!is_file(TMP_FILE2)) goto _fail;	  //취소시
		}
	}
	//제목입력
	if (write_bbs_title()==No) goto _fail;		//취소시

	set_stat(5,bbs.title);								   //쓰기

	//기본설명입력
	if (write_bbs_quest()==No) goto _fail;

	if (pf.type<19&&ups_mode) ups_mode=0;
	//내용입력
	unlink(TMP_FILE);
	if (go.type=='-'||bit(bcfg.wmode,11));      //내용통과
	else {										//제목전용이 아니면?
		if (ups_mode) ret=input_tmp(99); // ->TMP_FILE에 저장
		else		  ret=input_tmp(0);
		if (!is_file(TMP_FILE)||ret==No) goto _fail;			  //취소시
	}

	strcpy(bbs.keyword,"");
	strcpy(bbs.passwd,"");
	bbs.hits=bbs.ok=bbs.down=bbs.size=0;
	bbs.del=' ';
	bbs.good=0;
	if (strlen(bcfg.write_id)>2) {
		strcpy(bbs.id,bcfg.write_id); //현재의 아이디,이름
		strcpy(bbs.name,bcfg.write_id); //현재의 아이디,이름
	}
	else {
		strcpy(bbs.id,pf.id);			  //현재의 아이디,이름
		strcpy(bbs.name,pf.name);
	}

    if (quest_sec_mode==Yes) {
		strcpy(bbs.id,"비공개");             //현재의 아이디,이름
		strcpy(bbs.name,"비공개");
	}
	time(&bbs.date);
	time(&bbs.date2);
	strcpy(bbs.filename,"");
	bbs.filesize=0;
	//검색어지정
	if (bit(bcfg.wmode,10)) {
		view("forum/main/frm/editor/writekey.%s",bbs_tail());
		lineinput(bbs.keyword,30);
	}

	strcpy(bbs.filename,"");

	if (is_typepds) {
        char old_filename[500];
		//화일명입력,전송
		check_dir(go.dir);
		if (!bbs_man(pf.id)&&pf.type<14&&bit(bcfg.downmode,1)) is_nofile=Yes;
		else if (!bbs_man(pf.id)&&pf.type>=14&&bit(bcfg.downmode,2)) is_nofile=Yes;
		else {
			time(&down_start_time);    //업시작시간
			if	 (ups_mode) ret=up_file(99,buff,No);  //시삽지정 업 ->filename
			else ret=up_file(0,buff,Yes);	//업 ->filename
            strcpy(old_filename,buff);

            bbs.filesize=file_size(old_filename);
            str_filedir(old_filename,dir,filename);  //buff를 디렉토리와 파일명으로 분해
            if (is_same(filename,"passwd")||stristr(filename,".htm")||stristr(filename,".php")||
                is_same(filename,".asp")||stristr(filename,".cgi")||stristr(filename,".inc")) {
				mess("%s 등록불가 파일명",filename);
				goto _fail;
			}
			filename[30]=0;del_space(filename);del_esc3(filename);
			strcpy(bbs.filename,filename);
			time(&down_end_time);
            if (!is_file(old_filename)||strlen(filename)==0||!ret) {
				if (bit(bcfg.downmode,11)) {
					strcpy(bbs.filename,bit(bcfg.downmode,13)?"화일없음":"");
					ret=Yes;
					is_nofile=Yes;
				}
				else goto _fail;   //취소시
			}
			if (bit(bcfg.wmode,12)&&bbs.filesize==0) goto _fail;	 //취소시
			bbs.fcount=0;
			if (!is_nofile) {				   //자료실의 경우
				char oldname[500],newname[500],dir[500];
				sprintf(dir,"pds/%s/%s",club_go.code,go.code);
				check_dir(dir);
				if (!is_file(dir)||is_same(dir,"/")) {
					mess("### 자료실 디렉토리(%s)가 없습니다. \n",dir);
					goto _fail;
				}

				_same_file:
				sprintf(newname,"%s/%s.%x",dir,filename,bbs.fcount);
                if (c_proc) mess("파일명:%s dir:%s newname:%s",filename,dir,newname);
				if (is_file(newname)) {
					bbs.fcount++;
					goto _same_file;
				}
                sys_tem("cp -f %s '%s'",old_filename,newname);
				rm_tmpup();
			}
		}
	}

	sprintf(table_name,"%s_%s",club_go.code,go.code);

	//게시물저장 시작
	if (is_file(TMP_FILE2)) {
		file_add(TMP_FILE2,TMP_FILE);		//TMP_FILE2 에 TMP_FILE을 추가
		file_move(TMP_FILE2,TMP_FILE);
	}
	if (is_same(go.code,"notice")) bbs.good=1;
	if ((go.type=='-'||bit(bcfg.mode,25))&&is_file(TMP_FILE)) unlink(TMP_FILE);
	//게시물추가
	if (bit(bcfg.wmode,5)) {
		file_line(buff,TMP_FILE,1);
		sprintf(buff2,"%s %s",bbs.title,buff);
		all_trim(buff2);
		xstrncpy(bbs.title,buff2,80);
	}

	ret=bbs_add(0);
	now_num=bbs.num;
	if (!ret) goto _fail;	//취소시

	//전체자료수증가
	tsize=0;
	if (!is_char("guo",go.type)&&!from_user) {    //업전용 자료실이 아닐때
		tsize=bbs.filesize;
		if (bcfg.urate>0) tsize=(tsize*bcfg.urate)/10;	  //일반등록시 비율
		else if (cfg.urate >0) tsize=(tsize*cfg.urate )/10;    //등록시 비율
        if (is_same2(pf.id,pf2.id)) {
			if (bit(cfg.downmode,14)&&tsize>0)
				printf(" *** ID:%s 총크기:%dK 다운량변경 %dK -> %dK \n",pf.id,tsize/1000,pf.down/1000,(pf.down+tsize)/1000);
			pf.down=pf.down+tsize;
		}
	}

	unlink(TMP_FILE);	//임시화일 삭제
	re_print=Yes;
	set_stat(1,"");     //쓰기해제
	view("forum/main/frm/editor/writeok.%s",bbs_tail());

	if (pf.type>0) {
		MYSQL	  *sock,mysql;
		MYSQL_RES *qres;
		MYSQL_ROW qrow;
		char query[500];
        sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
		mysql_select_db(sock,DB_NAME);
		if (strlen(bbs.filename)) sprintf(query,"update user set down=down+%d,countu=countu+1 WHERE num='%d'",tsize,pf.num);
		else sprintf(query,"update user set down=down+%d,countw=countw+1 WHERE num='%d'",tsize,pf.num);
		if (mysql_query(sock, query) == -1) {
			printf("## ERR 5323: %s\n%s\n",mysql_error(sock),query);
			return No;
		}
		mysql_close(sock);
	}
	bbs=oldbbs;
	re_bbs=Yes;
	re_print=Yes;
	set_stat(1,"");     //쓰기해제
	check_cmd("");
	return Yes;

	_fail:
	if (is_file(TMP_FILE)) unlink(TMP_FILE);   //임시화일 삭제
	view("forum/main/frm/editor/writeerr.%s",bbs_tail());
	bbs=oldbbs;
	re_bbs=Yes;
	re_print=Yes;
	set_stat(1,"");     //쓰기해제
	check_cmd("");
	return No;
}


write_bbs_quest()		//기본설명
{
	int ret=Yes;
	char filename2[300];
	if (bit(bcfg.qmode,7)) { //미리준비된응답 입력받음
		ret=bit(bcfg.qmode,8);
		if (!ret) {
			view("forum/main/frm/editor/quest%s.log",bbs_tail());
			ret=yesno2("",No);
		}
		if (ret) {
			if (bit(bcfg.qmode,11)) {
				sprintf(filename2,"bin/quest%s",bbs_tail());
				if (is_file(filename2)) {
					if (sys_tem("%s '%s' '%s'",filename2,TMP_FILE1,TMP_FILE2)==-1) return No;
				}
			}
			else {
				sprintf(filename2,"%s/logo/%s.qsh",club_go.dir,go.code);  //미리준비된응답
				if (!is_file(filename2)) sprintf(filename2,"%s/frm/editor/questh.%s",club_go.dir,bbs_tail());  //미리준비된응답
				if (is_file(filename2))
					sys_tem("bin/quest '%s' '%s' '%s'",pf.id,filename2,TMP_FILE2);
			}
		}
	}
	return Yes;
}


//게시판 제목입력
write_bbs_title()
{
	int n,head_num=0;
	char buff[200];
	char head_buff[100];
	n=3;
	strcpy(head_buff,"");
	strcpy(bbs.title,"");
	if (bit(bcfg.wmode,4)) {
		strcpy(bbs.title,go.name);
		goto _skip;   //제목입력하지않고 건너뜀
	}

	while (n--) {
		strcpy(head_buff,"");
		if (!bit(bcfg.wmode,1)) {
			head_num=select_head(head_buff);  //머리글 선택
			if (head_num<0) return No;
		}
		view("forum/main/frm/editor/writetit.%s",bbs_tail());
        if (head_num==0) lineinput(bbs.title,40);
		else {
			printf("%s ",head_buff);
            lineinput(bbs.title,40-(int)strlen(head_buff));
		}
		printf("\n");
		if (is_same(bbs.title,"q")||is_same(bbs.title,"p")) return No;
		if (bbs.title[0]==0&&go.type=='a') strcpy(bbs.title,go.name);
		if (strlen(bbs.title)<3) {
			sprintf(buff,"forum/main/frm/editor/writeerq.%s",bbs_tail());
			if (yesno3(buff,Yes)) return No;
			continue;
		}
		break;
	}
	if (n<0||strlen(bbs.title)<3) return No;

	_skip:
	if (strlen(head_buff)>0) {
		sprintf(buff,"%s %s",head_buff,bbs.title);
		buff[70]=0;strcpy(bbs.title,buff);
	}
	return Yes;
}




//현재 bbs 구조체를 저장한다.(내용은 TMP_FILE에 저장이 되어야 한다.)
//mode==2  pos를 MAX로 안한다. (bbs.pos,depth 그대로)
bbs_add(int mode)
{
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	FILE *fp1;
	char body[BODY_MAX];
	char table_name[100],query[BODY_MAX+500];
	char buff[100];
	int  i,n,total;
	char c;

	//게시물 총수 파악
	n=0;
	//임시에서 읽어 내용저장
	bbs.line=1;
	bbs.size=bbs.ok=bbs.no=bbs.an=0;
	bbs.size=bbs.hits=bbs.down=0;
	strcpy(bbs.userip,hostname);
	bbs.del=' ';

	//내용 -> body 에 저장
	bzero(body,BODY_MAX);
	if ((fp1=fopen(TMP_FILE,"r"))!=NULL) {          //임시작성화일
		int col=0;
		i=0;
		while (i<BODY_MAX&&(c=fgetc(fp1))!=EOF) {
				 if (c==0) break;
			else if (c=='\n') {col=0;bbs.line++;}  //줄수 계산
			else if (col++>79) {col=0;bbs.line++;}
			if (c=='\\'||c=='\''||c=='\"') body[i++]='\\';
			body[i++]=c;
		}
		bbs.size=i;
		fclose(fp1);
	}

	if (go.type=='o') {strcpy(bbs.id,"........");strcpy(bbs.name,"........");}

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 3201: %s\n",mysql_error(sock));
		goto _fail;
	}
    if ((mysql_select_db(sock, DB_CM)) == -1) {
		printf("## ERR 3202: %s\n",mysql_error(sock));
		mysql_close(sock);
		goto _fail;
	}

	sprintf(table_name,"%s_%s",club_go.code,go.code);
	add_table(mode,sock,table_name,body);  //table에 저장함

	//총수 증가함
	total=1;
	sprintf(query,"select count(*) from %s",table_name);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))!=NULL) {  //찾기실패
			if (qrow[0]) total=atoi(qrow[0]);
		}
		mysql_free_result(qres);
	}
	sprintf(query,"update bcfg set total=%d,last_date='%s' where table_name='%s'",total,now_str(19),table_name);
	mysql_query(sock,query);

	//백업에 저장함
	if (strncmp(go.code,"__",2)!=0) {
		bbs.tnum=bbs.num;
		strcpy(bbs.tcode,go.code);
		strcpy(bbs.tclub,club_go.code);
		sprintf(table_name,"%s_%s",club_go.code,"__backup");
		add_table(0,sock,table_name,body);	//table에 저장함
	}

	mysql_close(sock);

	_done:
	fflush(NULL);
	return (Yes);

	_fail:
	fflush(NULL);
	return No;
}


//현재 bbs를 테이블에 저장한다. (DB는 열려있어야 한다.)
//mode==2  pos를 MAX로 안한다. (bbs.pos,depth 그대로)
add_table(int mode,MYSQL *sock,char *table_name,char *body)
{
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[BODY_MAX+1000];
	char buff1[100],buff2[100];
	int i,newpos,newdepth;

	strcpy(buff1,datestr(19,bbs.date));
	strcpy(buff2,datestr(19,bbs.date2));

	if (mode==2) {
		newpos=bbs.pos;
		newdepth=bbs.depth;
	}
	else {
		newpos=1;
		newdepth=0;
		sprintf(query,"select max(pos) from %s",table_name);
		if (mysql_query(sock, query) != -1) {
			qres = mysql_store_result(sock);
			if ((qrow = mysql_fetch_row(qres))!=NULL) {  //찾기실패
				if (qrow[0]) newpos=atoi(qrow[0]);
			}
			mysql_free_result(qres);
			newpos++;
		}
	}
	if (bbs.del!='D') bbs.del=' ';
    if (bcfg.use_hide=='y'||bcfg.bform==2) {
        strcpy(bbs.tid,pf.id);
        strcpy(bbs.id,"...");
        strcpy(bbs.name,"...");
    }

	sprintf(query, "insert into %s (
	pos,depth,tnum,
	id,name,passwd,
	title,keyword,tcode,tclub,tid,
	date,date2,homepage,
	email,userip,filename,
	fcount,filesize,size,line,
	hits,down,ok,no,good,an,
	del,color,tag,tag2,
	link1,link2,link3,
	body
	)
	values (
	'%d','%d','%d',
	'%s','%s','%s',
	'%s','%s','%s','%s','%s',
	'%s','%s','%s',
	'%s','%s','%s',
	%d,%d,%d,%d,
	%d,%d,%d,%d,%d,%d,
	'%c',%d,%d,%d,
	%d,%d,%d,
	'%s'
	);",
	table_name,
	newpos,newdepth,bbs.tnum,
	bbs.id,bbs.name,bbs.passwd,
	bbs.title,bbs.keyword,bbs.tcode,bbs.tclub,bbs.tid,
	buff1,buff2,bbs.homepage,
	bbs.email,bbs.userip,bbs.filename,
	bbs.fcount,bbs.filesize,bbs.size,bbs.line,
	bbs.hits,bbs.down,bbs.ok,bbs.no,bbs.good,bbs.an,
	bbs.del,bbs.color,bbs.tag,bbs.tag2,
	bbs.link1,bbs.link2,bbs.link3,
	body
	);

	//printf("(bbs_add)\n%s\n", query);
	if (mysql_query(sock, query) == -1) {
        int err_no;
        err_no=mysql_errno(sock);
        if (err_no==1146)  //DB없다
			create_db(sock,"def_bbs",table_name);
        if (err_no==1054) { //an없다
            char buff[100],query2[500];
            strcpy(buff,mysql_error(sock));
            sprintf(query2,"ALTER TABLE %s ADD an INT NOT NULL",table_name);
            if (stristr(buff,"nknown column 'an'"))
                mysql_query(sock, query2);
            //printf(query2);pressenter();;;;;;;;;;;;;
        }
		if (mysql_query(sock, query) == -1) {
            printf("## ERR 3213: %s (%d)\n%s\n",mysql_error(sock),err_no,query);
			pressenter();
			return;
		}
	}

	bbs.num=mysql_insert_id(sock);	//방금추가된 게시물번호 (auto inc)

		//모든파일은 TEXT 백업에 저장
	if (strncmp(table_name,"__",2)!=0) {
		char filename[100];
		FILE *fp;
        check_dir("bbs_back");
        check_dir("mail_back");
        if (stristr(go.code,"mail")) sprintf(filename,"mail_back/%s.%d",pf.id,bbs.num);
		else sprintf(filename,"bbs_back/%s_%s.%d",club_go.code,go.code,bbs.num);
		if ((fp=fopen(filename,"w"))!=NULL) {
			fprintf(fp,"%s",query);
			fclose(fp);
		}
	}
}


select_head(char *head_buff)	 //머리글 선택
{
	char filename[100];
	int head_num=0;
	int i,n,count;
	char buff[100];
	char atit[100][110];
	FILE *fp;

	for (i=0;i<100;i++) strcpy(atit[i],"");

	sprintf(filename,"%s/logo/%s.hea",club_go.dir,go.code);
	if ((fp=fopen(filename,"r"))==NULL) return head_num;
	strcpy(head_buff,"");
	strcpy(buff,"");
	count=0;
	while (count<100&&fgets(buff,100,fp)!=NULL) {
		del_esc(buff);
		if (buff[0]!=0) strcpy(atit[count++],buff);
	}
	fclose(fp);
	n=bcfg.headnum;
	if (count>0&&n>0) {
		strcpy(head_buff,atit[n-1]);
		return n;
	}
	if (count>0) {
		while (1) {
			sprintf(filename,"%s/logo/%s.hsl",club_go.dir,go.code);
			printf("\n");
			view(filename);
			for (i=0;i<count;i++) {
				if (i%4==0) printf("\n");
                printf("%2d.%-14.14s",i+1,atit[i]);
			}
			view("forum/main/frm/editor/select.hea");
			lineinput(buff,3);check_han(buff);printf("\n");
			head_num=atoi(buff);
			if (is_char("QqXxPp",buff[0])) return -1;
			if (head_num<0||head_num>count) head_num=0;
			if (head_num==0) strcpy(head_buff,"");
			else strcpy(head_buff,atit[head_num-1]);
			if (bit(bcfg.wmode,2)&&head_num==0) continue;
			break;
		}
	}
	if (is_same(head_buff,"[머리말없음]")||
		is_same(head_buff,"[말머리생략]")||
		is_same(head_buff,"[말머리없음]")||
		is_same(head_buff,"[없음]")||
		is_same(head_buff,"[생략]") ) {
		strcpy(head_buff,"");
		head_num=0;
	}

	return head_num;
}


bbs_edit(int num)
{
	char buff[280],buff1[280],buff2[280];
	char filename[200];
	char table_name[100];
	char query[BODY_MAX+1000];
	char body[BODY_MAX];
	int i,n,mode,n1,nn;
	BBS bbs2;
	FILE *fp,*fp1;
	int text_chage=No;
	int file_chage=No;
	int is_sysop=No;
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char fcountname[200];

	if (num==0&&list_mode) num=bbs.num;
	if (num==0) return;

	list_mode=No;
	re_print=Yes;

	sprintf(table_name,"%s_%s",club_go.code,go.code);
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 2001: %s\n",mysql_error(sock));
		exit(1);
	}
    if ((mysql_select_db(sock, DB_CM)) == -1) {
		printf("## ERR 2002: %s\n",mysql_error(sock));
		mysql_close(sock);
		exit(1);
	}

	sprintf(query,"SELECT * FROM %s where num=%d",table_name,num);
	if (mysql_query(sock, query) == -1) {
		printf("## 해당되는 #%d 번 게시물(%s)을 읽을수 없습니다.\n",num,go.code);
		mysql_close(sock);
		return;
	}
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres))==NULL) {  //찾기실패
		printf("## 해당되는 번호(%d)를 찾을수 없습니다.\n",num);
		mysql_free_result(qres);
		mysql_close(sock);
		return;
	}
	qrow2bbs(qrow);
	strcpy(body,qrow[fnobbs("body")]);
	buff2file(body,TMP_FILE);

	is_sysop=(pf.type>17||(club_mode&&now_type>16));

	if (!check_del()) { 	//삭제가능한 레벨인가?
		mess("수정권한이 없습니다.");
		return;
	}

	mode=0;
	while(1) {
		sprintf(fcountname,"pds/%s/%s/%s.%x",club_go.code,go.code,bbs.filename,bbs.fcount);
		cls();
		printf(" ### %s(%s)  NO:%d\n",go.code,go.name,bbs.num);
		printf(" 1. 제  목  : %s\n",bbs.title);
		printf(" 2. 키워드  : %s\n",bbs.keyword);
		printf(" 3. 암  호  : %s\n",bbs.passwd);
		printf(" 4. Email   : %s\n",bbs.email);
		printf(" 5. Homepage: %s\n",bbs.homepage);
		printf(" 9. 내용수정: %d byte %d Line\n",bbs.size,bbs.line);
		if (is_sysop) {
		printf("11. 아이디  : %s\n",bbs.id);
		printf("12. 이  름  : %s\n",bbs.name);
		printf("13. 화일명  : %s (%d byte) FC:%d\n",bbs.filename,bbs.filesize,bbs.fcount,fcountname);
		printf("    실제위치: %s%s\n",fcountname,is_file(fcountname)?"":"(파일없음)");
		printf("14. 조회수  : 조회:%d 다운:%d   (Hit Count:%d  New Hour:%d)\n",bbs.hits,bbs.down,bcfg.num_hits,bcfg.num_new);
		printf("15. 찬성반대: 찬성:%d 반대:%d   (응답:%d)\n",bbs.ok,bbs.no,bbs.an);
		}
		printf("\n99. 수정완료\n");
		printf(" 명령(P) >> ");
		lineinput(buff,5);printf("\n");
		check_cmd(buff);check_han(mmc[0]);
		nn=mmn[0];
		if (is_quit(buff)&&yesno2("저장을 취소할까요?(y/N)>>",No)) break;
		else if (nn==99) {		//저장
			sprintf(query, "update %s set
			id='%s',
			name='%s',
			passwd='%s',
			title='%s',
			keyword='%s',
			filename='%s',
			size=%d,
			line=%d,
			body='%s'
			where num=%d",
			table_name,
			bbs.id,
			bbs.name,
			bbs.passwd,
			bbs.title,
			bbs.keyword,
			bbs.filename,
			bbs.size,
			bbs.line,
			body,
			bbs.num
			);
			mysql_query(sock,query);
			break;
		}
		else if (nn==1) {
			printf("제목: %s\n",bbs.title);
			printf("편집: ");
            dosinput(bbs.title,40);
		}
		else if (nn==2) {
			printf("키워드: %s\n",bbs.keyword);
			dosinput(bbs.keyword,30);
		}
		else if (nn==3) {
			printf("암호: ");
			lineinput(bbs.passwd,8);
		}
		else if (nn==4) {
			printf("Email: ");
			lineinput(bbs.email,30);
		}
		else if (nn==5) {
			printf("Homepage: ");
			lineinput(bbs.homepage,40);
		}
		else if (nn==9) {
			edit_tmp();
			bbs.line=bbs.size=0;
			bzero(body,BODY_MAX);
			if ((fp1=fopen(TMP_FILE,"r"))!=NULL) {          //임시작성화일
				int i=0,col=0;
				char c;
				while (i<BODY_MAX&&(c=fgetc(fp1))!=EOF) {
						 if (c==0) break;
					else if (c=='\n') {col=0;bbs.line++;}  //줄수 계산
					else if (col++>79) {col=0;bbs.line++;}
					if (c=='\\'||c=='\''||c=='\"') body[i++]='\\';
					body[i++]=c;
					//printf("%c %d c:%d L:%d\n",c,c,col,bbs.line);
				}
				bbs.size=i;
				fclose(fp1);
			}
		}
		else if (is_sysop&&nn==11) {
			printf("아이디: ");
			dosinput(bbs.id,20);
		}
		else if (is_sysop&&nn==12) {
			printf("이름: ");
			dosinput(bbs.name,20);
		}
		else if (is_sysop&&nn==13) {
			printf("화 일 명: %s  (화일크기:%dByte)\n",bbs.filename,bbs.filesize);
			printf("새화일명: (%s)>>",bbs.filename);
			dosinput(bbs.filename,50);
			printf("Fcount:(%d)>>",bbs.fcount);
			bbs.fcount=get_num(bbs.fcount,10);
		}
		else if (is_sysop&&nn==14) {
			printf("조회: ");bbs.hits=get_num(bbs.hits,5);
			printf("다운: ");bbs.down=get_num(bbs.down,5);
		}
		else if (is_sysop&&nn==15) {
			printf("찬성: ");bbs.ok=get_num(bbs.ok,5);
			printf("반대: ");bbs.no=get_num(bbs.no,5);
			printf("응답: ");bbs.an=get_num(bbs.an,5);
		}
	}
	unlink(TMP_FILE);
	mysql_free_result(qres);
	mysql_close(sock);
}


bbs_del(int mode)
{
	char buff[80];
	int num,i,found,is_mail=No;
	char modestr[20];
	char table_name[100],filename[500];
	char body[BODY_MAX];
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[BODY_MAX+500];

	sprintf(table_name,"%s_%s",club_go.code,go.code);

	if (!is_char(BBSTYPE,go.type)) return No;
	if (mode==1) strcpy(modestr,"복구");
	else		 strcpy(modestr,"삭제");

//	  mess("%d %d %d",num,mmn[1],bbs.num);
	num=mmn[1];
	if (num==0&&list_mode) {
		num=bbs.num;
		mmn[1]=num;
		list_mode=No;
	}
	if (num<1) {
		mess2("%s가 취소되었습니다. (사용법: DD 번호)",modestr);
		return No;
	}
	list_mode=No;
	re_print=Yes;
	is_mail=is_same(db_name,DB_MAIL);

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
		printf("## ERR 4101: %s\n",mysql_error(sock));
		exit(1);
	}
	if ((mysql_select_db(sock,db_name)) == -1) {
		printf("## ERR 4102: %s\n",mysql_error(sock));
		mysql_close(sock);
		exit(1);
	}
	for (i=1;i<101;i++) {
		if (mmn[i]<1) continue;
		found=Yes;
		if (is_mail)  sprintf(table_name,"mail%s",pf.id);
		else sprintf(table_name,"%s_%s",club_go.code,go.code);
		sprintf(query,"SELECT * FROM %s where num=%d  and del!='D'",table_name,mmn[i]);
		if (mysql_query(sock, query) == -1) goto _fail;
		qres = mysql_store_result(sock);
//		  printf("%s %s %s %s",qres,mysql_error(sock),db_name,query);
		if (qres==NULL||(qrow = mysql_fetch_row(qres))==NULL) {
			mysql_free_result(qres);
			goto _fail;
		}
		mysql_free_result(qres);

		qrow2bbs(qrow);
		strcpy(body,qrow[fnobbs("body")]);

		if (!check_del()) goto _fail;
		//삭제가능여부 파악  3이면 바로 삭제
		if (mode!=3) {
			printf("## %d 번 게시물을 삭제할까요? (y/N)>>",bbs.num);
			if (!yesno2("",No)) {
				printf(" 삭제가 취소되었습니다.\n");
				continue;
			}
		}

//		  if (strlen(bbs.filename)) sprintf(query,"update user set down=down+%d,countu=countu+1 WHERE num='%d'",tsize,pf.num);
//		  sprintf(query, "DELETE from %s where num=%d",table_name,mmn[i]);
		sprintf(query, "update %s set del='D' where num=%d",table_name,mmn[i]);
		if (mysql_query(sock, query) == -1) goto _fail;
		if (is_mail)  mess3("##  %d 번 메일(%s)이 삭제되었습니다.",bbs.num,bbs.title);
		else mess3("##  %d 번 게시물(%s)이 삭제되었습니다.",bbs.num,bbs.title);

		//백업저장
		if (strncmp(go.code,"__",2)!=0&&!is_mail) {
			bbs.tnum=bbs.num;
			strcpy(bbs.tcode,go.code);
			sprintf(buff,"%s_%s",club_go.code,"__delete");
			add_table(0,sock,buff,body);  //table에 저장함
		}
		//자료파일 삭제
		if (strlen(bbs.filename)) {
			sprintf(filename,"pds/%s/%s/%s.%x",club_go.code,go.code,bbs.filename,bbs.fcount);
			unlink(filename);
		}
		continue;
		_fail:
		mess3("##  %d 번 자료를 삭제할수 없습니다.",mmn[i]);
	}
	mysql_close(sock);
	sleep(1);
	return Yes;
}

