////////////////////////////////////////////////////////////////////////
// XHOST: 리눅스용 BBS HOST  개발:김성대(053-964-1002) BBS:053-963-2190
// 화면 통합관리
///////////////////////////////////////////////////////////////////////////

#include "bbs.h"
#include <dirent.h>

typedef struct {
	char mode;			   //있는가?
	char filename[13];
	char title[41];
	int  filesize;
	time_t date;
} XFRM;
XFRM xfrm;
#define sizeof_xfrm (sizeof(XFRM))
XFRM afrm[3000];

char fdir[300];
char ndir[300];
char ntit[300];
int total;
int total_size;
int re_load;
char datafile[500];
char afilename[10][300];

main(argc, argv)
int argc;
char *argv[];
{
	int  i,n;
	char buff[300];
	char buff2[300];
	char abuff[30][100];
	char adir[30][20];
	char atit[30][40];
	char tcode[9];
	char ccode[9];
	char now_id[9];

	findport(tty); //접속포트 찾기
    read_db_name("db.cfg");
	if (argc<3) {
		printf("ERR:%s CLUB ID\n",argv[0]);
		return;
	}
	read_aname(0);	//회원DB이름 읽어서 배열에 저장
	read_cfg();
	set_tmpfile();		 //임시화일지정하기
	sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);

	strcpy(club_go.code,argv[1]);		//동호회 코드
	strcpy(go.code,argv[2]);			//동호회 코드
	strcpy(now_id,argv[3]); 			//아이디

	read_ccfg();
	read_pf(now_id);

	sprintf(afilename[0],"forum/%s/logo/%s.mnu",club_go.code,tcode);
	sprintf(afilename[1],"forum/%s/logo/%s.mn2",club_go.code,tcode);
	sprintf(afilename[2],"forum/%s/logo/%s.mn3",club_go.code,tcode);
	sprintf(afilename[3],"forum/%s/logo/%s.mn4",club_go.code,tcode);
	sprintf(afilename[4],"forum/%s/logo/%s.log",club_go.code,tcode);
	sprintf(afilename[5],"forum/%s/logo/%s.cm1",club_go.code,tcode);
	sprintf(afilename[6],"forum/%s/logo/%s.top",club_go.code,tcode);
	sprintf(afilename[7],"forum/%s/logo/%s.bot",club_go.code,tcode);
	sprintf(afilename[8],"forum/%s/logo/%s.frm",club_go.code,tcode);
	sprintf(afilename[9],"forum/%s/logo/%s.bl1",club_go.code,tcode);
	sprintf(afilename[10],"forum/%s/logo/%s.bl2",club_go.code,tcode);

	//데이타 파일읽어오기 -> 파일크기.최종날짜확인
	while (1) {
		cls();
		printf(" [메뉴 화면 편집]       %s(%s) %s.mnu\n",club_go.code,club_go.dir,tcode);
		for (i=0;i<11;i++) {
			printf(" %2d. %s %6d Byte\n",i+1,afilename[i],file_size(afilename[i]));
		}
		printf("  편집(E) 삭제(D) 교체(CH) 복사(CP) 등록(UP) 다운(DN) \n");
		printf("  선택>>");
		lineinput(buff,20);check_han(buff);printf(buff);check_cmd(buff);
		if (is_same(mmc[0],"e"))   {
			xedit(afilename[mmn[1]-1]);
		}
		else if (is_same(mmc[0],"d"))   {
			view(afilename[mmn[1]-1]);
			if (yesno("\n 이 파일을 삭제할까요? (y/N)>>",No)) {
				unlink(afilename[mmn[1]-1]);
			}
		}
		else if (is_same(mmc[0],"ch")) {
			printf(" %s,%s 파일을 서로 교체할까요? (Y/n)>>",afilename[mmn[1]-1],afilename[mmn[2]-1]);
			if (yesno("",Yes)) {
				unlink(TMP_FILE);
				view(afilename[mmn[1]-1]);
				file_move(afilename[mmn[1]-1],TMP_FILE);
				file_move(afilename[mmn[2]-1],afilename[mmn[1]-1]);
				file_move(TMP_FILE,afilename[mmn[2]-1]);
			}
		}
		else if (is_same(mmc[0],"cp")) {
			if (!view(afilename[mmn[1]-1])) return;
			printf("\n %s 파일을 %s 로 복사할까요? (Y/n)>>",afilename[mmn[1]-1],afilename[mmn[2]-1]);
			if (yesno("",Yes)) {
				file_copy(afilename[mmn[1]-1],afilename[mmn[2]-1]);
			}
		}
		else if (is_same(mmc[0],"up")) {
			char filename[300];
			char filename2[300];
			int key;
			key=up_file(0,filename,No);   //화일을 전송받아 filename에 저장한다.
			if (key&&is_file(filename)) {
				view(filename);
				printf("\n 이 파일을 %s 로 복사할까요? (Y/n)>>",afilename[mmn[1]-1]);
				if (yesno("",Yes)) {
					file_copy(filename,afilename[mmn[1]-1]);
				}
				sys_tem("rm -rf tmp/up%d%s",cfg.hostno,no_spc(tty));
			}
		}
		else if (is_same(mmc[0],"dn")) {
			sz_file(afilename[mmn[1]-1]);
		}
		else if (mmn[0]>0) {
			view(afilename[mmn[0]-1]);
			pressenter();
		}
		else if (strlen(buff)<1);
		else break;
	}
}
