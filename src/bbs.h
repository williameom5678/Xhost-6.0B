#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
//#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <ctype.h>
#include <time.h>
#include <mysql.h>
#include <signal.h>
#include <termio.h>
#include <sys/stat.h>

char a_idname[70][21];  //회원데이타는 50개 항목으로 한정
char a_bbsname[70][21];  //회원데이타는 50개 항목으로 한정
char DB_MAIL[15],DB_NAME[15],DB_CM[15],DB_USER[15],DB_HOST[20],DB_PASSWD[15];

#define VER1  "XHOST 6.0 B1"
#define VER2  "개발:김성대"

#define ishangul(c) ((unsigned char)(c)>=0xa1&&(unsigned char)(c)<=0xfe)
#define not(n) ((n)?0:1)

#define BBSTYPE "abdgcikvwloq+-fzyul1234567890"  //게시판/자료실
#define BBBTYPE "abgiklvoq+-1234567890"          //게시판/자료실
#define PDSTYPE "fcduywz"               //자료실
#define PDSTYPE2 "fcduyw"               //자료실
#define EXETYPE "exn"                   //exec 메뉴

#include "base.h"
#include "header.h"
#include "makenum.h"
#include "pf.h"
#include "ansi.h"

#define MENU_FILE		"menustru/menu.dat"
#define ID_FILE 		"id/id.dat"
#define GUEST_FILE		"id/guest.dat"
#define GUESTNOT_FILE	"id/guestnot.dat"
#define GUESTWAI_FILE	"id/guestwai.dat"
#define GUESTCAN_FILE	"id/guestcan.dat"
#define GUESTOUT_FILE	"id/guestout.dat"
#define GUESTDEL_FILE	"id/guestdel.dat"
#define GUESTDEP_FILE	"id/guestdep.dat"
#define BBS_CFG 		"system/bbscfg.dat"
#define MONI_FILE		"user/moni/moni.dat"
#define GOOD_FILE		"system/bbsgood.goo"
#define GOOL_FILE		"system/bbsgood.gol"

#define is_main()	  (is_same(club_go.code,"main"));
#define is_club()	  (!is_same(club_go.code,"main"));
#define is_bbspds	  (is_char(BBSTYPE,go.type))
#define is_typesub	  (go.type=='m')
#define is_typetel	  (go.type=='n')
#define is_typebbs	  (is_char(BBBTYPE,go.type))
#define is_typepds	  (is_char(PDSTYPE,go.type))
#define is_typeexe	  (is_char(EXETYPE,go.type))

#define is_typeans	  (go.type=='q')
#define is_typevtx	  (go.type=='v')
#define is_typeansi   (go.type=='+')
#define is_typeform    bit(bcfg.form,4)
#define is_typeview    bit(bcfg.form,5)
#define is_typeebs	   bit(bcfg.form,6)
#define is_typeank	   bit(bcfg.form,7)
#define is_typequiz    bit(bcfg.form,8)
#define is_typetalk    bit(bcfg.form,9)
#define is_typevote    bit(bcfg.form,10)
#define is_typesecu   (go.type=='o')
#define is_typecons   (go.type=='k')
#define is_typeday	   bit(bcfg.form,16)
#define is_typeseek    bit(bcfg.form,17)
#define is_typequest   bit(bcfg.form,18)
#define is_typewrite   bit(bcfg.form,19)
#define is_typeup	   bit(bcfg.form,20)
#define is_typeshop    bit(bcfg.form,21)
#define BODY_MAX 304800

char   DM			 ; //연습용 플렉
char   DM1			 ; //연습용 플렉
char   DM2			 ; //임시 발급 플랙  ON이면 500명 이상 금지
char   DM3			 ; //지정번호가 아닌가?
char   NOW_MENU [130] ; //현재메뉴화일명
char   NOW_FILE [130] ; //현재의 게시판화일명
char   NOW_FILED[130] ; //현재의 게시판화일명  (내용)
char   LT_FILE[130]   ; //
char   TMP_FILE [90] ; //
char   TMP_FILE1[90] ; //
char   TMP_FILE2[90] ; //
char   EBS_FILE[90]  ; //
char   BCFG_FILE[200]; // 환경화일
byte   CONT_DAY;	   // 연속출력일수
byte   who;
int    SERVER_PORT[5];
char   subkey4[12];
//int	 NOW_REC	   ; // 현재자료번호
//int	 NOW_TOPREC    ; // 현재화면 상단번호
//int	 NOW_BOTREC    ; // 현재화면 하단번호
//int	 NOW_ALLREC    ; // 현재총자료번호
int    NOW_PAGE 	 ; // 현재페이지
int    NOW_NO		 ; // 현재자료번호
//int	 NOW_TOPNUM    ; // 제일 상단 번호
//int	 NOW_TOPNO	   ; // 현재화면 상단번호
int    NOW_TOPPOS	 ; // 현재화면 상단번호
int    NOW_POS		 ; // 현재화면 상단POS
//int	 NOW_BOTNO	   ; // 현재화면 상단번호
int    NOW_BOTPOS	 ; // 현재화면 상단번호
int    NOW_ALLNO	 ; // 현재총자료번호
int    NOW_ALLNUM	 ; // 현재총자료수
int    NOW_NEWNUM	 ; // 신규자료수
int    TODAY_TIM1	 ; // 등급별 전체 접속시 사용시간
int    TODAY_TIM2	 ; // 등급별 한번 접속시 사용시간
int    TODAY_DOWN	 ; // 등급별 금일 다운용량

int    bbsnum_t 	 ; // 현재게시판 최상위번호
int    bbsnum_e 	 ; // 현재게시판 끝번호
int    bbsnum_a 	 ; // 현재게시판 전체수

char   p_command	 ; //마지막에 p로 들어 왔는가?
char   auto_cmd[70]  ; //자동 처리 명령
char   hostname[21]  ; //접속호스트명
char   REC_DIR[21]	 ; //기록디렉토리	/user/rec

time_t START_TIME	 ; //접속시작 시간
time_t CLUB_START_TIME ; //접속시작 시간
time_t CHECK_TIME	 ; //접속시작 시간 계산별 사용시간
int    SEND_KB		 ; //전송Byte

char re_print;		// 화면 재생여부에 관한 매개수
char re_bbs  ;		// 게시판 재로딩여부
char re_logo;		// 로고 재 표시에 대한 여부
char re_club;		// 동호회의 초기화인가?
char list_mode; 	// 현재게시판의 내용출력모드
char filt_str[300]; // 현재게시판의 필터
char noti_mode; 	// 공지사항을 보여주는 모드인가?
char guest_mode;	//손님접속모드
char nostop;		//로고 보여줄때 멈추지 않음
char limit; 		//쓰기,등록,다운등 제한
char c_proc,c_proc2,c_proc3;
char autoup;

int N_page;
int view_pos;
char view_num;
char g_char;
char buffnum[8];
char jpg_tag;
int  alast_read[30];
char bbsrec_club[19];
char bbsrec_code[19];
char bbsrec_jobmode;
char bbsrec_gotype;
time_t bbsrec_time;
int mymoni_rec;

int NOW_REC;				//현재의 편집하는 bbs의 레코드 번호
int  cmdnum;				//선택한 번호
char mmc[10][21];			 //입력한 명령
int  mmn[101];				//문자입력->숫자
char dark_mode;
char sub_go[9]; 				//보조가기코드
char pf_crt;
char aread_nums[50][20];		 //자료 읽은 번호
int RATE;						//ip의 배당율
int allmode;					//전체임시모드
int allmode2;					//전체임시모드
int netmode;					//네트워크모드
int now_cmd_num;	 //현재의 도움말 번호
char bbs_mode;					//bbs의 모드
char _cmdline1[31];
char _cmdline2[31];
char db_name[15];

char g_yes; 		  //로고에서 수정가능한 자동Yes  :!자동!
char g_id[30];		  //전역선언 아이디
char g_name[30];	  //전역선언 이름
char g_buff1[301];	  //전역선언 버퍼
char g_buff2[301];	  //전역선언 버퍼
char g_buff3[301];	  //전역선언 버퍼
char g_buff4[301];	  //전역선언 버퍼
char g_buff5[301];	   //전역선언 버퍼
char g_buff6[30];	  //전역선언 버퍼
char g_buff7[30];	  //전역선언 버퍼
char g_buff8[30];	  //전역선언 버퍼
char g_buff9[30];	  //전역선언 버퍼
char g_buff10[30];	  //전역선언 버퍼
int  a_num[100];	   //광역
char a_str[100][100];	//광역
int  ascr_count;
int  list_anum[50]; 	  //현재게시판 번호 LIST
int  bbsdownnum;
char bbsreadall;		  //내용더이상없음

struct termio termold;			//시작하기전 모드
struct termio termnew;			//중간모드 (쉘사용전)
struct termio termall;			//완전세팅모드

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

//회원관련 정보
#include "pf.h"
// 게시물 정보 화일헤더
typedef struct {			   // 게시물 정보
	int num;				   // 게시판번호
	char id[21];			   // 작성자 아이디
	char name[21];			   // 작성자 이름
	time_t date;			   // 작성 일자
	time_t date2;			   // 작성 일자
	int  fcount;			   // 같은파일일때 증가수
	int  line;				   // 내용 길이(줄수)
	int  hits;				   // 조회수
	int  down;				   // 다운회수
	int  ok;				   // 찬성
	int  no;				   // 찬성
	int  good;				   // 추천자료	   0:보통 1:우수 2:최우수
	int  an;				   // 답변
	byte del;				   // 삭제여부	   0:보통 1:삭제
	byte tag;				   // TAG
	byte tag2;				   // TAG2
	byte color; 			   // 색상
	char email[31]; 		   // 제목
	char homepage[51];		   // 제목
	char title[81]; 		   // 제목
	int  posi;				   // 내용 포인터
	int  size;				   // 내용 크기
	char keyword[31];		   // 검색어
	char passwd[9]; 		   // 암호
	char filename[51];		   // 화일명
	char userip[21];		   // IP
	int  filesize;			   // 화일크기
	char tcode[13]; 		   // 임시가기코드
	char tclub[13]; 		   // 임시가기코드
	int  tnum;				   // 게시물번호
	int  link1; 			   // 링크게시물번호
	int  link2; 			   // 링크게시물번호
	int  link3; 			   // 링크게시물번호
	char tid[21];			   // 받는사람
	char note[201]; 		   // 주석
	int  pos;
	int  depth;
} BBS;
BBS bbs;

char now_type;				//현재의 등급 (동호회일때 동호회의 등급)
int adddown;				//얻은 다운점수

char atype[20][9];			//회원등급별 이름


// 전체가기코드 표
typedef struct {
	char name[21];			 //이름 코드
	char code[9];			 //가기 코드
}GG;
#define sizeof_gg  (sizeof(GG))

//비비에스 환경설정
typedef struct {
	//시스템관련 설정
	byte hostno;			//호스트번호
	char hostname[21];		//호스트이름
	char sysop[21]; 		 //시삽의 아이디
	char passwd[9]; 		 //시삽의 아이디
	int  mode;				//설정
	int  backmode;			//시스템백업
	int  hackmode;			//감시관련
	char monichar;

	//화면관련
	int dispmode;
	int usermode;			//US모드
	char usdisp;			//강제 US표시지정

	//메일관련
	int  mailmode;			//메일모드
	char mailwrite; 		//메일 사용 가능 등급
	char emailwrite;		//E메일 사용 가능 등급
	char wmalltype; 		//전체메일등급

	//업,다운관련
	int  downmode;			//다운관련 설정 bit()
	char downfree;			//무제한 다운가능 타입
	char downmult;
	char clubmaxup; 		//동호회최대다운비율(.1)
	char rz[81];
	char sz[81];
	byte drate; 		   //다운시 가산비율
	byte urate; 		   //등록시 가산

	//게시판관련
	int  bbsmode;			//게시판모드
	byte helptype;			//잠깐 도움말을 보여주는 등급
	byte helplog;		   //잠깐 도움말을 보여주는 접속수
	byte notice;
	byte noticet;
	byte noticex;
	byte noticey;
	byte noticeline;
	char gdstr[11]; 		//추천순서
	char jpgchar[3];		//화상문자

	//손님/회원관련
	int  guestin;			//손님가입
	int  guestmode; 		//손님모드
	int  guestitem; 		//ID입력모드   (입력항목결정)
	int  pfmode;			//출력모드
	int  loginmode; 		//아이디입력모드
	char guestid[9];		//손님 접속 아이디
	byte chatst;			//대화방시작모드
	byte guesttype; 		//초기 등급
	int  guesttime; 		//초기 시간 (분)
	int  guestdown; 		//초기 다운용량
	byte ed_pfmode; 		//신상편집환경
	byte freelogin; 		//요일별,시간대별 무시등급
	byte relog; 			//재접속등급
	byte limittype; 		//제한등급

	//대화실설정
	int  chatmode;			//대화실모드
	int  messmode;			//메세지모드
	char chatwarn;			//체팅경고시간(분)
	byte chattype;			//대화 진입 등급
	byte sayline;			//say최대제한

	//등록번호
	int  procnum;			//작업발급번호
	time_t procdate;		//작업발급번호

	//인포샵모드
	int  infomode;
	int  mprocmode; 		//분산처리모드

	//화상관련모드
	int  jpgmode;

	byte telnettimeout; 	//텔넷확인시간
	int  startmode; 		//진입관련설정
	char jpgstr[81];		//화상전송문자열
	char jpgsz[81]; 		//화상전송프로토콜
	char utmpfile[31];		//utmp파일
	char no_logotype;		//setlogo 사용등급
	int  logomode;
	byte waitkey;			//대기시간(분)
	char comp[5];			//상호
	int  mrecmode;
	int  price1;			//분당금액
	int  price2;			//KB당금액 (x.x);
    char allsay;           //전체메세지
	char telnettype;		//텔넷접속등급
	char sp_____[9];		//임시
	int  guestet;			 //손님가입시 질문여부 항목
	char txtmode;			//자료변환모드
	word guestp_ph; 			 //체력
	word guestp_it; 			 //지력
	word guestp_at; 			 //매력
	word guestp_pr; 			 //방어력
	int  guestp_mo; 			 //모드
	byte up_limit;			//등록 수 제한
	byte dn_limit;			//다운 수 제한
	byte dn_mult_limit; 		  //멀티 다운 수 제한
	int  sp_2;
	byte limit_r;			//최소가능등급
	byte limit_w;			//
	byte limit_u;			//
	byte limit_d;			//
	int  vote;				//투표장모드
	byte vote_type; 		//투표장모드
	byte vote_opentype; 	//투표장모드
	int  limit_slog;		//접속수 출력시 최대값
	byte limit_m;			//서버메뉴 진입가능등급
	char check_wgo[5][9];	// 쓰기검사
	int  check_today;		// 오늘만 검사?
	int  check_todayon; 	// 출력여부검사?
	byte alarm_time;
	char usdisp2;			//대화시
	int  zmode; 			//전체자료실모드
	int  gomode;
	int  limit_login;		//총접속자수
	char sip[15];
	char nip[21];
	byte count_server;		//접속서버수
	char lock_ip_addr[20];
	char gd_str[10][31];
	char gd_name[10][9];
	byte itype; 			//진입가능
	byte rtype; 			//읽기가능
	byte dtype; 			//다운가능
	byte wtype; 			//쓰기가능
	char memo1[21]; 		  //비고의 제목
	char memo2[21]; 		  //비고의 제목
	char memo3[21]; 		  //비고의 제목
	char memo4[21]; 		  //비고의 제목
	char memo5[21]; 		  //비고의 제목
	char memo6[21]; 		  //비고의 제목
	char memo7[21]; 		  //비고의 제목
	char memo8[21]; 		  //비고의 제목
	char gtype; 				//신청가입 최소 등급
	byte gage1; 				//신청가입 최소 나이
	byte gage2; 				//신청가입 최대 나이
	byte hidetype;				//진입시 등급감춤
	byte disp_memo1;
	byte disp_memo2;
	byte disp_memo3;
	byte disp_memo4;
	byte disp_memo5;
	byte disp_memo6;
	byte disp_memo7;
	byte disp_memo8;
	byte skip_intro;
	char atype[20][13]; 		//등급별 이름
	byte age1;
	byte age2;
    byte view_notice;
	char ajob[20][11];			//직업선택
    char basedir[51];
} CFG;
CFG cfg;		//메인 환경화일


//동호회 환경설정
typedef struct {
	char name	[80];			//제목
	char sysop	[21];			//시삽의 아이디
	char sysop1 [21];			//시삽의 아이디
	char sysop2 [21];			//시삽의 아이디
	char sysop3 [21];			//시삽의 아이디
	char passwd [9];			//시삽메뉴의 암호
	char enterp [9];			//진입시 암호 지정
	byte notice    ;			//시작시 공지출력안함
	byte noticet   ;			//공지출력모양
	byte autoguest ;			//자동가입	0:수동 1:자동 2:가입신청불허
	byte intype    ;			//동호회 진입최소등급;
	byte cintype	;			//동호회 진입최소 동호회등급;
	byte guesttype; 			//초기가입등급
	byte age1	   ;			//나이제한 012034 (시작-끝)
	byte age2	   ;			//나이제한 012034 (시작-끝)
	char gtype; 				//신청가입 최소 등급
	byte gage1; 				//신청가입 최소 나이
	byte gage2; 				//신청가입 최대 나이
	char modeopen  ;			//공개형태
	byte stop;					//중지모드
	byte sametype;				//메인=동호등급
	byte hidetype;				//진입시 등급감춤
	byte timelogo;				//시간별 로고감춤
	byte noticex;
	byte noticey;
	byte disp_memo1;
	byte disp_memo2;
	byte disp_memo3;
	byte disp_memo4;
	byte disp_memo5;
	char memo1[21]; 		  //비고의 제목
	char memo2[21]; 		  //비고의 제목
	char memo3[21]; 		  //비고의 제목
	char memo4[21]; 		  //비고의 제목
	char memo5[21]; 		  //비고의 제목
	byte skip_intro;
	char atype[20][13]; 		//등급별 이름
	int  chatnum;				//동호회대화방 번호
	byte guestin;				//손님접속시
	byte itype; 				//진입가능
	byte rtype; 				//읽기가능
	byte dtype; 				//다운가능
	byte wtype; 				//쓰기가능
	byte ictype;				//진입가능
	byte rctype;				//읽기가능
	byte dctype;				//다운가능
	byte wctype;				//쓰기가능
    int  roomnum;               //전용대화방번호 (9500~)
} CCFG;
CCFG ccfg;		 //동호회 환경화일


//가기코드
typedef struct {
	int  rec;				//메뉴REC
	char deep;				//메뉴의 깊이 0:top
	char type;				//메뉴형태
	char num[5] ;			//선택번호
	char code[9];			//가기코드
	char name[41];			//메뉴명
	char wtimes[5]; 		//쓰기제한
	char dir[61];			//메뉴명
}GO;
GO go;
#define sizeof_go			(sizeof(GO))

GO club_go; 				 //현재 동호회 가기명령
char last_club[9];			 //마지막지정동호회
GO last_go; 				 //마지막가기코드
char club_mode; 			 // 동호회 모드일때 Yes

//게시판 환경설정
//게시판별 기록 bbsdata/코드/bcfg
typedef struct {
	int  mode	   ;			//기본모드
	char key[31];				//메뉴검색키워드	 창업,imf,부업,여성,일뉴,가나
	char bdntype   ;			//BDN가능타입
	byte wdown	   ;			//일반업보상(.1)
	byte wdown2    ;			//심야업보상(.1)
	byte rdown	   ;			//일반다운줄어듬(.1)
	byte rdown2    ;			//심야다운줄어듬(.1)
	char passsys[5];			//시삽메뉴의 암호
	char passin [5];			//진입암호
	int  itime; 				//가능시간
	int  dtime; 				//가능시간
	int  rtime; 				//가능시간
	int  wtime; 				//가능시간
	int  outday;				//지난날짜삭제함
	int  runday;				//선착순쓰기
	byte itype; 				//진입가능
	byte rtype; 				//읽기가능
	byte dtype; 				//다운가능
	byte wtype; 				//쓰기가능
	byte ictype;				//진입가능
	byte rctype;				//읽기가능
	byte dctype;				//다운가능
	byte wctype;				//쓰기가능
	char fdown; 				//자유다운등급
	char fread; 				//자유읽기등급
	//모양관련
	int  form	   ;			//메뉴모양
	int  modelist  ;			//출력형태
	char headnum   ;			//기본선택머리말
	char jpg_x	   ;			//화상시 게시물위치
	char jpg_y	   ;			//화상시 게시물위치
	char list_x    ;			//일반게시물위치
	char list_y    ;			//일반게시물위치
	char disp_x    ;			//일반게시물위치
	char disp_y    ;			//일반게시물위치
	char listline  ;			//한화면최대표시줄
	int  limitsize ;			//게시물내용크기제한
	//다운관련
	int  downmode  ;
	char uhour1    ;
	char uhour2    ;
	char dhour1    ;
	char dhour2    ;
	char urate	   ;			//등록시가산
	char drate	   ;			//다운시가산
	char uratet    ;			//등록시가산  시간지정
	char dratet    ;			//다운시가산  시간지정
	int  wmode	   ;			//쓰기관련모드
	char comp[5];				//IP상호
	int  modeok    ;			//찬성반대
	int  qmode	   ;			//설문관련기능
	char maxline   ;
	char pos_y1    ;			//읽기시 상단위치
	char pos_y2    ;			//읽기시 하단위치
	int  price1;				//사용요금 분당
	int  price2;				//사용요금 KB당
	int  automode;				//자동 처리 모드
	byte updown ;				//상품의 점수레벨
	int  jpgmode;				//화상관련 설정
	byte li_w;					//일일 쓰기 ?회 이상 진입
	byte cmd_x; 				//명령줄 위치
	byte cmd_y;
	int  recmode;				//기록관련 설정
	byte up_limit;				//등록 수 제한
	byte dn_limit;				//다운 수 제한
	byte dn_mult_limit; 		//멀티 다운 수 제한
	byte bform; 				//게시판모양
	char write_id[9];			//담당이 쓸때ID
	int  imode; 				//진입관련설정

	char name[70];
	int num_hits;
	int num_new;
	char sysop[21];
	char sysop1[21];
	char sysop2[21];
	char sysop3[21];
	char passwd[9];
    byte use_file   ;
    byte use_hide   ;
	byte use_name	;
	byte use_email	;
	byte use_tag	;
	byte use_passwd ;
	byte use_body	;
	byte use_ok 	;
    byte use_good   ;
    byte use_good3  ;
	int  total		;
	time_t date 	;
	time_t date2	;
	int line;
	int tline;
} BCFG;
BCFG bcfg;		 //동호회 환경화일


char OLD_MONI_MODE;

//접속 현황 기록의 자료이다
//기록화일 user/moni/moni.dat
typedef struct {
	char id[21];
	char name[21];
	char type;
	char mode;		 //작업동작모드  0:없음 1:보통 2:메세지거부
	char stat;		 //작업동작모드  W:게시판적기 D:다운중 U:업중 C:대화 E:외부
	char club[13];
    char tty[13];
	char gocode[13];
	char goname[21];
	char what[71];			//무슨 작업인가?
	char hostname[30];		//호스트명
	time_t login;			//접속시작시간
	time_t logout;			//접속시작시간
	char msg ;				//메세지 여부
	char mode2; 			//메세지 여부
	char hostno;
	int  pfnum; 			 //회원번호
	int  pid;
    byte offmin;
} MONI;
MONI moni;
#define sizeof_moni (sizeof(MONI))

struct utimebuf{
	time_t actime;
	time_t modtime;
};

//추천관련정보
typedef struct {
	char mark;
	int  count;
} AGOOD;
#define sizeof_agood (sizeof(AGOOD))
AGOOD agood[4][10];
//추천관련정보
typedef struct {
	char mark;
	byte color_char;
	byte color_back;
	char name[9];
} ACOLOR;
#define sizeof_acolor (sizeof(ACOLOR))
ACOLOR acolor[10];
char a_is_file[10][51];

//명령저장
typedef struct {
	char cmd[9];	   // 명령
	char cm2[9];	   //
	char pass[9];	   // 암호
	char type;		   //가능등급
} SYSCMD;

#define now_year()		  now_now(1,0,0)
#define now_year2() 	  (now_now(1,0,0)+1900)
#define now_month() 	  now_now(2,0,0)
#define now_day()		  now_now(3,0,0)
#define now_hour()		  now_now(4,0,0)
#define now_min()		  now_now(5,0,0)
#define now_wday()		  now_now(6,0,0)
#define now_sec()		  now_now(15,0,0)
#define now_dnum()		  now_now(7,0,0)
#define now_mday()		  now_now(8,0,0)
#define now_cday()		  now_now(9,0,0)
#define now_cyear() 	  now_now(10,0,0)
#define date_year(date2)  now_now(1,1,date2)
#define date_month(date2) now_now(2,1,date2)
#define date_day(date2)   now_now(3,1,date2)
#define date_hour(date2)  now_now(4,1,date2)
#define date_min(date2)   now_now(5,1,date2)
#define date_wday(date2)  now_now(6,1,date2)
#define date_sec(date2)   now_now(15,1,date2)
#define date_dnum(date2)  now_now(7,1,date2);
#define date_mday(date2)  now_now(8,1,date2);
#define date_cday(date2)  now_now(9,1,date2);
#define date_cyear(date2) now_now(10,1,date2);

static char *awork[30]= { "    ","일반","동호","대화","게임",
						  "쓰기","등록","읽기","다운","메일",
						  "분당","건당","개IP","머드","화상",
						  "외부","텔넷","명령","가입","작업",
						  "외IP","게IP","게시","접속","기타",
						  "삭게","삭자","게시","접속","기타"
						  };
