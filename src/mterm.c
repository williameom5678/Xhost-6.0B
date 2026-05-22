#include "bbs.h"

log_out()
{
	int mode;
	FILE *fp;
	go_top(0);
	clear_node();
	rm_tmpup();
    ioctl(0,TCSETA,&termold);   //¿ø·¡ ÅÍ¹Ì³¯ ¸ðµå º¹±¸
	exit(1);
}



set_id_end()	   //ÇØ´ç ¾ÆÀÌµð Á¢¼Ó±â·Ï Á¾°á
{
	int n;
    if (!guest_mode) {         //-> pf2¿¡ ÀúÀå
        MYSQL     *sock,mysql;
        MYSQL_RES *qres;
        MYSQL_ROW qrow;
        char query[500];
        time(&pf.logout);                      //Á¾°á½Ã°£ ¼¼ÆÃ
		n=how_old(START_TIME);
        sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
        mysql_select_db(sock,DB_NAME);
        sprintf(query,"update user set
            all_time=all_time+'%d',month_time=month_time+'%d',logout='%s'
            WHERE id='%s'",
            n,n,datestr(19,pf.logout),
            pf.id);
        mysql_query(sock, query);
        //printf("%s %s",query,mysql_error(&mysql));
        mysql_close(sock);
	}
	club_mode=No;strcpy(club_go.code,"main");
	unlink(TMP_FILE);
	unlink(TMP_FILE1);
	unlink(TMP_FILE2);
	unlink(LT_FILE);
}


rawmode()
{
	struct termio tdes;
	ioctl(0,TCGETA,&tdes);	 //ÇöÀç ÅÍ¹Ì³¯ ¸ðµå¸¦ ÀÐ¾î¿Â´Ù
    if (!is_file("term.off")) {
        tdes.c_iflag = 0;
        tdes.c_iflag |= ICRNL ;
        tdes.c_iflag |= IXON ;
        tdes.c_oflag = 0;
        tdes.c_oflag |= OPOST ;
        tdes.c_oflag |= ONLCR ;
        tdes.c_cflag |= CRTSCTS ;
        tdes.c_cflag |= HUPCL ;
        tdes.c_lflag = 0;
        tdes.c_lflag |= IEXTEN;
        tdes.c_cc[VMIN]=1;
        tdes.c_cc[VTIME]=0;
    }
	ioctl(0,TCSETA,&tdes);	 //ÇöÀç ÅÍ¹Ì³¯ ¸ðµå¸¦ ÀúÀåÇÑ´Ù.
}



log_endset()	 //Á¢¼ÓÁ¾·áÃ³¸®
{
	char buff[100];
	sys_tem("rm tmp/up*%d%s -rf",cfg.hostno,no_spc(tty));
	sys_tem("rm tmp/tmp*%d%s -rf",cfg.hostno,no_spc(tty));
    unlink_file("user/moni/user.%d.%s",cfg.hostno,no_spc(tty));
	set_id_end();		 //ÇØ´ç ¾ÆÀÌµð Á¢¼Ó±â·Ï Á¾°á
	if (!bit(allmode,27)) ioctl(0,TCSETA,&termold);   //¿ø·¡ ÅÍ¹Ì³¯ ¸ðµå º¹±¸
}

log_rc(int mode)
{
	char buff[100];
	log_endset();	  //Á¢¼ÓÁ¾·áÃ³¸®
	if (!guest_mode&&mode==1) { 	//¾ÆÀÌµðº¯°æ¾ø´Â ÀçÁ¢¼Ó
		sprintf(buff,"tmp/direct.%s",no_spc(tty));
		put_line(pf.id,buff);
	}

	if (bit(allmode2,11)&&is_file("bin/xmain2")) execl("bin/xmain2","xmain2",NULL);
	if (bit(allmode2,12)&&is_file("bin/xmain1")) execl("bin/xmain1","xmain1",NULL);
	if (bit(allmode2,13)&&is_file("bin/xmain" )) execl("bin/xmain","xmain",NULL);
	execl("bin/main","main",NULL);
}

log_exec(int mode,char *buffcmd)
{
	char dir[200];
	char buff[200];
	char buff1[200];
	char buff2[200];
	strcpy(buff,buffcmd);del_space(buff);del_esc3(buff);
	if (strlen(buff)<1) return;
	if (stristr(buff,"/bin/main"));
	else if (stristr(buff,"/bin/bbs"));
	else if (stristr(buff,"/bin/start"));
	else if (stristr(buff,"/bin/")) return;
	else if (stristr(buff,"/sbin/")) return;
	file_dir(buff,dir,buff1);
//	  printf("*%s*%s*%s",buff,buff1,buff2);pressenter();
	sprintf(buff2,"-l%s",pf.id);
	log_endset();	  //Á¢¼ÓÁ¾·áÃ³¸®
	if (stristr(go.wtimes,"ex")&&stristr(go.wtimes,"j")) chdir(dir);
	if (mode==1) execl(buff,buff1,buff2,NULL);
	if (mode==2) execl(buff,buff1,club_go.code,go.code,pf.id,pf.name,NULL);
	if (mode==3) execl(buff,buff1,pf.id,pf.name,NULL);
	if (mode==9) execl(buff,buff1,NULL);
	execl(buffcmd,buff1,NULL);
}


void sig_handler(int signo)
{
	char buff[200];
	char ttyfile[100];
	char *ttyname();
    int n,nokey,time_tty;
	struct stat stbuf;
	struct utimebuf timestamp,*times=&timestamp;
    nokey=(int)pf.offmin*60;
    if (how_old(START_TIME)>6*10&&is_file("tmp/stop%d%s.tmp",cfg.hostno,no_spc(tty))) {
        unlink_file("tmp/stop%d%s.tmp",cfg.hostno,no_spc(tty));
        host_end();
	}
    if (nokey<1) nokey=(int)cfg.waitkey*60;
	if (bit(cfg.mode,28)) return;
    if (nokey<1) nokey=5*60;
	if (signo==SIGALRM) {
		set_alarm(0);
		sprintf(ttyfile,ttyname(1));
		if (stat(ttyfile,&stbuf)==-1) {
			host_end();
			return;
		}
		time_tty=how_old(stbuf.st_mtime);
        if (time_tty<1) return;
		times->actime =stbuf.st_atime;
		times->modtime=stbuf.st_mtime;

		disp_timelogo();
        if (bit(allmode,13)) nokey=0;
        if (nokey>0&&ascr_count%6==1) {
            if (time_tty>nokey) {
				if (bit(allmode,6)) {
					kill(getpid(),SIGKILL);
					return;
				}
                sprintf(g_buff4,"%d",(int)(nokey/60));
                view("forum/main/frm/system/nokey2.log");
				sleep(1);
				utime(ttyfile,times);
				nostop=Yes;
				allmode=set_bit(allmode,6,1);  //KILLÁß..
				kill(getpid(),SIGHUP);
				set_alarm(1);
				utime(ttyfile,times);
				return;
			}
            if (nokey>60&&time_tty>(nokey-60)) {
				allmode=set_bit(allmode,17,1);
                view("forum/main/frm/system/nokey1.log");
			}
		}
//        printf("nokey:%d time_tty:%d\n",nokey,time_tty);
		utime(ttyfile,times);
	}
	ascr_count++;
	set_alarm(1);
}



disp_timelogo()
{
	char filename[200];
	if (!bit(allmode,15)||!bit(allmode,16)||bit(pf.mymode,21)) return;
	if (!club_mode&&!bit(cfg.logomode,3)) return;
    if (club_mode&&!ccfg.timelogo) return;
	if (!bit(cfg.logomode,4)&&bit(pf.mymode,8)) return;  //setani
	sprintf(filename,"%s/logo/%s.ta%d",club_go.dir,go.code,ascr_count%10);
	if (is_file(filename)) {
		printf("[s");fflush(NULL);
		view(filename);
		printf("[u");fflush(NULL);
	}
}


//Á¢¼Ó³¡ Ã³¸®
host_end()
{
	char ttyfile[300];
	struct stat stbuf;
	if (bit(allmode,31)) exit(1);	 //ÀÌ¹Ì Á¾·áÃ³¸®Áß

	if (is_same(tty,"www")) return;
	sprintf(ttyfile,"/dev/%s",tty);
	if (stat(ttyfile,&stbuf)==-1) goto _cont1;

	allmode=set_bit(allmode,31,1);	 //Á¾·áÃ³¸®Áß¼¼ÆÃ
	if (!is_same(auto_cmd,"x")&&bit(cfg.startmode,17)) goto _cont1;
	printf("[01;40r");
	cls();
	if (!bit(cfg.infomode,8)) {
		if (!bit(cfg.logomode,22)) {	  //Á¾·áÈ­¸é¹«½Ã
            view("forum/main/frm/end/endhost.log");
            view("forum/main/frm/end/endhost.%d",rand()%100);
            view("forum/main/frm/end/endhost.bye");
		}
	}

	_cont1:
	set_id_end();		   //ÇØ´ç ¾ÆÀÌµð Á¢¼Ó±â·Ï Á¾°á
    unlink_file("user/moni/user.%d.%s",cfg.hostno,no_spc(tty));
	fflush(NULL);
	log_out();
}


endhost_ok()
{
	char buff[200];
	re_print=Yes;
	if (bit(cfg.infomode,8)) host_end();
	if (bit(cfg.mode,6)) host_end();
	else {
        view("forum/main/frm/end/endok.log");
        view("forum/main/frm/end/endok.%d",rand()%10);
        view("forum/main/frm/end/endok.cmd");
		lineinput(buff,40);check_han(buff);printf("\n");
        if (is_same(cfg.hostname,"AKOM")) {
            if (is_same(buff,"y")) host_end();
            else strcpy(auto_cmd,buff);
		}
        else {
            if (is_same(buff,"y")||strlen(buff)<1) host_end();
            else strcpy(auto_cmd,buff);
        }
	}
}


log_in()
{
	char buff[250],buff2[80];
    ioctl(0,TCGETA, &termold);
	umask(0111);
	ioctl(0, TCGETA, &termnew);
	rawmode();	// ³Í Ä³³ë´ÏÄ® ¸ðµå
	ioctl(0, TCGETA, &termall);
	umask(0111);

	cfg.waitkey=5;
	cfg.hostno=0;
    sprintf(buff,"chmod 777 /dev/%s",tty);system(buff);
    set_signal();
	netmode=0;					//ÀüÃ¼¸ðµå
	ascr_count=0;
	mymoni_rec=0;
	autoup=No;
	strcpy(club_go.code,"main");             //µ¿È£È¸°¡±âÄÚµå
	strcpy(club_go.dir,".");
    if (bit(allmode,12)) mess("read_aname");
	read_aname();				//È¸¿øÁ¤º¸ ÇÊµåÀÐ±â
    if (bit(allmode,12)) mess("read_abbsname");
	read_abbsname();			//°Ô½ÃÆÇÁ¤º¸ ÇÊµåÀÐ±â

	time(&START_TIME);			//Á¢¼Ó½ÃÀÛ½Ã°£
	time(&CLUB_START_TIME); 	//Á¢¼Ó½ÃÀÛ½Ã°£
	time(&CHECK_TIME);			//Á¢¼Ó½ÃÀÛ½Ã°£
	time(&pf.login);			//Á¢¼Ó½ÃÀÛ½Ã°£
	strcpy(pf.id,"Á¢¼ÓÁß");
	strcpy(pf.name,"Á¢¼ÓÁß");
    if (bit(allmode,12)) mess("read_cfg");
	read_cfg(); 				//config ÀÐ±â
    read_ccfg();                //config ÀÐ±â(¸ÞÀÎµ¿È£È¸)
	set_tmpfile();
    set_alarm(0);
    set_alarm(1);

	srand(time(NULL));			//³­¼öÀÇ ÃÊ±âÈ­
	now_cmd_num=rand()%20;		//ÇöÀçÀÇ µµ¿ò¸» ¹øÈ£
	printf("[1;50r[;H");
	setenv("TERM","vt220",1);
    unlink_file("user/moni/user.%d.%s",cfg.hostno,no_spc(tty));
	guest_mode=Yes;
	club_mode=No;
	re_print=Yes;			//È­¸éÃâ·Â
	re_logo=Yes;			//º¸Á¶È­¸éÃâ·Â
	re_bbs=Yes; 			//°Ô½ÃÆÇ·Îµù
	re_club=No; 			//µ¿È£È¸ÃÊ±âÈ­
	p_command=No;			//¸¶Áö¸· ÀÔ·ÂÀÌ PÀÎ°¡?
	list_mode=No;			//ÇöÀç ¹øÈ£ ¼±ÅÃ¸ðµå
	dark_mode=0;			//½Ã»ð°¨Ãã ¸ðµå 1:ÀÏ¶§
	now_type=0; 				//µ¿È£È¸ÀÇ µî±ÞÇ¥½Ã
	strcpy(auto_cmd,"");    //¼Õ´ÔÀÏ¶§
	N_page=0;
    if (bit(allmode,12)) mess("go_top");
    strcpy(last_club,club_go.code);
	go_top(0);
	strcpy(go.name,"¾ÆÀÌµðÀÔ·ÂÁß");
	sprintf(moni.goname,"%-20.20s",go.name);
	set_stat(23,"Á¢¼ÓÁß");
	g_yes=No;
	sys_tem("rm -f tmp/tmp*%d%s",cfg.hostno,no_spc(tty));   //È£½ºÆ®¹øÈ£º°ÀÓ½ÃÈ­ÀÏ
	sys_tem("rm -rf tmp/up%d%s" ,cfg.hostno,no_spc(tty));   //È£½ºÆ®¹øÈ£º°ÀÓ½ÃÈ­ÀÏ
}


set_signal()
{
    if (is_file("term.off")) return;
	signal(SIGQUIT, SIG_IGN);
	signal(SIGINT, SIG_IGN);
	signal(SIGTERM, SIG_IGN);
	signal(SIGHUP, (__sighandler_t)host_end);
	signal(SIGSEGV,(__sighandler_t)host_end);
	signal(SIGBUS, (__sighandler_t)host_end);
	signal(SIGCLD,SIG_IGN);
	signal(SIGCHLD,SIG_IGN);
	signal(SIGPIPE,SIG_IGN);
	signal(SIGURG,SIG_IGN);
	signal(SIGTSTP,SIG_IGN);
	signal(SIGTTIN,SIG_IGN);
	signal(SIGTTOU,SIG_IGN);
	signal(SIGPWR,(__sighandler_t)host_end);
	signal(SIGSTOP,SIG_IGN);
	signal(SIGWINCH,SIG_IGN);
	signal(SIGXCPU,SIG_IGN);
	signal(SIGXFSZ,(__sighandler_t)host_end);
	signal(SIGVTALRM,SIG_IGN);
	signal(SIGALRM,SIG_IGN);
    set_alarm(1);
}

set_alarm(int mode)
{
	if (mode) {
		alarm(0);
		alarm(cfg.alarm_time);
		signal(SIGALRM,sig_handler);
	}
	else {
		alarm(0);
		signal(SIGALRM,SIG_IGN);
		alarm(0);
	}
}


//Æ¯Á¤Æ÷Æ®¶Ç´Â ID¸¦ kill ÇÔ
kill_portid(int hostno,char *tid,char *tty)
{
	FILE *fp,*fp2;
	char buff[300],buff2[300],filename[100];
	int i,ii,n,pid=getpid(),found=No;
	del_space(tty);
	if (cfg.count_server==1) hostno=cfg.hostno;
	sprintf(filename,"user/moni/moni%d.dat",hostno);
	if ((fp=fopen(filename, "r+"))==NULL) return No;
	ii=-1;
	while (1) {
		ii++;
		fseek(fp,ii*sizeof_moni,SEEK_SET);
		if (!fread(&moni,sizeof_moni,1,fp)) break;
		if (cfg.count_server==1) moni.hostno=cfg.hostno;
		del_space(moni.tty);del_space(moni.id);

		if (moni.hostno!=cfg.hostno) continue;
		if (moni.hostno==cfg.hostno&&moni.pid==pid) continue;
		if (moni.mode<1||strlen(moni.tty)<1) goto _delete;
		if (moni.pid<100) goto _delete;
		if ((strlen(tty)>0&&is_same(moni.tty,tty))||
			(strlen(tid)>0&&is_same(moni.id ,tid))) {
			sprintf(buff,"\n ## »ç¿ëÀÚÀÇ ¿ä±¸·Î º»Á¢¼ÓÀº ÇØÁ¦µË´Ï´Ù.##\n");
			to_tty(moni.hostno,moni.tty,buff);
			if (cfg.count_server==1||moni.hostno==cfg.hostno) {
				kill(moni.pid,SIGHUP);
			}
			else {
				sprintf(buff,"KK%d",moni.pid);
				svr_send(moni.hostno,buff,"killtty");
			}
			found=Yes;
			sys_tem("touch tmp/stop%d%s.tmp",moni.hostno,no_spc(moni.tty));
			_delete:
			fseek(fp,ii*sizeof_moni,SEEK_SET);
			moni.mode=0;strcpy(moni.tty,"");strcpy(moni.id,"");
			fwrite(&moni,sizeof_moni,1,fp);
		}
	}
	fclose(fp);
	return found;
}


//mode==0 : ·Î±×ÀÎ 1:Á¢¼Ó
save_login(int mode)
{
	char filename[300];
	char buff[300],buff2[300];
	if (mode==1) sprintf(buff,"STA %4d %s",0,hostname);
	else		 sprintf(buff,"END %4d ...",how_old(START_TIME)/60);
	sprintf(filename,"%s/time%s.txt",REC_DIR,now_str(12));
	sprintf(buff2,"%s %3d %-8s %s",now_str(3),cfg.hostno,pf.id,buff);
	put_line(buff2,filename);
}


//³ëµåÀÇ ÃÊ±âÈ­ ÀÛ¾÷À» ÇÑ´Ù.
clear_node()
{
	char buff[80];
	set_tmpfile();
	unlink(TMP_FILE);
	unlink(TMP_FILE1);
	unlink(TMP_FILE2);
	unlink(LT_FILE);
}
