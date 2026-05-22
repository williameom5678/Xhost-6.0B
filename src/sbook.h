#ifndef XHOST_SBOOKHEADER
#define XHOST_SBOOKHEADER
char a_sbookname[70][21];

// 도서검색 정보이다.
typedef struct {
	int    num; 			  //회원 일련 번호 (레코드 번호와 동일)
    char   id[21];            //아이디
	char   title[101];
	char   author[71];
	char   printer[71];
	char   keyword[101];
	char   pdate[21];
    char   ty1;
    char   ty2;
    char   ty3;
    char   ty4;
    char   ty5;
    char   ty6;
    char   ty7;
    char   ty8;
    char   ty9;
    char   ty10;

    char   note[10001];  

} SBOOK;
SBOOK sbook;
#endif	
