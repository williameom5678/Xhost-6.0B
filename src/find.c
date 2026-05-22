#include "bbs.h"

findpf2()
{
    char buff[80];
    int n,i,ii,count;
	char table_name[100],filename[500];
	char body[BODY_MAX];
	MYSQL *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
    PF oldpf;
    char query[BODY_MAX+500];

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 4131: %s\n",mysql_error(&mysql));
        return;
	}
    if ((mysql_select_db(sock,DB_NAME)) == -1) {
        printf("## ERR 4132: %s\n",mysql_error(sock));
		mysql_close(sock);
        return;
	}
    bzero(a_str,sizeof(a_str));

    while(1) {
        view("forum/main/frm/pf/findpf.scr");
        lineinput(buff,4);printf("\n");
        n=atoi(buff);
        strcpy(a_str[0],"");
        if (is_quit(buff))  break;
        if (n==1) {xy(30,10);get_str(a_str[1],20);}     //ID
        if (n==2) {xy(30,11);get_str(a_str[2],20);}     //이름
        if (n==4) {xy(30,12);get_str(a_str[3],20);}     //상호
        if (n==5) {xy(30,12);get_str(a_str[4],20);}     //학교
        if (n==6) {xy(30,13);get_str(a_str[5],20);}     //주소
        if (n==9) {
            all_trim(a_str[1]);
            all_trim(a_str[2]);
            all_trim(a_str[3]);
            all_trim(a_str[4]);
            all_trim(a_str[5]);
            if (strlen(a_str[1])==0&&
                strlen(a_str[2])==0&&
                strlen(a_str[3])==0&&
                strlen(a_str[4])==0&&
                strlen(a_str[5])==0) sprintf(query,"SELECT * FROM user");
            else sprintf(query,"SELECT * FROM user where
                 id like '%%%s%%' and
              name  like '%%%s%%' and
              memo1 like '%%%s%%' and
              memo2 like '%%%s%%' and
              addr1 like '%%%s%%'",
              a_str[1],
              a_str[2],
              a_str[3],
              a_str[4],
              a_str[5]);
            if (mysql_query(sock, query) == -1) {
                printf("## ERR %s\n",mysql_error(sock));
                continue;
            }
            qres = mysql_store_result(sock);
            count=mysql_affected_rows(sock);   //현재출력자료
            if (count==0) {     //현재 화면출력자료가 1개도 없다
                mysql_free_result(qres);
                mess("해당되는 자료가 없습니다.");
                continue;
            }
            oldpf=pf;
            ii=0;
            while ((qrow = mysql_fetch_row(qres))!=NULL) {
                qrow2pf(qrow);
                printf("%5d. %-10s (%-10s) %-10.10s %s %-20.20s %s\n",
                ++ii,pf.id,pf.name,cfg.ajob[pf.job%20],datestr(2,pf.logout),pf.memo1,pf.tele);
                del_esc(bbs.keyword);all_trim(bbs.keyword);
                pf=oldpf;
            }
            pf=oldpf;
            mysql_free_result(qres);
            mess("%d 자료 출력끝",ii);
        }
    }
    mysql_close(sock);
    re_print=Yes;
}


findpf()
{
    int i,n=0,i2,ii,n1,n2;
	char buff[500],buff2[500];
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[200];
	char query[5000];
    char filt1[500],filt2[500];
    int maxline=17,cnt,total,end,start,index,ssnum=0;
    PF oldpf;

    strcpy(filt1,"");strcpy(filt2,"");
    if (strlen(filt_str)) sprintf(filt1,"and %s",filt_str);
    strcpy(db_name,DB_NAME);
    strcpy(table_name,"user");
    _cont0:

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
        return;
	}
    if ((mysql_select_db(sock, DB_NAME)) == -1) {
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
        if (ssnum>0) {
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
        printf("회원정보검색(idpf_search)                     등록자료 : %d / %d
────────────────────────────────────────
 번호 ID         성명     직업 접속  지역 근무처                 전화
────────────────────────────────────────
",start/maxline+1,total/maxline+1);
//12345 1234567890 12345678 1234 12345 12345678901234567890123456 1234567890123456
// 5934 osehyung   오세형   한의 00/10 오한의원                   0515280180

        oldpf=pf;
        while((qrow=mysql_fetch_row(qres))) {
            char logout[100];
            cnt++;
            if(cnt <= start) continue;
            qrow2pf(qrow);
            strcpy(buff,pf.addr1);
            text_cut(buff,4);
            if (pf.logout==0) strcpy(logout,"");
            else strcpy(logout,datestr(17,pf.logout));
            printf("%5d %-10.10s %-8.8s %-4.4s %-5.5s %4s %-22.22s %-15.15s\n",
            pf.num,pf.id,pf.name,cfg.ajob[pf.job%20],logout,buff,pf.offi,pf.tele);
            if(cnt >= end) break;
        }
        pf=oldpf;
printf("────────────────────────────────────────
종료(P) 아이디(LI),성명(LN),직업(LJ),지역(LA),근무처(LT),전화(LP)
>> ");
        lineinput(buff,10);printf("\n");check_cmd(buff);check_han(mmc[0]);
        if (is_quit(buff)) break;
        else if (strlen(buff)==0) index++;
        else if (is_same(buff,"b")) index--;
        else if (is_same(mmc[0],"ls")) strcpy(filt_str,"");
        else if (is_same(mmc[0],"lt")||is_same(mmc[0],"li")||is_same(mmc[0],"ln")||is_same(mmc[0],"lt")||is_same(mmc[0],"lj")||is_same(mmc[0],"lp")||is_same(mmc[0],"la")) {
            if (strlen(mmc[1])==0) strcpy(filt_str,"");
            else if (is_same(mmc[0],"li")) sprintf(filt_str,"id like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"ln")) sprintf(filt_str,"name like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lt")) sprintf(filt_str,"offi like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"la")) sprintf(filt_str,"addr1 like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lp")) sprintf(filt_str,"tele like '%%%s%%'",mmc[1]);
            else if (is_same(mmc[0],"lj")) sprintf(filt_str,"job = '%d'",mmn[1]);
        }
        else if (mmn[0]>0) {
            index=0;
            ssnum=mmn[0];
        }
    }
    mysql_close(sock);
    re_print=Yes;
}
