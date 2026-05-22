////////////////////////////////////////////////////////////////////////
// XHOST: ¸®´ª½º¿ë BBS HOST  °³¹ß:±è¼º´ë(053-964-1002) BBS:XHOST.CO.KR
// ³»¿ë : ¸ÞÀÎ ÇÁ·Î±×·¥ main.c
////////////////////////////////////////////////////////////////////////
#include "bbs.h"

main(int argc, char **argv)
{
	char buff[250],buff2[80];
	int i,n,stay_count=0;
    allmode=allmode2=0;                  //ÀüÃ¼¸ðµå
	if (is_file("tag.lo1"))   allmode=set_bit(allmode,10,1);
	if (is_file("tag.lo2"))   allmode=set_bit(allmode,11,1);
	if (is_file("tag.lo3"))   allmode=set_bit(allmode,12,1);
    if (bit(allmode,12)) mess("read_db");
    findport(tty); //Á¢¼ÓÆ÷Æ® Ã£±â
	strcpy(buff2,argv[0]);
	pure_name(2,buff2);   //È­ÀÏ¸í¿¡¼­ È®ÀåÀÚ Á¦¿Ü »Ì¾Æ³¿
	if (strlen(buff2)<1) {
		strcpy(buff2,argv[0]);
		pure_name(0,buff2);   //È­ÀÏ¸í¿¡¼­ È®ÀåÀÚ Á¦¿Ü »Ì¾Æ³¿
	}
	n=0;
	strcpy(db_name,DB_NAME);
	strchng2(buff2,"-bbs","bbs");

	if (argc>1&&is_same(argv[1],"/ver")) {
		printf("\n    VER:%s %s Date:%s Build:%s\n  ",VER1,VER2,MAKEDATE,MAKENUM);
		fflush(stdout);msleep(5);fflush(stdout);
		return;
	}
    read_db_name("db.cfg");
	xstrncpy(hostname,view_network(tty),20);
	if (n==1&&argc>2&&is_same(argv[1],"-h")) {
		strcpy(hostname,argv[2]);
		if (strlen(hostname)>0&&is_char(hostname,'.')) {
			allmode2=set_bit(allmode2,10,1); //HOSTNO¸¦ ÆÄ¶ó¸ÞÅ¸·Î ³Ñ±è
		  //12991 pts/58   S	  0:00 /bbs/bin/xmain -h 203.254.78.211 -p
		}
	}
    if (bit(allmode,12)) mess("log_in");
	log_in();					//ÃÊ±â¼³Á¤ ÅÍ¹Ì³¯ ¼³Á¤µî ¼¼ÆÃ
    if (c_proc) {
        getcwd(buff,sizeof(buff));      //ÇöÀçÀÇ µð·ºÅä¸®
        mess("ÇöÀçÀ§Ä¡:%s",buff);
    }
    if (bit(allmode,12)) mess("start_logo");
	start_logo(0);
	start_id(0);  //¾ÆÀÌµð¸¦ ÀÔ·Â¹Þ°í ÃÊ±â È­¸éÀ» º¸¿©ÁØ´Ù.
    record_login();  //Á¢¼Ó±â·ÏÅë°è
	if (pf.type<18&&pf.type<cfg.itype) {
        if (!view("forum/main/frm/log/lowtype.log"))
            mess("%s ÁøÀÔµî±Þ(%d)ÀÌ ºÎÁ·ÇÕ´Ï´Ù. (ÇöÀç:%d)",cfg.hostname,pf.type,cfg.itype);
		host_end();
		exit(1);
	}

    if (bit(allmode,12)) mess("save_login");
	save_login(1);			//½ÃÀÛ±â·Ï
	set_stat2(23,"Á¢¼ÓÁß");

	clear_node();
	rm_tmpup();
    if (bit(allmode,12)) mess("view_notice");
	view_notice(1,"notice");    //°øÁö»çÇ× º¸±â

	if (auto_cmd[0]==0&&is_gocode(pf.gofirst)) sprintf(auto_cmd,"go %s",pf.gofirst); //ÀÚµ¿°¡±âÄÚµå

	re_logo=Yes;


	if (guest_mode&&bit(cfg.guestmode,1)) strcpy(auto_cmd,"bye");
	go_top(0);
	strcpy(db_name,DB_NAME);
	strcpy(filt_str,"");

	if (guest_mode&&cfg.guestin==3) go_code("guide");   //¹«Á¶°Ç guide ¸Þ´º¸¸ °¡´ÉÇÏ°Ô
    if (bit(allmode,12)) mess("start_main loop");
	while(1) {
		nostop=No;							//¸ØÃßÁö ¾ÊÀ½(·Î°íÆíÁý½Ã)
		if (strlen(pf.id)<3) log_rc(0);
		if (re_club) {
			printf(VTXOFF);
            if (bit(allmode,12)) mess("re_club");
			if (club_mode) club_init();    //µ¿È£È¸ÀÇ ÃÊ±âÈ­
			else		   main_init();    //µ¿È£È¸°¡ ¾Æ´Ò¶§ ´Ù½Ã º¹±¸ÇÔ
			re_club=No;
			re_print=Yes;
			time(&CHECK_TIME);			//Á¢¼Ó½ÃÀÛ½Ã°£
			continue;
		}

		if (is_char("rejnp",go.type)) {
			go_prev();
			continue;
		}
		if (re_logo) {
			stay_count=0;
			strcpy(filt_str,"");
			view_pos=0;
			if (check_type('i')) {
				go_prev();
				continue;
			}
			if (auto_cmd[0]==0) disp_menu_logo();	//¸Þ´ºÁøÀÔ½Ã º¸¿©ÁÖ´Â ·Î°í
			re_logo=No;
			re_print=Yes;
			list_mode=No;
			re_print=Yes;
		}

		// È­¸éÀ» Ç¥½ÃÇÑ´Ù.
		input_0:
		if (re_print) {
			stay_count=0;
			if (guest_mode&&cfg.guestin==3) {		//¹«Á¶°Ç guide ¸Þ´º¸¸ °¡´ÉÇÏ°Ô
				strcpy(club_go.code,"main");
				if (go.type=='m'&&!is_same(go.code,"guide")) go_code("guide");
			}
			allmode=set_bit(allmode,30,0);
			bzero(&list_anum,sizeof(list_anum));   //È­¸éÃâ·Â ¹øÈ£
			if (list_mode) set_stat(1,bbs.title);  //ÇöÀçÀ§Ä¡ ÀúÀå
			else		   set_stat(1,""       );  //ÇöÀçÀ§Ä¡ ÀúÀå
			if (strlen(auto_cmd)<1) {
				if (go.type=='m') disp_menu_screen();
				else if (is_char(BBSTYPE,go.type)) {
					if (list_mode) bbs_read(0,bbs.num); //ÇØ´ç¹øÈ£ ³»¿ëÃâ·Â
					else run_bbsscreen(0,0);
				}
			}
			N_page=1;
			re_print=No;
			allmode=set_bit(allmode,16,1);
		}
		input_1:
		disp_mid();  //NoÀÌ¸é µµ¿ò¸» Ãâ·Â¾ÈÇÔ ¸í·ÉÀÔ·Â¹Þ±âÀü ¸Þ¼¼Áö Ç¥½Ã
		all_trim(auto_cmd);
		if (strlen(auto_cmd)>0) {		   //ÀÚµ¿¸í·ÉÃ³¸®
			del_esc(auto_cmd);
			strcpy(buff,auto_cmd);
			strcpy(auto_cmd,"");
		}
		else if (sub_go[0]!=0) {		//ÀÚµ¿¸í·ÉÃ³¸®
			strcpy(buff,sub_go);
			strcpy(sub_go,"");
		}
		else {						   //¸í·É¾î ÀÔ·Â·çÆ¾
			input_2:
			printf("7");
			//¼±ÅÃ¸í·ÉÀÔ·Â
			strcpy(buff,"");
//		  printf("_%d_%d_%s_",bbs.num,list_mode,go.code);
            lineinput(buff,200);
//            dosinput(buff,200);
			check_han(buff);
			if (strlen(buff)<1&&go.type=='m'&&stay_count++<7) {
				goto input_2;
			}

			if (strlen(buff)>0) convert_cmd(buff);
			if (strlen(buff)<5) strchng2(buff,"Š ","");
			if (stristr(buff,"B080")) {printf("8[K");goto input_2;}
			if (go.type=='m'&&strlen(buff)<1) {re_print=Yes;goto input_0;printf("\n");}
		}

		if (buff[0]!='_') {
			check_short(1,buff) ;				  //´ÜÃà¸í·ÉÅ° ÁöÁ¤
			check_short(2,buff) ;				  //°³ÀÎº°´ÜÃà¸í·ÉºÐ¼®
		}
		input_4:

		check_cmd(buff);					  //¸í·É¾î ºÐÇØ
		i=strlen(mmc[0]);

		if (i>0) {
			allmode=set_bit(allmode,16,0);	 //È­¸é¾Ö´Ï¸¦ À§ÇÑ Ã³¸®
			allmode=set_bit(allmode,17,0);	 //Å°ÀÔ·Â´ë±â¸¦ À§ÇÑ Ã³¸®
			printf("\n");
		}

		if (i<1) {						  //±×³ÉÀÔ·Â½Ã
				 if (is_bbspds&&!list_mode) run_bbsscreen(1,0);
			else if (is_bbspds&&list_mode) bbs_read(2,bbs.num);
			else goto input_1;
		}
		else if (is_same(mmc[0],"go")&&mmc[2][0]=='_'&&(mmc[2][1]=='#'||mmc[2][1]=='*')) {
			if (!check_direct_go(1,buff)) {printf("\n");goto input_1;}
		}
		else if (do_menu_command()) 			  ; //¸Þ´º»óÀÇ ¸í·ÉÀÎ°¡?
		else if (do_basic_command(buff,buff))	  ; //±âº»¸í·É¾îÀÎ°¡?
		else if (do_list_command()) 			  ; //°Ô½ÃÆÇÀÇ ÀÚ·á¹øÈ£ÀÎ°¡?
		else if (do_order_command(mmc[0],buff))   ; //±âº»¸í·É¾îÀÎ°¡?
		else if (!bit(cfg.gomode,1)&&!is_same(mmc[0],"go")&&(mmc[0][0]=='0'||atoi(mmc[0])==0)&&strlen(mmc[0])>1) {
			if (!check_direct_go(0,buff)) {printf("\n");goto input_1;}
		}
	}
}

check_direct_go(int mode,char *buffstr)
{
	char buff[200],buff2[300];
	GO oldgo,oldclub;
	int old_clubmode=0;
	oldgo=go;
	oldclub=club_go;
	old_clubmode=club_mode;
	strcpy(buff,buffstr);
	if (mode) goto _cont3;

	if (strlen(mmc[1])>0&&is_same(mmc[0],"ÇØ")) {strcpy(mmc[0],"go");goto _cont3;}
	strcpy(buff2,buff);
	sprintf(buff,"go %s",buff2);
	strcpy(sub_go,"");
	check_cmd(buff);
	_cont3:
	if (!go_code(mmc[1])) return No;
	check_smenu(buff);
	return Yes;
}


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/// 	   µ¿È£È¸ °ü·Ã ÀÛ¾÷
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
club_init()
{
	int key=Yes;
	int i,n;
	char buff[300];
	char afile[10][300];

	strcpy(filt_str,"");
	now_type=1;
	re_club=No;
	club_mode=Yes;
	re_bbs=Yes;
	bzero(atype,sizeof(atype));

	bzero(auto_cmd,30);
	sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
	read_ccfg();

	check_cpf();			 //µî±ÞÀÐ±â -> now_type
	go_top(1);
	time(&CLUB_START_TIME);   //µ¿È£È¸ Á¢¼Ó½ÃÀÛ½Ã°£
	key=Yes;
	for (i=0;i<10;i++) {
		sprintf(afile[i],"forum/%s/frm/error/whynot%d.log",club_go.code,i);
		if (!is_file(afile[i])) sprintf(afile[i],"forum/main/frm/error/whynot%d.log",i);
	}
		 if (now_type==0) {view(afile[0]);key=No;}	  //µ¿È£È¸ ÁøÀÔÃÖ¼Òµî±Þ
	else if (now_type<18&&(ccfg.stop>=1&&ccfg.stop<=5)) {view(afile[2]);key=No;}
	else if (pf.type<18&&ccfg.stop==9) {view(afile[3]);key=No;}
	else if (pf.type<17&&now_type<17&&ccfg.enterp[0]!=0) {
		view(afile[4]);
		if (check_pass(ccfg.enterp,4,"")==No) key=No;
		key=No;
	}
	else if (pf.type<18&&pf.type<ccfg.intype) {
		sprintf(g_buff1,"%d",ccfg.intype);sprintf(g_buff2,"%s",atype[ccfg.intype]);
		view(afile[7]);key=No;
	}
	else if (now_type<18&&now_type<ccfg.cintype) {
		sprintf(g_buff1,"%d",ccfg.cintype);sprintf(g_buff2,"%s",ccfg.atype[ccfg.cintype]);
		view(afile[8]);key=No;
	}
	if (key==No) {go_top(0);re_club=Yes;return;}

	sprintf(buff,"µî±Þ:%d",now_type);
	start_logo(0);	//ÁøÀÔ½Ã º¸¿©ÁÖ´Â ¸Þ¼¼Áö
	if (strlen(sub_go)==0) view_notice(1,"notice");         //µ¿È£È¸ °øÁö»çÇ×
	strcpy(mmc[1],"");
	strcpy(mmc[2],"");
	if (!ccfg.hidetype&&now_type>0&&now_type<20) {
		strcpy(buff,ccfg.atype[now_type]);
		del_space(buff);
		if (strlen(buff)>0) message(" %s´ÔÀº [%s]ÀÔ´Ï´Ù.",pf.id,ccfg.atype[now_type]);
	}
}


//½ÃÀÛ½Ã ¶Ç´Â µ¿È£È¸¿¡¼­ ºüÁ® ³ª¿Ã¶§
main_init()
{
	while (go.type=='s') go_prev2();    //µ¿È£È¸ ¼±ÅÃÀÌÀüÀ¸·Î
	now_type=0; 				//ÇöÀçÀÇ µî±Þ
	re_print=Yes;
	re_bbs=Yes;
	re_club=No;
	club_mode=No;
	p_command=No;
	strcpy(club_go.dir,".");
	strcpy(club_go.dir,".");
	strcpy(club_go.code,"main");
	strcpy(club_go.name,"top");
	sprintf(NOW_MENU ,"forum/%s/menustru/menu.dat",club_go.code);
	strcpy(filt_str,"");
}


// µ¿È£È¸ÀÇ È¸¿ø ½Å»óÀ» ÀÐ°í µî±ÞÀ» ÆÄ¾ÇÇÑ´Ù.
check_cpf()
{
	int i;
	char buff[30];
	char buff2[180];
	int found=No;

	now_type=1;  //±âº»Àº ¼Õ´ÔÀ¸·Î Á¤ÇÑ´Ù.
	strcpy(cpf.id,"");
	strcpy(cpf.name,"");
	cpf.all_log=0;
	if (!club_mode) return;

	//µ¿È£È¸´ã´çÀÌ°Å³ª	µ¿È£È¸ÀÇ ½Ã»ðÀÎ°æ¿ì
	if (pf.type==17)  now_type=18;
	if (pf.type>=18)  now_type=19;
	if (now_type<1)   now_type=1;
	if (now_type<=18) {
		//È¸¿øÁ¤º¸¸¦ ÀÐ¾î¿Â´Ù
		if (read_cpf(pf.id)) {
			if (cpf.type==0||cpf.type>now_type) now_type=cpf.type;
			strcpy(cpf.id  ,pf.id  );		//ÀÌ¸§º¯°æ½Ã ÀÚµ¿À¸·Î ¿Ã¸²
			strcpy(cpf.name,pf.name);		//ÀÌ¸§º¯°æ½Ã ÀÚµ¿À¸·Î ¿Ã¸²
			time(&cpf.logout);				//µ¿È£È¸ Á¢¼Ó ½Ã°£ Àû±â
			cpf.all_log++;				//µ¿È£È¸ Á¢¼Ó È½¼ö
			if (ccfg.sametype) cpf.type=now_type=pf.type;
			if (is_same(ccfg.sysop,pf.id)) cpf.type=19;
			//save_cpf(pf.id);				  //È¸¿øÀÚ·á Àû±â
		}
	}
	if (now_type>19) now_type=19;
	if (now_type<19&&ccfg.sametype) now_type=pf.type;
	if (is_same(ccfg.sysop,pf.id)) now_type=19;
	cpf.type=now_type;
}



//¸Þ´º½ÃÀÛ½Ã ÁøÀÔ·Î°í
//lo2°¡ ÀÖ°í.. pf.mymode=0ÀÌ¸é ·Î°í2¸¦ º¸¿©ÁØ´Ù.
disp_menu_logo()
{
	char key=No;
	char filename[200];
	char filename1[200];
	char filename2[200];
	char filename3[200];
	char filename4[200];
	strcpy(filename1,"");strcpy(filename2,"");
	if (is_same(go.code,"top")) {printf("[;r");cls();}
	if (p_command==No&&bit(pf.mymode,2)==0) {			//¸¶Áö¸· ÀÔ·ÂÀÌ PÀÎ°¡?
		sprintf(filename1,"forum/%s/logo/%s.log",club_go.code,go.code);
		strchng(filename2,filename1,".log",".lo2"); //setansi
		strchng(filename3,filename1,".log",".lo3"); //¾ß°£
		strchng(filename4,filename1,".log",".lo4"); //¼Õ´Ô
		if (bit(pf.mymode,2)==0) {
			if (now_hour()>23&&now_hour()<5&&(key=view(filename3)));
			else if (guest_mode&&view(filename4));
			else if (bit(pf.mymode,6)==0) {
				if(!(key=view(filename2))) key=view(filename1);    //ÁøÀÔÈ­¸éÃâ·Â  *.log
			}
			else {
				key=view(filename1);	//ÁøÀÔÈ­¸éÃâ·Â	*.log
			}
		}
	}
	if (is_bbspds&&bit(bcfg.form,4)) pressenter();
	if (is_bbspds&&bit(bcfg.form,5)) strcpy(auto_cmd,"!");
	if (is_bbspds&&bit(bcfg.form,6)) strcpy(auto_cmd,"w");
}


// È­¸éÀ» Ç¥½ÃÇÑ´Ù.
disp_menu_screen()
{
	char filename1[300];
	char filename2[300];
	char filename3[300];
	char filename4[300];
	char buff[80];
	if (go.type!='m') return No;
	list_mode=No;

	/* ¸Þ´ºÈ­¸é Ãâ·Â  */
	sprintf(filename1,"forum/%s/logo/%s.mnu",club_go.code,go.code);

	strcpy(filename2,filename1);strcpy(filename3,filename1);strcpy(filename4,filename1);
	strchng(filename2,filename1,".mnu",".mn2");  //setansiÇÒ°æ¿ì
	strchng(filename3,filename1,".mnu",".mn3");  //¾ß°£ÀÛ¾÷°æ¿ì
	strchng(filename4,filename1,".mnu",".mn4");  //¼Õ´ÔÀü¿ë·Î°í
	if		(bit(pf.mymode,2)&&pf.type>=cfg.no_logotype) no_logofile();
	else if (now_hour()>23&&now_hour()<5&&view(filename3));
	else if (guest_mode&&view(filename4));
	else if (bit(pf.mymode,6)&&(view(filename2)||view(filename1))) ;  //¸Þ´ºÈ­¸éÃâ·Â  *.mnu ½ÇÆÐ
	else if (!bit(pf.mymode,6)&&view(filename1)) ;	//¸Þ´ºÈ­¸éÃâ·Â	*.mnu ½ÇÆÐ
	else no_logofile(); //¸Þ´ºÅ¸ÀÔÀÏ¶§ È­¸éÀÌ ¾øÀ»¶§

	if (bit(pf.mymode,2)==0) {
		sprintf(filename1,"forum/%s/logo/%s.ad%d",club_go.code,go.code,now_cmd_num%10);
		view(filename1);		   //±¤°í
	}
	return Yes;
}


disp_mid()
{
	FILE *fp;
	int ret=No;
	int i,n,count;
	char buff[600];
	char buff1[600];
	char buff2[200];
	char filename[600];
	strcpy(buff,"");
	//¸í·ÉÁÙ ¿ìÃø ±¤°í
	sprintf(buff,"");
	now_cmd_num++;

	view("system/sysmess.txt");  //ÀüÃ¼¸Þ¼¼Áö
	//¸Þ¼¼Áö ¿Â°ÍÀÌ ÀÖ´Â°¡?
    sprintf(filename,"user/message/%s.id",pf.id);
	if (view(filename)) {pressenter();printf("\n");unlink(filename);}
	if (!bit(cfg.infomode,0)&&!club_mode&&guest_mode&&(is_same(go.code,"top")||!bit(cfg.guestmode,9))) {
		view("forum/main/frm/guest/guestin%d.msg",now_cmd_num%10);
	}
	if (!is_char(BBSTYPE,go.type)) list_mode=No;

	check_samemoni();  //µ¿½ÃÁ¢¼ÓÃâ·Â

	if (bit(pf.mymode,9)) {			//¸¶Áö¸· ÀÔ·ÂÀÌ PÀÎ°¡?
		printf("\n ¼±ÅÃ ");		
	}
	else {
		if (list_mode) sprintf(filename,"forum/%s/logo/%s.cm2",club_go.code,go.code);
		else		   sprintf(filename,"forum/%s/logo/%s.cm1",club_go.code,go.code);
		if (!is_file(filename)) {
			set_bbs_logo("cm2",filename);
			if (list_mode) set_bbs_logo("cm2",filename);
			else		   set_bbs_logo("cm1",filename);
		}

		if (!is_file(filename)) strchng2(filename,"cm2","cm1");
		if (bcfg.cmd_x>0||bcfg.cmd_y>0) xy(bcfg.cmd_x,bcfg.cmd_y);
		if (!view(filename)) printf("[0;1m[80D[K ¼±ÅÃ>>");
	}

	//ÀÓ½Ã¸Þ¼¼Áö
	sprintf(buff,"");
	sprintf(filename,"user/message/%s.mes",no_spc(tty));
	if (is_file(filename)) {
		file2buff(buff,filename,500);
		del_enter(buff);
		unlink(filename);

	}
}

convert_cmd(char *cmd)
{
    FILE *fp;
    char buff[1000],buff1[1000],buff2[1000],buff3[1000],buff4[1000];
    buff2buff1(cmd,buff1,buff2);
    if ((fp=fopen("system/convert.cmd","r"))) {
        while (fgets(buff,20,fp)) {
            sscanf(buff,"%s%s",buff3,buff4);
            if (is_same(buff1,buff3)) {
                sprintf(cmd,"%s %s",buff4,buff2);
                all_trim(cmd);
                break;
            }
        }
        fclose(fp);
    }
}
