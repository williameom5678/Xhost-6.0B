//////////////////////////////////////////////////////////////////////
// ½Ã½ºÅÛ °ü¸®¿¡ °ü°èµÇ´Â Æ¯º°ÇÑ ÀÛ¾÷µé
//////////////////////////////////////////////////////////////////////
#include "bbs.h"
#include <unistd.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä
#include <dirent.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä

sys_menu(char *buffstr)
{
	char buff[200],buff1[200],buff2[200],buff3[200],buff4[200];
	char tid2[9];
	char filename[200];
	char cmd[100];
	SYSCMD syscmd[30];		  //Æ¯º° È¯°æÈ­ÀÏ
	FILE *fp;
	int i,n;
	char old_now_type=now_type;
	PF pf3,old_pf;
	GO old_club_go,old_go;
	char old_club_mode=club_mode;
	strcpy(cmd,mmc[0]);
	strcpy(tid2,mmc[1]);
	re_print=Yes;

	old_pf=pf;
	old_club_go=club_go;
	old_go=go;
	if (pf.type<1) {mess("µî±ÞºÎÁ·");return;}      //±âº»È¸¿øÀÌ»óÀÏ¶§
	strcpy(filename,"system/syscmd.dat");
	if ((fp=fopen(filename,"r"))==NULL) {mess("%s Error",filename);return;}
	for (i=0;i<30;i++) fread(&syscmd[i],sizeof(syscmd[0]),1,fp);
	fclose(fp);
	//¾ÏÈ£¿©ºÎ
	for (i=0;i<30;i++) {
		del_space(syscmd[i].cm2);del_space(syscmd[i].cmd);
		if (is_same(cmd,syscmd[i].cmd)||is_same(cmd,syscmd[i].cm2)) {
			strcpy(cmd,syscmd[i].cmd); //Á¦2¸íÀÏ°æ¿ì 1¸í·ÉÀ¸·Î º¯È¯
			if (pf.type<syscmd[i].type) {
				mess("%s¸í·ÉÀ» »ç¿ëÇÒ¼ö ¾ø´Â µî±ÞÀÔ´Ï´Ù.",cmd);
				return;
			}
			if (!check_sys_pass(i)) return;
			break;
		}
	}
	set_stat(19,mmc[0]);	//ÀÛ¾÷
		 if (is_same(cmd,syscmd[0].cmd)||is_same(cmd,".sys")||is_same(cmd,".s")) do_sysop();
	else if (is_same(cmd,".."))                  help_sys_menu();     //¿î¿µÁø µµ¿ò¸»
	else if (pf.type>=18&&stristr(cmd,".proc")) {
		strchng2(cmd,".","");
		sprintf(buff,"system/c_%s.tag",cmd);
		if (is_file(buff)) {unlink(buff);mess("%s ÆÄÀÏ »èÁ¦ (ÀçÁ¢¼Ó½Ãµ¿ÀÛµÊ)",buff);}
		else			   {touch_file(buff);mess("%s ÆÄÀÏ »ý¼º (ÀçÁ¢¼Ó½Ãµ¿ÀÛµÊ)",buff);}
	}
	else if (pf.type>10&&(is_same(mmc[0],".lo")||is_same(mmc[0],".lo1"))) allmode=gtt_bit(allmode,10);
	else if (pf.type>10&&is_same(mmc[0],".lo2")) allmode=gtt_bit(allmode,11);
	else if (pf.type>10&&is_same(mmc[0],".lo3")) allmode=gtt_bit(allmode,12);
	else if (bbs_man(pf.id)&&is_same(cmd,".notre")) xedit2("%s/logo/all.nre",club_go.dir);
	else if (bbs_man(pf.id)&&is_same(cmd,".notre2")) xedit2("%s/logo/%s.nre",club_go.dir,go.code);
	else if (bbs_man(pf.id)&&is_same(cmd,".notwr")) xedit2("%s/logo/all.nwr",club_go.dir);
	else if (bbs_man(pf.id)&&is_same(cmd,".notwr2")) xedit2("%s/logo/%s.nwr",club_go.dir,go.code);
	else if (bbs_man(pf.id)&&is_same(cmd,".notup")) xedit2("%s/logo/all.nup",club_go.dir);
	else if (bbs_man(pf.id)&&is_same(cmd,".notup2")) xedit2("%s/logo/%s.nup",club_go.dir,go.code);
	else if (bbs_man(pf.id)&&is_same(cmd,".notdn")) xedit2("%s/logo/all.ndn",club_go.dir);
	else if (bbs_man(pf.id)&&is_same(cmd,".notdn2")) xedit2("%s/logo/%s.ndn",club_go.dir,go.code);
	else if (is_same(cmd,".clog")&&(pf.type>=15||now_type>=14))  sys_tem("bin/viewlog 8 '%s' '%s'",pf.id,club_go.code);
    else if (is_same(cmd,".txt")&&(pf.type>=17||(club_mode&&now_type>=17)||bbs_man(pf.id))) sys_tem("bin/txt2bbs '%s' '%s' '%s'",club_go.code,go.code,pf.id);
	else if (is_same(cmd,".news")) sys_tem("rm -rf tmp/news/");
	else if (is_same(cmd,".port")) sys_tem("bin/viewlog 5 '%s' '%s'",pf.id,club_go.code);
	else if (pf.type>15&&is_same(cmd,".set")) {cls();sys_tem("set");pressenter();}
	else if (is_same(cmd,".xmessd")) {
		printf(" xmessd Ã³¸® Å×½ºÆ®(ÀúÀå¾ÈµÊ) :%s\n",rbit(cfg.messmode,7,"tty»ç¿ë", "xmessd»ç¿ë"));
		cfg.messmode=set_bit(cfg.messmode,7,!yesno2("tty»ç¿ë(Y)  xmessd»ç¿ë(N) >>",Yes));
		sprintf(buff," HOST:%d TTY:%s ¸Þ¼¼ÁöÀü¼Û Å×½ºÆ® (%s)",cfg.hostno,tty,rbit(cfg.messmode,7,"tty", "xmessd"));
		to_tty2(cfg.hostno,tty,buff);
		fflush(NULL);
		pressenter();
	}
	else if (pf.type>=16&&is_same(cmd,".sm") )      xedit2("system/sysmess.txt");
	else if (pf.type>=16&&is_same(cmd,".sm1"))      xedit2("system/sysmess1.txt");
	else if (pf.type>=16&&is_same(cmd,".sm2"))      xedit2("system/sysmess2.txt");
	else if (pf.type>=18&&is_same(cmd,".pass"))     sys_change_passwd();
	else if (pf.type>=18&&is_same(cmd,syscmd[21].cmd))	do_shell();
	else if (pf.type>=18&&is_same(cmd,".time"))     system("bin/setdate");
	else if (pf.type>=18&&is_same(cmd,".epass"))    {sprintf(buff,"user/epass/%s.lst",now_str(12));view_text(buff);}
	else if (pf.type>=19&&is_same(cmd,".fcode"))    system("freecode/freemake");
	else if (pf.type>=18&&is_same(cmd,".freem"))    {system("free");pressenter();}
    else if (pf.type>=18&&is_same(cmd,".conv1"))    {re_print=Yes;sys_tem("bin/txt2bbs '%s' '%s' '%s' __conv1",club_go.code,go.code,pf.id);}
    else if (pf.type>=18&&is_same(cmd,".limit"))    set_limit();
	else if (pf.type>=18&&(
		is_same(cmd,".ps")||
		is_same(cmd,".who")||
		is_same(cmd,".netstat"))) {
		if (is_same(cmd,".ps")) sprintf(buff,"ps aux  > %s",TMP_FILE);
		if (is_same(cmd,".who")) sprintf(buff,"who -T    > %s",TMP_FILE);
		if (is_same(cmd,".netstat")) sprintf(buff,"netstat -r > %s",TMP_FILE);
		sys_tem(buff);
		view_text(TMP_FILE);
		unlink(TMP_FILE);
	}
	else if (pf.type>=18&&is_same(cmd,".touch"))  {
		if (is_char(BBSTYPE,go.type)) {
			sprintf(buff,"touch %s",NOW_FILE);sys_tem(buff);
			sprintf(buff,"touch %s",NOW_FILED);sys_tem(buff);
			mess("%s È­ÀÏÀÌ ¸¸µé¾î Á³½À´Ï´Ù.",NOW_FILE);
		}
	}
	else if (pf.type>=14&&is_same(cmd,syscmd[23].cmd)) {
		if (!is_char(BBSTYPE,go.type)) mess("°Ô½ÃÆÇ/ÀÚ·á½Ç¿¡¼­ »ç¿ëÇÏ´Â ¸í·ÉÀÔ´Ï´Ù.");
		else sys_tem("bin/bbscopy '%s' '%s' '%s'",go.code,club_go.code,pf.id);
	}
	else if (is_same(cmd,syscmd[2].cmd))   do_bsysop();
	else if (is_same(cmd,".datestr")) sys_tem("bin/xfrm datestr");
	else if (is_same(cmd,syscmd[5].cmd)&&(pf.type>=16||now_type>17)) sys_tem("bin/xfrm '%s' '%s' '%s' 1",club_go.code,go.code,pf.id);
	else if (is_same(cmd,syscmd[15].cmd)&&(pf.type>=16||now_type>17)) sys_tem("bin/xfrm '%s' '%s' '%s' 2",club_go.code,go.code,pf.id);
	else if (is_same(cmd,syscmd[6].cmd)&&((!club_mode&&pf.type>16)||(club_mode&&now_type>16))) sys_tem("bin/xfrm '%s' '%s' '%s' 3",club_go.code,go.code,pf.id);
	else if (is_same(cmd,syscmd[12].cmd)&&((!club_mode&&pf.type>16)||(club_mode&&now_type>16)||in_file2("system/syswarn.id",pf.id)))
		sys_tem("bin/set_warn '%s' '%s'",pf.id,club_go.code);
	else if (is_same(cmd,syscmd[16].cmd)) sys_tem("bin/viewlog 1 '%s' '%s'",tid2,club_go.code);
	else if (is_same(cmd,syscmd[3].cmd)) sys_tem("bin/viewlog 2 '%s' '%s'",pf.id,club_go.code);
	else if (is_same(cmd,syscmd[17].cmd)) sys_tem("bin/viewlog 3 '%s' '%s'",pf.id,club_go.code);
	else if (is_same(cmd,syscmd[7].cmd)) sys_tem("bin/ed_lev %s",pf.id);
	else if (is_same(cmd,syscmd[4].cmd)&&(pf.type>=16||(club_mode&&cpf.type>=17)))	 {
		if (!club_mode&&pf.type<18&&!in_file2("system/sysmenu.id",pf.id)) {
			mess("¸ÞÀÎ ¸Þ´ºÆíÁý°¡´É ID°¡ ¾Æ´Õ´Ï´Ù.");
			return;
		}
		sys_tem("bin/ed_menu '%s' '%s'",club_go.code,pf.id);
		re_flash();
		re_bbs=Yes;
	}
	else if (is_same(cmd,syscmd[11].cmd)) kill_tty_port();	 //ÇØ´ç Æ÷Æ® Á×ÀÌ±â
	else if (is_same(cmd,syscmd[13].cmd)) say_wall(1);	  //ÀüÃ¼°­Á¦¸Þ¼¼Áö
	else if (pf.type>=19&&is_same(cmd,syscmd[18].cmd)){
		//´Ù¸¥ È¸¿øÀÇ ¾ÆÀÌµð·Î ¹Ù·Î°¨
		pf3=pf;
		if (strlen(mmc[1])>2) strcpy(buff,mmc[1]);
		else {
			printf("\n Ä¡È¯ÇÒ È¸¿øÀÇ ¾ÆÀÌµð¸¦ ÀÔ·ÂÇÏ¼¼¿ä.  >>");
			lineinput(buff,8);printf("\n");
		}
        if (strlen(buff)>2&&read_pf2(buff)) {
			del_stat(tty);			 //»óÅÂ±â·Ï È­ÀÏ ÇØ´ç Æ÷Æ®ÀÇ Á¢¼ÓÀ» ÇØÁ¦ÇÑ´Ù.
			pf=pf2;
			time(&pf.login);			   //Á¢¼Ó ½Ã°£ Àû±â
			mess("%s´ÔÀº %s(%s)·Î Ä¡È¯µÇ¾ú½À´Ï´Ù.",pf3.id,pf.id,pf.name);
			return;
		}
        mess("%s ID Ä¡È¯½ÇÆÐ",buff);
	}
	else if (is_same(cmd,syscmd[ 9].cmd)&&(pf.type>=18||in_file2("system/darkman.id",pf.id))) {
		if (dark_mode) dark_mode=No;
		else		   dark_mode=Yes;
	}
	else if (pf.type>=18&&is_same(cmd,syscmd[10].cmd))	{
		if (dark_mode) dark_mode=No;
		if (cfg.count_server==1) system("rm -f user/moni/*.dat");
		else		   {dark_mode=Yes;for (n=0;n<=cfg.count_server;n++) unlink_file("user/moni/moni%d.dat",n);}
	}
	else if (pf.type>=18&&(is_same(cmd,syscmd[19].cmd)||is_same(cmd,syscmd[20].cmd)))  {
		if (strlen(mmc[1])>0) {
			if (is_same(cmd,syscmd[19].cmd)) sprintf(buff2,"logo/%s",mmc[1]);
			else							 sprintf(buff2,"system/%s",mmc[1]);
			xedit(buff2);
		}
		else {
			printf("\n ### TEXT È­ÀÏ¸í >>");
			lineinput(buff,20);check_han(buff);printf("\n");
			if (strlen(buff)>2) {
				if (is_same(cmd,syscmd[19].cmd)) sprintf(buff2,"logo/%s",buff);
				else							 sprintf(buff2,"system/%s",buff);
				xedit(buff2);
			}
		}
	}
	set_stat(1,"");
	re_bbs=Yes;
	re_print=Yes;
	club_go=old_club_go;
	club_mode=old_club_mode;
	pf=old_pf;
	now_type=old_now_type;
	go=old_go;
	read_bcfg();
}


help_sys_menu()
{
	cls();
	printfL2();
	view_text("frm/help/syscmd.hlp");
}


//°Ô½ÃÆÇ ´ã´çÀÚ¿ë ¿î¿ë ¸Þ´º
do_bsysop()
{
	char buff2[80];
	char oldcode[80];

	re_print=Yes;

	//µ¿È£È¸¿î¿µÁø¸¸ Çã¿ë
	if (pf.type<17&&(!is_char(BBSTYPE,go.type))) {
		goto _error_bsysop;
	}
	if (now_type>=17||pf.type>=17||bbs_man(pf.id)) {
		if (pf.type>=16||check_pass(bcfg.passsys,4,"°Ô½ÃÆÇ´ã´ç¸í·É¾ÏÈ£>>")) {
			strcpy(oldcode,go.code);
			if (strlen(mmc[1])>0&&pf.type>=18) strcpy(go.code,mmc[1]);
			set_stat2(19,"bin/bsysop");     //ÀÛ¾÷
			sys_tem("bin/bsysop '%s' '%s' '%s'",go.code,club_go.code,pf.id);
			set_signal();  //½Ã±×³¯ Àç¼³Á¤
			strcpy(go.code,oldcode);
			set_stat(1,"");         //ÀÛ¾÷
		}
	}
	else goto _error_bsysop;
	re_flash();
	return;

	_error_bsysop:
	message("°Ô½ÃÆÇ ¶Ç´Â ÀÚ·á½Ç¿¡¼­ ´ã´çÀÚ°¡ »ç¿ëÇÏ´Â ¸í·ÉÀÔ´Ï´Ù.");
	return;
}


kill_tty_port()
{
	int n;
	char buff[100];
	if (pf.type<18&&!in_file2("system/syskill.id",pf.id)) return;
	if (strlen(mmc[1])<3) {
		printf("\n °­Á¦ Á¢¼Ó Á¾·á½ÃÅ³ ID >>");
		lineinput(buff,8);check_cmd(buff);printf("\n");
		strcpy(mmc[1],mmc[0]);
	}
	if (strlen(mmc[1])>2) {
		for(n=0;n<=cfg.count_server;n++) kill_portid(n,mmc[1],"");
	}
}


sys_change_passwd()
{
	char buff[200];
	if (mmc[1][0]==0) {
		printf("\n ¾ÏÈ£º¯°æ È¸¿ø ¾ÆÀÌµð >>");
		lineinput(buff,8);printf("\n");check_cmd(buff);
	}
	if (mmc[1][0]==0||!read_pf2(mmc[1])) {	   //Ã£À¸¸é pf2¿¡ ³ÖÀ½
		message("ÇØ´çµÇ´Â È¸¿øÀÌ ¾ø½À´Ï´Ù.");
		return;
	}
	if (pf2.type>=18) {
		mess("¼öÁ¤ÇÒ¼ö ¾ø´Â È¸¿øµî±ÞÀÔ´Ï´Ù.");
		return;
	}
	sprintf(buff,"bin/ed_pf %s %s %d 2",pf.id,pf2.id,3);
	sys_tem(buff);
}


do_shell()
{
	int n;
	if (pf.type>17&&in_file2("system/sysshell.id",pf.id)) {
		if (sys_tem("bin/check_sh")==2) {
			set_stat(19,"shell");     //ÀÛ¾÷
			ioctl(0,TCSETA,&termold);	//¿ø·¡ ÅÍ¹Ì³¯ ¸ðµå º¹±¸
			system("/bin/sh");
			ioctl(0,TCSETA,&termall);	//¿ø·¡ ÅÍ¹Ì³¯ ¸ðµå º¹±¸
			set_stat(1,"");
		}
	}
}


say_wall()
{
	FILE *fp;
	char filename[200],buff[3000],buff2[3000],messbuff[3000];
	MONI amoni[1500];
	int i,ii,i2,n,nn;
	int count,found;
	strcpy(filename,"system/wall.msg");
	xedit2(filename);
	cls();
	if (!is_file(filename)) return;
	if ((fp=fopen(filename,"r"))==NULL) return;
	ii=0;
	strcpy(messbuff,"");
	while (strlen(messbuff)<2000&&fgets(buff,200,fp)!=NULL) {
		strcat(messbuff,buff);
	}
	strcat(messbuff,"\n");
	fclose(fp);
	if (strlen(messbuff)<3) return;
	printf("%s",messbuff);
	if (ii<0||!yesno("\n À§ÀÇ ¸Þ¼¼Áö¸¦ Àü¼ÛÇÒ±î¿ä? (Y/n)>>",Yes)) return;


	for (i=0;i<1500;i++) strcpy(amoni[i].id,"");
	count=0;
	for (n=0;n<=cfg.count_server;n++) {
		sprintf(filename,"user/moni/moni%d.dat",n);
		if ((fp=fopen(filename,"r"))==NULL) continue;
		while (count<1500&&fread(&moni,sizeof_moni,1,fp)) {
			if (strlen(moni.tty)==0||strlen(moni.id)<3||moni.mode==0) continue;
			if ((moni.mode==5||moni.mode==6||moni.mode==8||
				  moni.mode==14||moni.mode==16||moni.mode==18||moni.mode==19)) continue;
			found=No;
			for (i=0;i<count;i++) {
				if (strlen(amoni[i].id)>1&&amoni[i].hostno==moni.hostno&&is_same(amoni[i].tty,moni.tty)) {
					found=Yes;
					break;
				}
			}
			if (!found) amoni[count++]=moni;
		}
		fclose(fp);
	}
	for (i=0;i<count;i++) {
		if (amoni[i].mode==3) { //´ëÈ­¹æ
			sprintf(buff,"7[21;1H\n[21;1H%s8",messbuff);
			to_tty(amoni[i].hostno,amoni[i].tty,buff);		//´ëÈ­¹æÀÏ¶§
		}
		else to_tty(amoni[i].hostno,amoni[i].tty,messbuff);
	}
}


re_flash()
{
	char buff[10];
	int old_club_mode=club_mode;
	GO oldclub=club_go;
	if (is_same(mmc[0],"load")) mess("¸Þ´º¿Í ½Ã½ºÅÛ ¼³Á¤ÀÌ ´Ù½Ã ·ÎµåµÇ¾ú½À´Ï´Ù.");
	read_cfg();
	if (read_pf2(pf.id)) pf=pf2;
	strcpy(buff,go.code);
	strcpy(go.code,"");
	re_bbs=Yes;
	re_print=Yes;
	if (old_club_mode) {
		club_mode=Yes;
		club_go=oldclub;
		sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
		go_top(1);
		read_ccfg();
	}
	go_code(buff);
}



check_sys_pass(int num)
{
	FILE *fp;
	char filename[200];
	SYSCMD syscmd[30];		  //Æ¯º° È¯°æÈ­ÀÏ
	char cmd[100];
	int i;
	strcpy(cmd,mmc[0]);
	strcpy(filename,"system/syscmd.dat");
	if ((fp=fopen(filename,"r"))!=NULL) {
		for (i=0;i<30;i++) {
			fread(&syscmd[i],sizeof(syscmd[0]),1,fp);
		}
		fclose(fp);
		//¾ÏÈ£¿©ºÎ
		if (num<30&&strlen(syscmd[num].pass)>0&&
			!check_pass(syscmd[num].pass,8,"SPASS>>")) {
			return No;
		}
	}
	return Yes;
}

set_limit()
{
	int n;
	char filename[11][100];
	strcpy(filename[1],"frm/down/noupmain.log");
	strcpy(filename[2],"frm/down/noupclub.log");
	strcpy(filename[3],"frm/down/nowrmain.log");
	strcpy(filename[4],"frm/down/nowrclub.log");
	strcpy(filename[5],"frm/down/nodnmain.log");
	strcpy(filename[6],"frm/down/nodnclub.log");
	strcpy(filename[7],"frm/down/noinchat.log");
	strcpy(filename[8],"frm/down/noinmail.log");
	strcpy(filename[9],"frm/down/noinclub.log");
	while(1) {
		printf("\n");
		printf("  1. ¸ÞÀÎ   µî·ÏÁ¦ÇÑ   :%s: %s\n",filename[1],nbit(is_file(filename[1]),"¾øÀ½","Á¦ÇÑ"));
		printf("  2. µ¿È£È¸ µî·ÏÁ¦ÇÑ   :%s: %s\n",filename[2],nbit(is_file(filename[2]),"¾øÀ½","Á¦ÇÑ"));
		printf("  3. ¸ÞÀÎ   ¾²±âÁ¦ÇÑ   :%s: %s\n",filename[3],nbit(is_file(filename[3]),"¾øÀ½","Á¦ÇÑ"));
		printf("  4. µ¿È£È¸ ¾²±âÁ¦ÇÑ   :%s: %s\n",filename[4],nbit(is_file(filename[4]),"¾øÀ½","Á¦ÇÑ"));
		printf("  5. ¸ÞÀÎ   ´Ù¿îÁ¦ÇÑ   :%s: %s\n",filename[5],nbit(is_file(filename[5]),"¾øÀ½","Á¦ÇÑ"));
		printf("  6. µ¿È£È¸ ´Ù¿îÁ¦ÇÑ   :%s: %s\n",filename[6],nbit(is_file(filename[6]),"¾øÀ½","Á¦ÇÑ"));
		printf("  7. ´ëÈ­¹æ ÁøÀÔÁ¦ÇÑ   :%s: %s\n",filename[7],nbit(is_file(filename[7]),"¾øÀ½","Á¦ÇÑ"));
		printf("  8. ¸ÞÀÏ   ÁøÀÔÁ¦ÇÑ   :%s: %s\n",filename[8],nbit(is_file(filename[8]),"¾øÀ½","Á¦ÇÑ"));
		printf("  9. µ¿È£È¸ ÁøÀÔÁ¦ÇÑ   :%s: %s\n",filename[9],nbit(is_file(filename[9]),"¾øÀ½","Á¦ÇÑ"));
		printf(" 10. W¾²±â RÀÐ±â D´Ù¿î C´ëÈ­ Sµ¿È£È¸ ±ÝÁö/Á¦ÇÑ(system/limit.id)\n");
		n=numselect();
		if (n<=0) break;
		if (n==1) xedit2(filename[1]);
		if (n==2) xedit2(filename[2]);
		if (n==3) xedit2(filename[3]);
		if (n==4) xedit2(filename[4]);
		if (n==5) xedit2(filename[5]);
		if (n==6) xedit2(filename[6]);
		if (n==7) xedit2(filename[7]);
		if (n==8) xedit2(filename[8]);
		if (n==9) xedit2(filename[9]);
		if (n==10) edit_limit_id_file();
	}
}


edit_limit_id_file()
{
	FILE *fp;
	char filename[300];
	char buff[300],buff1[300],buff2[300],buff3[300];
	check_dir("user/limit");
	strcpy(filename,"user/limit/limit.id");
	xedit2(filename);
	system("rm -f user/limit/limit_*.id");
	if ((fp=fopen(filename,"r"))==NULL) return;
	while(fgets(buff,200,fp)!=NULL) {
		strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");
		sscanf(buff,"%s %s %s",buff1,buff2,buff3);
		if (strlen(buff1)<3) continue;
		sprintf(buff,"%s %s",buff1,buff2);
		sprintf(buff3,"user/limit/limit_%u.id",(word)buff1[0]%255);
		put_line(buff,buff3);
	}
	fclose(fp);
}



