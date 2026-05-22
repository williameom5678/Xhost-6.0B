#ifndef XHOST_PFHEADER
#define XHOST_PFHEADER

// 회원의 정보이다.
typedef struct {
	int    num; 			  //회원 일련 번호 (레코드 번호와 동일)
    char   id[21];            //아이디
    char   name[21];          //성명
    char   eid[21];           //영문ID
	char   passwd[9];		  //비밀번호
	char   id_no[15];		  //주민등록번호
	char   email[41];		   //email
	char   sex; 			  //성별 회원구분
	char   moon;
	time_t birthday;		  //생년월일
	char   job; 			  //직업선택
	char   gofirst[13]; 	  //처음가기 메뉴코드

    char   memo1[71];
    char   memo2[71];
    char   memo3[71];
    char   memo4[71];
    char   memo5[71];
    char   memo6[71];
    char   memo7[71];
    char   memo8[71];

	char   post[8]; 		  //우편번호
    char   addr1[101];         //집주소
    char   addr2[101];         //집주소
    char   tele[71];          //집전화번호
	char   hand[15];		  //핸드폰
	char   offi[71];		  //직장명
    char   del;               //삭제

	char   type;			  //회원타입 (0:거부 9:시삽)
	int    myflag;			  //회원정보 공개 플래그
    int    level;
    int    point;
    int    mymode;

	time_t inday;			  //가입일자
	time_t login;			  //접속시작
	time_t logout;			  //마지막접속일
	int    all_log; 		  //총접속회수
	int    all_time;		  //총이용시간기록	(초)
	int    month_log;		  //이번달총접속회수
	int    month_time;		  //이번달총이용시간(초)
    byte   offmin;            //키입력없을때 OFF(분)
	int    down;			  //다운가능용량
	int    countw;			  //WRITE
	int    countu;			  //UPLOAD
	int    countd;			  //DOWNLOAD
    byte   msg;               //메세지
} PF;
PF pf;
PF pf2;

// 동호회 회원의 정보이다.
typedef struct {
	int num;				// 회원 일련 번호 (레코드 번호와 동일)
    char id[21];            // 아이디
    char name[21];          // 이름
	char memo1[71]; 		// 소개1
	char memo2[71]; 		// 소개2
	char memo3[71]; 		// 소개3
    char memo4[71];         // 소개4
    char memo5[71];         // 소개5
	time_t inday;			// 가입일자 (0x04)	 (5바이트임)
	time_t logout;			// 마지막 접속일
	int  countw;			// w,up,down 회수
	int  countu;			// w,up,down 회수
	int  countd;			// w,up,down 회수
	int  all_log;			// 접속회수
	int  all_time;			// 총이용시간기록 (분)
    int  month_log;         //이번달총접속회수
	int  month_time;		//이번달총이용시간(초)
	char type;				// 동호회의 회원타입 (0:거부 9:시삽)
    char del;               //삭제
} CPF;

CPF cpf;
#endif	/* XHOST_PFHEADER */
