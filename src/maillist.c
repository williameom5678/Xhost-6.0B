////////////////////////////////////////////////////////////////////////
// XHOST: 리눅스용 BBS HOST  개발:김성대(053-964-1002) BBS:053-963-2190
// 게시판 담당자의 메뉴
///////////////////////////////////////////////////////////////////////////
#include "bbs.h"

MYSQL	  *sock,mysql;
MYSQL_RES *qres;
MYSQL_ROW qrow;

//가기코드
typedef struct {
	int  num;
	char id[21];
	char title[61];
	int  total ;
    char code[21];
	char data[1000];
}BOOK;
BOOK book;
int now_top=0;
char query[5000];

#define sizeof_go			(sizeof(GO))
main(int argc, char **argv)
{
	int i,n=0,n1,nn,anum[500];
	char buff[500],buff2[500];

    read_db_name("db.cfg");
	cls();
	read_aname();				//회원정보 필드읽기
	read_abbsname();			//게시판정보 필드읽기
	read_cfg();
	findport(tty);
	set_tmpfile();
    go.type='r';

	if (!read_pf(argv[1])) {
		mess("%s 검색실패",argv[1]);
		return;
	}
    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
		return;
	}
	if ((mysql_select_db(sock, DB_NAME)) == -1) {
        printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
		return;
   }

	while (1) {
        view("forum/main/frm/mail/maillist.top");
        sprintf(query,"SELECT num,id,title,total,code,data FROM book where id='%s' order by num",pf.id);
		if (mysql_query(sock, query) == -1) {
			printf("자료없음\n");
		}
		else {
			qres = mysql_store_result(sock);
			bzero(&anum,sizeof(anum));
			nn=0;
			while ((qrow = mysql_fetch_row(qres))!=NULL) {
				i=0;
				book.num=atoi(qrow[i++]);
				strcpy(book.id,qrow[i++]);
                strcpy(book.title,qrow[i++]);
				book.total=atoi(qrow[i++]);
				strcpy(book.code,qrow[i++]);
				strcpy(book.data,qrow[i++]);
                anum[++nn]=book.num;
                printf("%4d %-12.12s %3d %s\n",nn,book.code,book.total,book.title);
			}
		}
		mysql_free_result(qres);
        _cmd:
        view("forum/main/frm/mail/maillist.bot");
        lineinput(buff,30);check_cmd(buff);printf("\n");
//        printf(" %d %d \n",mmn[1],anum[mmn[1]]);
		if (is_quit(buff)) return;
		else if (is_same(mmc[0],"w"))  new_book();
        else if (is_same(mmc[0],"e"))  edit_book(1,anum[mmn[1]]);
		else if (is_same(mmc[0],"d"))  delete_book(anum[mmn[1]]);
        else if (is_same(mmc[0],"dn")) down_book(anum[mmn[1]]);
        else if (is_same(mmc[0],"up")) edit_book(2,anum[mmn[1]]);
        else if (mmn[0]>0)             {
            disp_book(anum[mmn[0]]);
            goto _cmd;
        }
	}
}

new_book()
{
    char ch,buff[2500],buff2[500];
    int ret,i,nn;
    view("forum/main/frm/mail/maillist.scr");
    xy(18,6);lineinput(buff,21); //코드
    if (strlen(buff)<1||is_quit(buff)) return;
    strchng2(buff,"\'","");strchng2(buff,"\"","");
    strcpy(book.id,pf.id);
    strcpy(book.code,buff);
    xy(18,7);lineinput(buff,50); //이름
    if (strlen(buff)<1||is_quit(buff)) return;
    strchng2(buff,"\'","");strchng2(buff,"\"","");
    strcpy(book.title,buff);
    xy(1,9);
	unlink(TMP_FILE);

	ret=input_tmp(0);
	if (!ret||file_size(TMP_FILE)<2) return;
    file2buff(buff,TMP_FILE,2000);

    unlink(TMP_FILE);
    strchng2(buff,"\'","");strchng2(buff,"\"","");strchng2(buff,"\\","");
	strcpy(book.data,buff);
    book.total=calc_total(buff);
    sprintf(query,"insert into book (id,title,total,code,data)
	values (
	'%s','%s','%d','%s','%s')",
	book.id,book.title,book.total,book.code,book.data);
    if (mysql_query(sock, query) == -1) {
        printf("## ERR 5323: %s\n%s\n",mysql_error(sock),query);
        return;
    }
    mess("%s (%d개) 주소록이 저장되었습니다.",book.code,book.total);
}


edit_book(int mode,int num)
{
    char ch,buff[2500],buff2[500];
    int i,n,ret;
	if (!read_book(num)) {
        mess("%d 검색실패",num);return;
	}
    view("forum/main/frm/mail/maillist.scr");
    xy(18,6);printf(book.code);
    xy(18,7);printf(book.title);

    if (mode!=2) {
        xy(18,6);lineinput(buff,21); //코드
        if (strlen(buff)<1);
        else if (is_quit(buff)) return;
        else {
            strchng2(buff,"\'","");strchng2(buff,"\"","");
            strcpy(book.code,buff);
        }
        xy(20,7);lineinput(buff,50); //이름
        if (strlen(buff)<1);
        else if (is_quit(buff)) return;
        else {
            strchng2(buff,"\'","");strchng2(buff,"\"","");
            strcpy(book.title,buff);
        }
    }

    unlink(TMP_FILE);
    buff2file(book.data,TMP_FILE);
    ret=edit_tmp();
    if (!ret||!is_file(TMP_FILE)) {mess("%d 수정실패");return;}
    file2buff(buff,TMP_FILE,2000);
    unlink(TMP_FILE);
    strchng2(buff,"\'","");strchng2(buff,"\"","");strchng2(buff,"\\","");
	strcpy(book.data,buff);
    book.total=calc_total(buff);
    strchng2(book.title,"\'","");strchng2(book.title,"\"","");
    strchng2(book.code,"\'","");strchng2(book.code,"\"","");
    strchng2(buff,"\'","");
    strchng2(buff,"\"","");
    strchng2(buff,"\\","");

    sprintf(query, "update book set
    title='%d',code='%s',total='%d',data='%s' where num=%d",
    book.title,book.code,book.total,book.data,num);
    if (mysql_query(sock, query) == -1) {
        printf("## ERR 5323: %s\n%s\n",mysql_error(sock),query);
        return;
    }
    mess("%s (%d개) 주소록이 저장되었습니다.",book.code,book.total);
}

delete_book(int num)
{
    char buff[2500];
	int ret;
	if (!read_book(num)) {
        mess("%d 검색실패",num);return;
	}
    printf("%s (%d개) 주소록을 지울까요?(y/N)>>",book.code,book.total);
    if (yesno("",No)) {
        sprintf(query, "delete from book where num=%d",num);
        if (mysql_query(sock, query) == -1) {
            printf("## ERR 5323: %s\n%s\n",mysql_error(sock),query);
            return;
        }
        mess("%s (%d개) 주소록이 삭제되었습니다.",book.code,book.total);
    }
}

read_book(int num)
{
    int i;
    sprintf(query,"SELECT num,id,title,total,code,data FROM book where num=%d",num);
    if (mysql_query(sock, query) == -1) {
//        mess("%d 자료없음",num);
        return No;
    }
    qres = mysql_store_result(sock);
    if ((qrow = mysql_fetch_row(qres))==NULL) {
//        mess("%d 자료없음",num);
        return No;
    }
    i=0;
    book.num=atoi(qrow[i++]);
    strcpy(book.id,qrow[i++]);
    strcpy(book.title,qrow[i++]);
    book.total=atoi(qrow[i++]);
    strcpy(book.code,qrow[i++]);
    strcpy(book.data,qrow[i++]);
    //printf("%5d %-8s %3d %s\n",book.num,book.code,book.total,book.title);
    return Yes;
}


down_book(int num)
{
    if (!read_book(num)) {
        mess("%d 자료 없음",num);
        return No;
    }
    buff2file(book.data,TMP_FILE);
    sz_file(TMP_FILE);
}


disp_book(int num)
{
    char buff[2500];
	int ret;
	if (!read_book(num)) {
        mess("%d 검색실패",num);return;
	}
    view("forum/main/frm/mail/maillist.scr");
    xy(18,6);printf("%s (총 %d개)",book.code,book.total);
    xy(18,7);printf(book.title);
    xy(1,13);printf(book.data);
    printf("\n");
}


// 데이타를 읽어 총수를 return 한다.
calc_total(char *buff)
{
    int i,n;
    char ch;
    n=0;
    for (i=0;i<(int)strlen(buff);i++) {
		ch=buff[i];
        if (ch==' '||ch=='\n') n++;
	}
    return n;
}
