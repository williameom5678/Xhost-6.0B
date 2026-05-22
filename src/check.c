#include "bbs.h"

check_type(int mode)  //메뉴 가능 등급확인   불가능 -> Yes
{
    char buff[300];
    char buff2[300];
	int old_club_mode=club_mode;
	int key=Yes;
	int passkey=Yes;
	int i,n,cc=0;
	char filename[300];

    if (mode=='i'||mode=='j') {
        sprintf(buff,"forum/%s/logo/%s.sid",club_go.code,go.code);
        if (pf.type<18&&is_file(buff)) {
            if (in_file2(buff,pf.id)) return No;
            mess("진입불가능 ID입니다.");
            return Yes;
        }
        sprintf(buff,"forum/%s/logo/%s.sii",club_go.code,go.code);
        if (pf.type<18&&in_file2(buff,pf.id)) {
            sprintf(buff,"진입불가능");
            mess("진입불가능 ID입니다.");
            return Yes;
        }
    }
    if (c_proc) {
        printf("mode:%c ID:%s 등급:%d 동호등급:%d 동호회:%s 가기코드:%s\n",mode,pf.id,pf.type,cpf.type,club_go.code,go.code);
        printf("CFG  itype:%d rtype:%d wtype:%d dtype:%d\n",cfg.itype,cfg.rtype,cfg.wtype,cfg.dtype);
        printf("BCFG itype:%d rtype:%d wtype:%d dtype:%d\n",bcfg.itype,bcfg.rtype,bcfg.wtype,bcfg.dtype);
        printf("BCFG ictype:%d rctype:%d wctype:%d dctype:%d\n",bcfg.ictype,bcfg.rctype,bcfg.wctype,bcfg.dctype);
        printf("CCFG itype:%d rtype:%d wtype:%d dtype:%d\n",ccfg.itype,ccfg.rtype,ccfg.wtype,ccfg.dtype);
        printf("CCFG ictype:%d rctype:%d wctype:%d dctype:%d\n",ccfg.ictype,ccfg.rctype,ccfg.wctype,ccfg.dctype);
        pressenter();
    }

    if (mode=='i'&&pf.type<18&&!bbs_man(pf.id)) {
        if (bit(bcfg.imode,11)&&(pf.type<1||pf.sex!='f'))     {set_bbs_logo("lm1",buff);goto fail_enter;}
        if (bit(bcfg.imode,13)&&(pf.type<1||pf.sex=='f'))     {set_bbs_logo("lm2",buff);goto fail_enter;}
        if (bit(bcfg.imode,15)&&(pf.type<1||get_age(pf)<19))  {set_bbs_logo("lm3",buff);goto fail_enter;}
        if (bit(bcfg.imode,17)&&(pf.type<1||get_age(pf)>=19)) {set_bbs_logo("lm4",buff);goto fail_enter;}
    }

    if (mode=='w'&&pf.type<18&&!bbs_man(pf.id)) {
        if (bit(bcfg.imode,12)&&(pf.type<1||pf.sex!='f'))     {set_bbs_logo("lm5",buff);goto fail_enter;}
        if (bit(bcfg.imode,14)&&(pf.type<1||pf.sex=='f'))     {set_bbs_logo("lm6",buff);goto fail_enter;}
        if (bit(bcfg.imode,16)&&(pf.type<1||get_age(pf)<19))  {set_bbs_logo("lm7",buff);goto fail_enter;}
        if (bit(bcfg.imode,18)&&(pf.type<1||get_age(pf)>=19)) {set_bbs_logo("lm8",buff);goto fail_enter;}
    }

	if (is_same(go.code,"top")||is_same(go.code,"guest")||is_same(go.code,"cguest"))
		return No;
	if (pf.type>17||(club_mode&&cpf.type>17)||bbs_man(pf.id)) return No;

	strcpy(buff,"");
    if (club_mode) {
        if (mode=='i'&&bcfg.ictype>now_type) sprintf(buff,"진입금지 동호등급 %d 이상  (현재:%d)",bcfg.ictype,now_type);
        if (mode=='r'&&bcfg.rctype>now_type) sprintf(buff,"읽기금지 동호등급 %d 이상  (현재:%d)",bcfg.rctype,now_type);
        if (mode=='w'&&bcfg.wctype>now_type) sprintf(buff,"쓰기금지 동호등급 %d 이상  (현재:%d)",bcfg.wctype,now_type);
        if (mode=='d'&&bcfg.dctype>now_type) sprintf(buff,"다운금지 동호등급 %d 이상  (현재:%d)",bcfg.dctype,now_type);
        if (mode=='i'&&ccfg.ictype>now_type) sprintf(buff,"진입금지 동호등급 %d 이상  (현재:%d)",ccfg.ictype,now_type);
        if (mode=='r'&&ccfg.rctype>now_type) sprintf(buff,"읽기금지 동호등급 %d 이상  (현재:%d)",ccfg.rctype,now_type);
        if (mode=='w'&&ccfg.wctype>now_type) sprintf(buff,"쓰기금지 동호등급 %d 이상  (현재:%d)",ccfg.wctype,now_type);
        if (mode=='d'&&ccfg.dctype>now_type) sprintf(buff,"다운금지 동호등급 %d 이상  (현재:%d)",ccfg.dctype,now_type);

        if (mode=='i'&&bcfg.itype>pf.type) sprintf(buff,"진입금지 메인등급 %d 이상  (현재:%d)",bcfg.itype,pf.type);
        if (mode=='r'&&bcfg.rtype>pf.type) sprintf(buff,"읽기금지 메인등급 %d 이상  (현재:%d)",bcfg.rtype,pf.type);
        if (mode=='w'&&bcfg.wtype>pf.type) sprintf(buff,"쓰기금지 메인등급 %d 이상  (현재:%d)",bcfg.wtype,pf.type);
        if (mode=='d'&&bcfg.dtype>pf.type) sprintf(buff,"다운금지 메인등급 %d 이상  (현재:%d)",bcfg.dtype,pf.type);
        if (mode=='i'&&ccfg.itype>pf.type) sprintf(buff,"진입금지 메인등급 %d 이상  (현재:%d)",ccfg.itype,pf.type);
        if (mode=='r'&&ccfg.rtype>pf.type) sprintf(buff,"읽기금지 메인등급 %d 이상  (현재:%d)",ccfg.rtype,pf.type);
        if (mode=='w'&&ccfg.wtype>pf.type) sprintf(buff,"쓰기금지 메인등급 %d 이상  (현재:%d)",ccfg.wtype,pf.type);
        if (mode=='d'&&ccfg.dtype>pf.type) sprintf(buff,"다운금지 메인등급 %d 이상  (현재:%d)",ccfg.dtype,pf.type);
    }
    if (mode=='i'&&cfg.itype>pf.type ) sprintf(buff,"진입금지 메인등급 %d 이상  (현재:%d)",cfg.itype,pf.type);
    if (mode=='r'&&cfg.rtype>pf.type ) sprintf(buff,"읽기금지 메인등급 %d 이상  (현재:%d)",cfg.rtype,pf.type);
    if (mode=='w'&&cfg.wtype>pf.type ) sprintf(buff,"쓰기금지 메인등급 %d 이상  (현재:%d)",cfg.wtype,pf.type);
    if (mode=='d'&&cfg.dtype>pf.type ) sprintf(buff,"다운금지 메인등급 %d 이상  (현재:%d)",cfg.dtype,pf.type);

    if (mode=='i'&&bcfg.itype>pf.type ) sprintf(buff,"진입금지 메인등급 %d 이상  (현재:%d)",bcfg.itype,pf.type);
    if (mode=='r'&&bcfg.rtype>pf.type ) sprintf(buff,"읽기금지 메인등급 %d 이상  (현재:%d)",bcfg.rtype,pf.type);
    if (mode=='w'&&bcfg.wtype>pf.type ) sprintf(buff,"쓰기금지 메인등급 %d 이상  (현재:%d)",bcfg.wtype,pf.type);
    if (mode=='d'&&bcfg.dtype>pf.type ) sprintf(buff,"다운금지 메인등급 %d 이상  (현재:%d)",bcfg.dtype,pf.type);

    if (strlen(buff)) {
        mess(buff);
		if (mode=='i') go_top(1);       //동호회의 처음가기명령
		return Yes;
	}
	return No;

    fail_enter:
    view(buff);
    go_prev();
    return Yes;

}

//현재의 아이디는 현재의 게시판을 삭제,이동 가능한가?
check_del()
{
	if (now_type>14||pf.type>14||
       strcmp(bbs.id,pf.id)==0||            //자기가 쓴 게시판의 경우
       (bcfg.use_hide&&strcmp(bbs.tid,pf.id)==0)||            //자기가 쓴 게시판의 경우
       bbs_man(pf.id))    return Yes; //게시판의 담당자의 경우
	return No;
}


//현재의 아이디는 현재의 게시판을 삭제,이동 가능한가?
check_del2()
{
    if (now_type>=14||
        pf.type>=14||
        is_same2(ccfg.sysop,pf.id)||
        is_same2(ccfg.sysop1,pf.id)||
        is_same2(ccfg.sysop2,pf.id)||
        is_same2(ccfg.sysop3,pf.id)||
        is_same2(bcfg.sysop,pf.id)||
        is_same2(bcfg.sysop1,pf.id)||
        is_same2(bcfg.sysop2,pf.id)||
        is_same2(bcfg.sysop3,pf.id)||
        is_same2(bbs.id,pf.id)||            //자기가 쓴 게시판의 경우
        bbs_man(pf.id))    return Yes; //게시판의 담당자의 경우
    return No;
}



//단축명령키 지정
check_short(int mode,char *buffstr)
{
	FILE *fp,*fp2;
	char abuff[5][70];
	char kbuff[100][11];
	char sbuff[100][51];
	char buff[250],buff1[250],buff2[100],buff3[100],buff4[100];
	char filename[200];
	int i,i2,found=No;

	if (mode!=0&&strlen(buffstr)<2) return No;
	sscanf(buffstr,"%s",buff1);
	del_space(buff1);
	if (mode!=0&&strlen(buff1)>1) {
		if (stristr("lt li ln lk le lg lu lsc lsl lst",buff1)) return No;
		if (stristr("pf say to mm",buff1)) return No;
	}

	if (mode==2) sprintf(filename,"userdata/%s/%s/pfinfo.sho",c_han(pf.id),pf.id);
	else		 strcpy(filename,"system/shortcmd.dat");
	if((fp=fopen(filename,"r"))==NULL) return No;

	for (i=0;i<100;i++) strcpy(kbuff[i],"");
	for (i=0;i<100;i++) strcpy(sbuff[i],"");
	i=0;
	while (fgets(buff,200,fp)&&i<100) {
		if (buff[0]==0) break;
		if (buff[0]=='#') continue;
		strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");strcpy(buff4,"");
		sscanf(buff,"%s%s%s%s",&buff1,&buff2,&buff3,&buff4);
		sprintf(buff,"%s %s %s",buff2,buff3,buff4);
		strcpy(kbuff[i],buff1);
		strcpy(sbuff[i],buff);
		i++;
	}
	if (fp!=NULL) fclose(fp);

	if (mode==0) {
		if((fp2=fopen(TMP_FILE,"w"))==NULL) return No;
		fprintf(fp2,"%20s   한글 명령어 리스트\n",cfg.hostname);

		for (i=0;i<100&&kbuff[i][0]!=0;i++) {
			fprintf(fp2,"%10s -> %-25s ",kbuff[i],sbuff[i]);
			if (i%2==1) fprintf(fp2,"\n");
		}

		re_print=Yes;
		if (fp2!=NULL) fclose(fp2);
		cls();
		view_text(TMP_FILE);
		return No;
	}

	strcpy(abuff[0],"");strcpy(abuff[1],"");strcpy(abuff[2],"");strcpy(abuff[3],"");strcpy(abuff[4],"");
	sscanf(buffstr,"%s%s%s%s%s",abuff[0],abuff[1],abuff[2],abuff[3],abuff[4]);
	for (i=0;i<5;i++) {
		for (i2=0;abuff[i][0]!=0&&i2<100;i2++) {
			if (is_same(abuff[i],kbuff[i2])) {
				strcpy(abuff[i],sbuff[i2]);
				found=Yes;
			}
		}
	}
	if (found) sprintf(buffstr,"%s %s %s %s %s",abuff[0],abuff[1],abuff[2],abuff[3],abuff[4]);
	return found;
}


check_samemoni()		//동시접속파악
{
	FILE *fp;
	MONI moni2;
    char buff[300],buff2[20],filename[100];
    int n,count=0;
    if (pf.type<=13) return;
    strcpy(buff,"");
    for (n=0;n<cfg.count_server;n++) {
        sprintf(filename,"user/moni/moni%d.dat",n);
        if ((fp=fopen(filename, "r"))==NULL) continue;
        while (fread(&moni2,sizeof_moni,1,fp)) {
            if (moni2.mode>0&&strlen(moni2.tty)>0&&is_same2(moni2.id,pf.id)) {
				count++;
                sprintf(buff2,"%s(%d) ",moni2.tty,moni2.hostno);
                strcat(buff,buff2);
			}
        }
        fclose(fp);
	}
    if (count>1&&!bit(cfg.mode,7)) {
        printf(" ##동시접속:%s##\n",buff);
        if (is_same(go.code,"top")&&pf.type<cfg.relog) {
            mess("동시접속으로 접속이 종료됩니다.");
            host_end();
        }
    }
}


