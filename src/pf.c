// 회원목록
#include "bbs.h"
//게시판 제목을 화면에 표시한다.
//mode==0 보기	1:다음	-1:이전  -3:처음부터
main(int argc, char **argv)
{
    int i,n=0,i2,ii,n1,n2;
	char buff[500],buff2[500];
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[200];
	char query[5000];
    char filt1[500],filt2[500];
    int maxline=15,cnt,total,end,start,index,ssnum=0;

    read_db_name("db.cfg");
	cls();
	read_aname();				//회원정보 필드읽기
	read_abbsname();			//게시판정보 필드읽기
	read_cfg();
	findport(tty);
	set_tmpfile();

    strcpy(filt1,"");strcpy(filt2,"");
    if (strlen(filt_str)) sprintf(filt1,"and %s",filt_str);
    strcpy(db_name,DB_NAME);
    strcpy(table_name,"user");
    _cont0:

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
        return;
	}
    if ((mysql_select_db(sock, db_name)) == -1) {
        printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
        return;
	}

    index=0;
    ssnum=0;
    while (1) {
        if (strlen(filt_str)) sprintf(query,"select * from user where %s order by num desc",filt_str);
        else sprintf(query,"select * from user order by num desc");
        if (mysql_query(sock, query) == -1) break;
        qres = mysql_store_result(sock);
        total = mysql_num_rows(qres);
        cnt = 0;
        maxline=10;
        if (ssnum) {
            index=0;
            i2=0;
            ii=fnoid("num");
            while((qrow=mysql_fetch_row(qres))) {
                //printf("%d %d\n",atoi(qrow[ii]),ssnum);
                if (atoi(qrow[ii])<ssnum) break;
                if (i2++>=maxline) {index++;i2=0;}
            }
            ssnum=0;
            mysql_data_seek(qres,0);                //최고상단 자료 찾기
        }
        if (index<0) index=0;
        if ((index*maxline)>=total) index=(int)(total/maxline);
        start = index * maxline;
        end   = (index+1) * maxline;
        cls();
        printf("회원정보검색(idpf_search)                 등록자료 : %d / %d
────────────────────────────────────────
 번호 ID (li)    성명(ln) 구분(lj)   한의원명/학교학년 (lt)   전화 (lp)
────────────────────────────────────────
",start,total);
//12345 1234567890 12345678 1234 12345 12345678901234567890123456 12345678901234567890
// 5934 osehyung   오세형   한의 00/10 오한의원                   0515280180

        while((qrow=mysql_fetch_row(qres))) {
            cnt++;
            if(cnt <= start) continue;
            qrow2pf(qrow);
            printf("%5d %-10.10s %-8.8s %-4.4s %s %-26.26s %-15.15s\n",
            pf.num,pf.id,pf.name,cfg.ajob[pf.job%20],datestr(17,pf.inday),pf.offi,pf.tele);
            if(cnt >= end) break;
        }
printf("────────────────────────────────────────
명령(H, P, M, GO, LI, LN, LT, X) 
>> ");
        lineinput(buff,10);printf("\n");check_cmd(buff);
        if (is_quit(buff)) break;
        else if (strlen(buff)==0) index++;
        else if (is_same(buff,"b")) index--;
        else if (is_same(mmc[0],"lt")||is_same(mmc[0],"li")||is_same(mmc[0],"ln")||is_same(mmc[0],"lt")||is_same(mmc[0],"lj")||is_same(mmc[0],"lp")||is_same(mmc[0],"la")) {
            if (strlen(mmc[1])==0) strcpy(filt_str,"");
            else if (is_same(mmc[0],"li")) sprintf(filt_str,"id like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"ln")) sprintf(filt_str,"name like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lt")) sprintf(filt_str,"offi like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lp")) sprintf(filt_str,"tele like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lj")) sprintf(filt_str,"job = '%d'",mmn[1]);
        }
        else if (mmn[0]>0) {
            index=0;
            ssnum=mmn[0];
        }
    }
}
