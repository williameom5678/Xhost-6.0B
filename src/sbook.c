#include "bbs.h"
#include "sbook.h"

//필드명읽음
void read_sbookname()
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
	sprintf(query,"SELECT * FROM db_book limit 1");
	if (mysql_query(sock, query) == -1) {
		printf("## ERR 5108: %s\n%s\n",mysql_error(sock),query);
		return;
	}

	qres= mysql_store_result(sock);
    for (i=0;i<70;i++) strcpy(a_sbookname[i],"");
	i=0;

    while (i<70&&(qfield = mysql_fetch_field(qres))) {
      //printf("%d %s\n",i,qfield->name);
      strcpy(a_sbookname[i++],qfield->name);
	}
    mysql_free_result(qres);
    mysql_close(sock);
}


//qrow -> pf로 저장
void qrow2sbook(MYSQL_ROW qrow)
{
	int i;
	for (i=0;i<50;i++) {
		if (qrow[i]==NULL) continue;
		if (strlen(a_sbookname[i])<1) continue;
		//printf("%d:%s(%s)\n",i,a_sbookname[i],qrow[i]);
			 if (strcmp(a_sbookname[i],"num"       )==0) sbook.num=atoi(qrow[i]);
		else if (strcmp(a_sbookname[i],"id"        )==0) strcpy(sbook.id,qrow[i]);
		else if (strcmp(a_sbookname[i],"title"     )==0) strcpy(sbook.title,qrow[i]);
		else if (strcmp(a_sbookname[i],"author"    )==0) strcpy(sbook.author,qrow[i]);
		else if (strcmp(a_sbookname[i],"ty1"	   )==0) sbook.ty1=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty2"	   )==0) sbook.ty2=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty3"	   )==0) sbook.ty3=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty4"	   )==0) sbook.ty4=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty5"	   )==0) sbook.ty5=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty6"	   )==0) sbook.ty6=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty7"	   )==0) sbook.ty7=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty8"	   )==0) sbook.ty8=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty9"	   )==0) sbook.ty9=qrow[i][0];
		else if (strcmp(a_sbookname[i],"ty10"	   )==0) sbook.ty10=qrow[i][0];
	}
}



void search_book()
{
    int i,n=0,i2,ii,n1,n2;
	char buff[500],buff1[500],buff2[500],buff3[500];
	MYSQL	  *sock,mysql;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table_name[200];
	char query[5000];
    char filt1[500],filt2[500];
    int maxline=15,cnt,total,end,start,index,ssnum=0;

    strcpy(filt1,"");strcpy(filt2,"");
    if (strlen(filt_str)) sprintf(filt1,"and %s",filt_str);
    strcpy(db_name,DB_NAME);
    strcpy(table_name,"db_book");
	read_sbookname();				//회원정보 필드읽기

    if (!(sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD))) {
        printf("## ERR 2101: %s\n",mysql_error(&mysql));
        return;
	}
    if ((mysql_select_db(sock, db_name)) == -1) {
        printf("## ERR 2102: %s\n",mysql_error(sock));
		mysql_close(sock);
        return;
	}

	printf("제목:");
	lineinput(buff1,20);

    index=0;
    ssnum=0;

	if (strlen(filt_str)) sprintf(query,"select * from db_book where %s order by num desc",filt_str);
	else sprintf(query,"select * from db_book order by num desc");
	if (mysql_query(sock, query) == -1) return;
	qres = mysql_store_result(sock);
	total = mysql_num_rows(qres);
	cnt = 0;
	maxline=10;

	printf("도서검색결과\n 번호 도서명\n");

	while((qrow=mysql_fetch_row(qres))) {
		qrow2sbook(qrow);
		printf("%5d %-30.30s %-10.10s\n",
		sbook.num,sbook.title,sbook.author);
	}

	printf("\n (H,P,M,GO,LI,LN,LT,X)\n 명령 ");
	lineinput(buff,10);printf("\n");check_cmd(buff);
	return;
}
