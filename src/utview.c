//È­¸éº¸±â
#include "bbs.h"
#include <stdarg.h>
#define MAX_V 300000

view_(int mode,char *filename,char *sbuff)
{
	char buff[280],ch,ch2,str[280],buff1[280];
	FILE *fp1,*fp2;
	int jpg_tag;
	int ret=No;
	int n=0,i,i1,i2,i3,i4,i5,len;
	int num=0;
	int bmode=1;
	int iii=0;
	int ntype;
	int who=0;
	int today=now_time_num();
	char nomacro=No;
	char ss[MAX_V+15];		  //¹Þ´Â¹öÆÛ
	PF pf3;
	CPF cpf3;

	bzero(ss,100);
	if (cpf.type>=17||pf.type==16) who=1;
	if (pf.type==17||is_same(ccfg.sysop,pf.id)||cpf.type>=18) who=2;
	if (pf.type==18) who=3;
	if (pf.type==19) who=4;
	len=MAX_V;
	strchng2(filename,"..",".");
	if (mode==1) {
		if((fp1=fopen(filename,"r"))==NULL) goto _quit;
		fseekend(fp1);
		len=ftell(fp1);
		rewind(fp1);
		for (i=0;i<MAX_V&&i<len;i++) ss[i]=fgetc(fp1);
		len=i;
		for (n=i;n<i+10;n++) ss[n]=0;
		fclose(fp1);
	}
	else if (mode==3) {
		for (i=0;i<MAX_V;i++) if ((ss[i]=sbuff[i])==0) break;
		len=i;
		for (n=i;n<i+10;n++) ss[n]=0;
	}

	ntype=pf.type;
	if (club_mode) ntype=now_type;
	if (ntype<0||ntype>19) ntype=0;

	ret=Yes;
	iii=0;
	while(iii<MAX_V&&iii<len) {
		ch = ss[iii++];
		if (ch=='\0') break;
		if (ch!='!'||nomacro) putchar(ch);
		else if (ch=='!'&&iii>len-5) putchar(ch);
		else {
			str[0]=ch;
			str[1]=ss[iii++];
			if(iii>=len) goto _quit;
				 if(str[1]=='\n') { printf("!\n");continue;}
			else if(str[1]=='[')  { printf("[");continue;}
			else if(str[1]=='!')  { printf("!!");continue;}
			else if(is_char("@#$%_^&|",str[1])) {
				num=0;
				bzero(buff,30);bzero(buff1,30);
				while((ch = ss[iii++]) != EOF) {
					if(iii>=len) goto _quit;
					if(ch<=' ') {
						buff[num]=0;
							 if (str[1]=='@') strcpy(buff1,b_num(buff,bmode));
						else if (str[1]=='&') strcpy(buff1,b_num(buff,1));
						else if (str[1]=='_') strcpy(buff1,b_num(buff,2));
						else if (str[1]=='|') strcpy(buff1,b_num(buff,3));
						else if (str[1]=='#') strcpy(buff1,b_num(buff,4));
						else if (str[1]=='$') strcpy(buff1,b_num(buff,5));
						else if (str[1]=='^') strcpy(buff1,b_num(buff,6));
						printf(buff1);
						if(ch=='\n'||ch=='\r') putchar(ch);
						break;
					} else buff[num++]=ch;
				}
				continue;
			}
			str[2]=ss[iii++];
			str[3]=ss[iii++];
			str[4]=ss[iii++];
			str[5]=ss[iii++];
			str[6]=0;
			if(iii>=len) goto _quit;
			if (str[1]=='\n'||str[2]=='\n'||str[3]=='\n'||str[4]=='\n'||str[5]!='!') {
				printf("!");
				iii-=5;if (iii<0) iii=1;
				continue;
			}
			fflush(stdout);
				 if (strcmp(str,"!°è¼Ó!")==0) {nostop=Yes;}
			else if (strcmp(str,"!Åõ¸í!")==0) {nomacro=Yes;}
			else if (strcmp(str,"!È­¸é!")==0) {cls();fflush(stdout);}
			else if (strcmp(str,"!ÁÙ¹Ù!")==0) printf("\n");
			else if (strcmp(str,"!¸ØÃã!")==0) {
				if (!nostop) {lineinput(buff,20);if (is_quit(buff)) break;}
			}
			else if (strcmp(str,"!È®ÀÎ!")==0) {
				if (!nostop) {printf("[Enter] Å°¸¦ ´©¸£½Ê½Ã¿ä.");lineinput(buff,20);if (is_quit(buff)) break;}
			}
			else if (strcmp(str,"!¿£ÅÍ!")==0) {if (!nostop) getchar3();  }
			else if (strcmp(str,"!Áö¿¬!")==0) {fflush(stdout);str[0]=ss[iii++];str[1]=0;n=atoi(str);if (pf.type<17) ssleep(n);}
			else if (strcmp(str,"!Àá±ñ!")==0) {fflush(stdout);str[0]=ss[iii++];str[1]=0;n=atoi(str);if (pf.type<17) msleep(n);}
			else if (strcmp(str,"!ÀÚµ¿!")==0) {str[0]=ss[iii++];str[1]=0;g_yes=atoi(str);}
			else if (strcmp(str,"!ÁßÁö!")==0) break;
			else if (strcmp(str,"!Á¾·á!")==0) break;
			else if (strcmp(str,"!³¡__!")==0) break;
			else if (strcmp(str,"!Æ÷Æ®!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf(tty);
				else if (ch=='1') printf(&tty[3]);
				else if (ch=='2') printf(hostname);
				else if (ch=='3') {file_line(buff,"system/hostaddr.txt",1);printf(buff);}
				else iii--;
			}
			else if (strcmp(str,"!±¤¿ª!")==0) {
				ch=tolower(ss[iii++]);
					 if (ch=='0') printf(g_id);
				else if (ch=='1') printf(g_buff1);
				else if (ch=='2') printf(g_buff2);
				else if (ch=='3') printf(g_buff3);
				else if (ch=='4') printf(g_buff4);
				else if (ch=='5') printf("%d",a_num[1]);
				else if (ch=='6') printf("%d",a_num[2]);
				else if (ch=='7') printf("%d",a_num[3]);
				else if (ch=='8') printf(g_id);
				else if (ch=='9') printf(g_name);
				else if (ch=='a') printf("%d",a_num[4]);
				else if (ch=='b') printf("%d",a_num[5]);
				else if (ch=='c') printf("%d",a_num[6]);
				else if (ch=='d') printf("%d",a_num[7]);
				else if (ch=='e') printf("%d",a_num[8]);
				else if (ch=='f') printf("%d",a_num[9]);
				else if (ch=='g') printf("%d",a_num[10]);
				else if (ch=='h') printf("%d",a_num[11]);
				else if (ch=='i') printf("%d",a_num[12]);
				else if (ch=='j') printf("%d",a_num[13]);
				else if (ch=='k') printf("%d",a_num[14]);
				else if (ch=='l') printf("%d",a_num[15]);
				else iii--;
			}
            else if (strcmp(str,"!¹öÁ¯!")==0) {
				str[0]=ss[iii++];n=atoi(str);
                if (n==1) printf(VER1);
                else if (n==2) printf(MAKENUM);
                else if (n==3) printf(MAKEDATE);
                else printf("%s B%s %s",VER1,MAKENUM,MAKEDATE);
            }
            else if (strcmp(str,"!¿¢½º!")==0) {
                view("frm/main/logo/_xlogo%c.log",ss[iii++]);
			}
			else if (strcmp(str,"!±¤¹®!")==0) {
				str[0]=ss[iii++];n=atoi(str);
					 if (n==1) printf(g_buff1);
				else if (n==2) printf(g_buff2);
				else if (n==3) printf(g_buff3);
				else if (n==4) printf(g_buff4);
				else if (n==5) printf(g_buff5);
				else if (n==6) printf(g_buff6);
				else if (n==7) printf(g_buff7);
				else if (n==8) printf(g_buff8);
				else if (n==9) printf(g_buff9);
				else if (n==0) printf(g_buff10);
			}
			else if (strcmp(str,"!±¤¼ö!")==0) {
				ch=tolower(ss[iii++]);
					 if (ch=='1') printf("%d",a_num[1]);
				else if (ch=='2') printf("%d",a_num[2]);
				else if (ch=='3') printf("%d",a_num[3]);
				else if (ch=='4') printf("%d",a_num[4]);
				else if (ch=='5') printf("%d",a_num[5]);
				else if (ch=='6') printf("%d",a_num[6]);
				else if (ch=='7') printf("%d",a_num[7]);
				else if (ch=='8') printf("%d",a_num[8]);
				else if (ch=='9') printf("%d",a_num[9]);
				else if (ch=='0') printf("%d",a_num[10]);
				else if (ch=='a') printf("%d",a_num[11]);
				else if (ch=='b') printf("%d",a_num[12]);
				else if (ch=='c') printf("%d",a_num[13]);
				else if (ch=='d') printf("%d",a_num[14]);
				else if (ch=='e') printf("%d",a_num[15]);
			}
			else if (strcmp(str,"!¹®ÀÚ!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				if (n>=0&&n<100) printf("%s",a_str[n]);
			}
			else if (strcmp(str,"!¼ýÀÚ!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				if (n>=0&&n<=100) printf("%d",a_num[n]);
			}
			else if (strcmp(str,"!¼ý03!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				if (n>=0&&n<=100) printf("%03d",a_num[n]);
			}
			else if (strcmp(str,"!¼ý_3!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				if (n>=0&&n<=100) printf("%3d",a_num[n]);
			}
			else if (strcmp(str,"!¼ý_5!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				if (n>=0&&n<=100) printf("%5d",a_num[n]);
			}
			else if (is_same(str,"!¼ýÁö!")) {
				bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
				bzero(str,20);for (i=0;i<10&&ss[iii]>' ';i++) str[i]=ss[iii++];
				i=atoi(str);
				a_num[n]=i;
			}
			else if (strcmp(str,"!°¡ÀÔ!")==0) printf(cfg.guestid);
            else if (strcmp(str,"!¿µ¹®!")==0) printf(pf.eid);
			else if (strcmp(str,"!¾Æµð!")==0||strcmp(str,"!ÀÌ¸§!")==0) {
				ch=ss[iii++];
					 if (strcmp(str,"!¾Æµð!")==0) strcpy(buff,pf.id);
				else							  strcpy(buff,pf.name);
					 if (ch=='0') printf(buff);
				else if (ch=='1') printf("%s"  ,upr(buff));
				else if (ch=='2') printf("%s"  ,lwr(buff));
				else if (ch=='3') printf("%-8s",upr(buff));
				else if (ch=='4') printf("%-8s",lwr(buff));
				else if (ch=='5') printf("%8s" ,buff);
				else if (ch=='6') printf("%-8s" ,buff);
				else {iii--;printf(buff);}
			}
			else if (strcmp(str,"!¾ÏÈ£!")==0) printf(pf.passwd);
			else if (strcmp(str,"!¿ìÆí!")==0) printf(pf.post);
			else if (strcmp(str,"!Á÷Àå!")==0) printf(pf.offi);
			else if (strcmp(str,"!ÁÖ¼Ò!")==0) {
				ch=ss[iii++];
					 if (ch=='1') printf(pf.addr1);
				else if (ch=='2') printf(pf.addr2);
				else if (ch=='8') printf("%-20.20s",pf.addr1);
				else if (ch=='9') printf("%-10.10s",pf.addr1);
				else {iii--;printf(pf.addr1);}
			}
			else if (strcmp(str,"!ÀüÈ­!")==0) {
				ch=ss[iii++];
					 if (ch=='1') printf(pf.tele);
				else if (ch=='2') printf(pf.hand);
				else {iii--;printf(pf.tele);}
			}
			else if (strcmp(str,"!³ªÀÌ!")==0) printf("%d",get_age(pf));
			else if (strcmp(str,"!»ýÀÏ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf(datestr(0,pf.birthday));
				else if (ch=='1') printf(datestr(37,pf.birthday));
				else if (ch=='2') printf("%s",dateyang(11,pf.birthday,pf.moon));
				else if (ch=='3') printf(yangstr(3,pf.moon));
				else if (ch=='_') {
					bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];
					printf("%s",datestr(atoi(str),pf.birthday));
				}
				else {iii--;printf(datestr(0,pf.birthday));}
			}
			else if (strcmp(str,"!½Å»ó!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf(is_char("0f",pf.sex)?"¿©":"³²");
				else if (ch=='1') printf(pf.id_no);
				else if (ch=='2') printf("%d",pf.job);
				else if (ch=='3') printf(cfg.ajob[pf.job%20]);
			}
			else if (strcmp(str,"!Á÷¾÷!")==0) {
				ch=ss[iii++];
					 if (ch=='1') printf("%d",pf.job);
				else if (ch=='2') printf("%s (%d)",cfg.ajob[pf.job%20],pf.job);
				else if (ch=='3') printf(cfg.ajob[pf.job%20]);
                else if (ch=='4') {
                    for (i=0;i<20;i++) {
                        if (strlen(cfg.ajob[i])) printf("  %2d. %s\n",i+1,cfg.ajob[i]);
                    }
                }
				else {iii--;printf(cfg.ajob[pf.job%20]);}
			}
			else if (strcmp(str,"!¼Ò°³!")==0) {
				ch=ss[iii++];
					 if (ch=='1'&&cfg.disp_memo1) printf(pf.memo1);
				else if (ch=='2'&&cfg.disp_memo2) printf(pf.memo2);
				else if (ch=='3'&&cfg.disp_memo3) printf(pf.memo3);
				else if (ch=='4'&&cfg.disp_memo4) printf(pf.memo4);
				else if (ch=='5'&&cfg.disp_memo5) printf(pf.memo5);
				else if (ch=='6'&&cfg.disp_memo6) printf(pf.memo6);
				else if (ch=='7'&&cfg.disp_memo7) printf(pf.memo7);
				else if (ch=='8'&&cfg.disp_memo8) printf(pf.memo8);
			}
			else if (strcmp(str,"!¼ÒÀÌ!")==0) {
				ch=ss[iii++];
					 if (ch=='1'&&cfg.disp_memo1) printf(cfg.memo1);
				else if (ch=='2'&&cfg.disp_memo2) printf(cfg.memo2);
				else if (ch=='3'&&cfg.disp_memo3) printf(cfg.memo3);
				else if (ch=='4'&&cfg.disp_memo4) printf(cfg.memo4);
				else if (ch=='5'&&cfg.disp_memo5) printf(cfg.memo5);
				else if (ch=='6'&&cfg.disp_memo6) printf(cfg.memo6);
				else if (ch=='7'&&cfg.disp_memo7) printf(cfg.memo7);
				else if (ch=='8'&&cfg.disp_memo8) printf(cfg.memo8);
			}
			else if (strcmp(str,"!È¸¹ø!")==0) printf("%d",pf.num);
			else if (strcmp(str,"!Á¢¼Ó!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf(datestr( 2,pf.inday));
				else if (ch=='1') printf(datestr(19,pf.inday));
				else if (ch=='2') printf(datestr(38,pf.inday));
				else if (ch=='6') printf(datestr( 2,pf.logout));
				else if (ch=='7') printf(datestr(19,pf.logout));
				else if (ch=='8') printf(datestr(38,pf.logout));
				else if (ch=='_') {
					bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];
					printf("%s",datestr(atoi(str),pf.logout));
				}
				else iii--;
			}
			else if (strcmp(str,"!ÀÌ¿ë!")==0) {
				ch=ss[iii++];
				if (START_TIME==0) time(&START_TIME);
				if (CHECK_TIME==0) time(&CHECK_TIME);
					 if (ch=='0') printf(datestr( 3,START_TIME));
				else if (ch=='1') printf(datestr(20,how_old(START_TIME)));
				else if (ch=='2') printf(datestr(19,CHECK_TIME));
				else iii--;
			}
			else if (strcmp(str,"!µî±Þ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d",pf.type);
				else if (ch=='1') printf("%2d",pf.type);
				else if (ch=='2') printf("%s",cfg.atype[pf.type]);
				else if (ch=='3') printf("%-8.8s",cfg.atype[pf.type]);
				else {iii--;printf("%d",pf.type);}
			}
			else if (strcmp(str,"!°³ÀÎ!")==0) {
				str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
					 if (n==10) printf("%d",pf.down);
				else if (n==11) printf("%d",pf.down/1024);
				else if (n==12) printf("%6d",pf.down/1024);
				else if (n==13) printf("%s",byte2str(pf.down));
				else if (n==14) printf("%6s",byte2str(pf.down));
				else if (n==15) printf("%-6s",byte2str(pf.down));
				else if (n==21) printf("%d",pf.countw);
				else if (n==22) printf("%d",pf.countu);
				else if (n==23) printf("%d",pf.countd);
				else if (n==41) printf("%d",pf.all_log);
				else if (n==42) printf("%6d",pf.all_log);
				else if (n==43) printf("%d",pf.month_log);
				else if (n==44) printf("%6d",pf.month_log);
				else if (n==51) printf("%d",pf.all_time);
				else if (n==52) printf("%6d",pf.all_time/60);
				else if (n==53) printf("%7s",datestr(22,pf.all_time));
				else if (n==54) printf("%d",pf.month_time);
				else if (n==55) printf("%6d",pf.month_time/60);
				else if (n==56) printf("%7s",datestr(22,pf.month_time));
                else if (n==67) printf("%s",pf.msg?"°ÅºÎ":"Çã°¡");
				else if (n==91) printf("%3d",pf.offmin);
				else if (n==99) printf(bitstr(pf.mymode));
			}
			else if (strcmp(str,"!È£½º!")==0) printf(cfg.hostname);
			else if (strcmp(str,"!µð·º!")==0) {
				ch=ss[iii++];
				getcwd(buff,sizeof(buff));		//ÇöÀçÀÇ µð·ºÅä¸®
					 if (ch=='0') printf(buff);
				else if (ch=='1') printf(club_mode?club_go.dir:buff);
				else if (ch=='2') printf(club_go.dir);
				else if (ch=='3') printf(go.dir);
				else {iii--;printf(buff);}
			}
			else if (strcmp(str,"!°¡±â!")==0) {
				ch=ss[iii++];
				if		(ch=='0') printf(go.code);
				else if (ch=='1') printf("%-8s",go.code);
				else if (ch=='2') printf("%s",upr(go.code));
				else if (ch=='3') printf("%s",lwr(go.code));
				else if (ch=='4') printf("%-8s",upr(go.code));
				else if (ch=='5') printf("%-8s",lwr(go.code));
				else if (ch=='6') ;
				else if (ch=='9') printf("%d",go.rec);
				else {iii--;printf(go.code);}
			}
			else if (strcmp(str,"!°¡ÀÌ!")==0) {
				ch=ss[iii++];
				if		(ch=='0') printf(go.name);
				else if (ch=='1') printf("%-10.10s",go.name);
				else if (ch=='2') printf("%-20.20s",go.name);
				else if (ch=='3') printf("%-30.30s",go.name);
				else if (ch=='4') printf("%-40.40s",go.name);
				else {iii--;printf(go.name);}
			}
			else if (strcmp(str,"!µ¿È£!")==0) {
				ch=ss[iii++];
				if		(ch=='0') printf(club_go.code);
				else if (ch=='1') printf("%-8s",club_go.code);
                else if (ch=='2') printf("%8s",club_go.code);
                else if (ch=='3') printf(ccfg.name);
                else if (ch=='4') printf(ccfg.sysop);
				else {iii--;printf(club_go.code);}
			}
			else if (strcmp(str,"!µ¿ÀÌ!")==0) {
				ch=ss[iii++];
				if		(ch=='0') printf(club_go.name);
				else if (ch=='1') printf("%-10.10s",club_go.name);
				else if (ch=='2') printf("%-20.20s",club_go.name);
				else if (ch=='3') printf("%-30.30s",club_go.name);
				else {iii--;printf(club_go.name);}
			}
			else if (strcmp(str,"!´ã´ç!")==0) {
				ch=ss[iii++];
                     if (ch=='0') printf(bcfg.sysop);
                else if (ch=='1') printf(bcfg.sysop1);
                else if (ch=='2') printf(bcfg.sysop2);
                else if (ch=='3') printf(bcfg.sysop3);
                else if (ch=='9') {if (strlen(bcfg.sysop)) printf("´ã´ç:%s",bcfg.sysop);}
                else {iii--;printf(bcfg.sysop);}
			}
			else if (strcmp(str,"!µî·Ï!")==0||strcmp(str,"!µî¾Æ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%s"   ,bbs.id  );
				else if (ch=='1') printf("%-8s" ,bbs.id  );
				else if (ch=='2') printf("%s",upr(bbs.id));
				else if (ch=='3') printf("%-8s",upr(bbs.id));
				else if (ch=='4') printf("%s",lwr(bbs.id));
				else if (ch=='5') printf("%-8s",lwr(bbs.id));
				else if (ch=='8') printf("%-8s",pf.type<18?"........":bbs.id);
                else if (ch=='9') printf("%-8s",go.type=='k'&&!is_same(bcfg.sysop,pf.id)?"........":bbs.id  );
				else {iii--;printf("%s",bbs.id);}
			}
			else if (strcmp(str,"!µîÀÌ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%s"  ,bbs.name);
				else if (ch=='1') printf("%-8s",bbs.name);
				else if (ch=='2') printf("%-8s",bbs.name);
				else if (ch=='8') printf("%-8s",pf.type<18?"........":bbs.name);
                else if (ch=='9') printf("%-8s",go.type=='k'&&!is_same(bcfg.sysop,pf.id)?"........":bbs.name);
				else {iii--;printf("%s",bbs.name);}
			}
			else if (strcmp(str,"!ÃÑ¹ø!")==0) {
				ch=ss[iii++];
					 if (ch=='1') printf("%d",NOW_ALLNO);
				else if (ch=='3') printf("%d",NOW_NO);
				else if (ch=='4') printf("%d",NOW_ALLNUM);
				else if (ch=='5') printf("%d",NOW_NEWNUM);
				else if (ch=='6') {sprintf(buff,"#%d/%d",bbs.num,NOW_ALLNO);printf("%25s",buff);}
				else if (ch=='7') {sprintf(buff,"%d/%d (ÃÑ %d°Ç)",NOW_PAGE,NOW_ALLNO/15+1,NOW_ALLNO);printf("%25s",buff);}
				else if (ch=='8') {sprintf(buff,"%d/%d (ÃÑ %d°Ç)",bbs.num,NOW_ALLNO,NOW_ALLNUM);printf("%25s",buff);}
			}
			else if (strcmp(str,"!¹øÈ£!")==0) {
				sprintf(buff1,"%6d ",bbs.num%1000000);
				ch=ss[iii++];
					 if (ch=='0') printf("%s" ,buff1);
				else if (ch=='1') {del_space(buff1);printf("%4.4s",buff1);}
				else if (ch=='2') {del_space(buff1);printf("%6s",buff1);  }
				else if (ch=='3') {del_space(buff1);printf("%-6s",buff1); }
				else if (ch=='4') printf("%d" ,bbs.num);
				else if (ch=='5') printf("%3d",bbs.num);
				else if (ch=='6') printf("%4d",bbs.num);
				else if (ch=='7') printf("%5d",bbs.num);
				else if (ch=='8') printf("%6d",bbs.num);
				else if (ch=='9') printf("%7d",bbs.num);
				else {iii--;printf("%s",buff1);}
			}
			else if (strcmp(str,"!µî³¯!")==0||strcmp(str,"!Á¶³¯!")==0) {
				time_t tdate;
				tdate=strcmp(str,"!µî³¯!")==0?bbs.date:bbs.date2;
				ch=ss[iii++];
					 if (ch=='0') printf("%s",datestr( 0,tdate));
				else if (ch=='1') printf("%s",datestr( 1,tdate));
				else if (ch=='2') printf("%s",datestr( 2,tdate));
				else if (ch=='3') printf("%s",datestr( 3,tdate));
				else if (ch=='4') printf("%s",datestr( 4,tdate));
				else if (ch=='5') printf("%s",datestr( 5,tdate));
				else if (ch=='6') printf("%s",datestr( 6,tdate));
				else if (ch=='7') printf("%s",datestr(17,tdate));
				else if (ch=='8') printf("%s",datestr(24,tdate));
				else if (ch=='9') printf("%s",datestr(25,tdate));
				else if (ch=='_') {
					bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];
					printf("%s",datestr(atoi(str),tdate));
				}
				else {iii--;printf("%s",datestr(8,tdate));}
			}
			else if (strcmp(str,"!¸ÞÀÏ!")==0) {
				if (bbs.filesize>0&&strlen(bbs.filename)>0) strcpy(buff,"BIN ");
				else strcpy(buff,"TXT ");
				ch=ss[iii++];
					 if (ch=='0') printf("%-4.4s",buff);
				else if (ch=='1') printf("%-4.4s",bbs.keyword);
				else if (ch=='2') printf("%-8.8s",bbs.keyword);
				else if (ch=='3') printf("%-4.4s",bbs.tcode);
			}
			else if (strcmp(str,"!Á¦¸ñ!")==0) {
				ch=ss[iii++];
                if (bbs.del=='D') printf("[7mD[1;0m");
					 if (ch=='0') printf("%s",bbs.title);
				else if (ch=='1') printf("%60.60s",bbs.title);
				else if (ch=='2') printf("%-60.60s",bbs.title);
				else if (ch=='3') printf("%-55.55s",bbs.title);
				else if (ch=='4') printf("%-50.50s",bbs.title);
				else if (ch=='5') printf("%-42.42s",bbs.title);
				else if (ch=='6') printf("%-40.40s",bbs.title);
				else if (ch=='7') printf("%-35.35s",bbs.title);
				else if (ch=='8') printf("%-30.30s",bbs.title);
				else if (ch=='9') {
					bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
					sprintf(buff,"%%-%d.%ds",n,n);
					printf(buff,bbs.title);
				}
				else {iii--;printf("%s",bbs.title);}
			}
			else if (strcmp(str,"!Á¶È¸!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d",bbs.hits);
				else if (ch=='1') printf("%3d",bbs.hits);
				else if (ch=='2') printf("%4d",bbs.hits);
				else if (ch=='3') printf("%5d",bbs.hits);
				else {iii--;printf("%d",bbs.hits);}
			}
			else if (strcmp(str,"!´Ù¿î!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d",bbs.down);
				else if (ch=='1') printf("%3d",bbs.down);
				else if (ch=='2') printf("%4d",bbs.down);
				else if (ch=='3') printf("%5d",bbs.down);
				else if (ch=='9') printf("%-6d",bbs.down);
				else {iii--;printf("%d",bbs.down);}
			}
			else if (strcmp(str,"!¶óÀÎ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d",bbs.line);
				else if (ch=='1') printf("%2d",bbs.line);
				else if (ch=='2') printf("%4d",bbs.line);
				else if (ch=='3') printf("%d",bbs.line/16+1);
				else if (ch=='4') printf("%3d",bbs.line/16+1);
				else if (ch=='5') printf("%d",N_page);
				else if (ch=='6') printf("%3d",N_page);
				else if (ch=='7') printf("%d/%d",N_page,bbs.line/16+1);
				else if (ch=='8') printf("%3d/%-3d",N_page,bbs.line/16+1);
				else if (ch=='9') {
					sprintf(buff,"%d/%d",N_page,bbs.line/16+1);
					printf("%-16s",buff);
				}
				else {iii--;printf("%d",bbs.line);}
			}
			else if (strcmp(str,"!±æÀÌ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d",bbs.size);
				else if (ch=='1') printf("%2d",bbs.size);
				else if (ch=='2') printf("%4d",bbs.size);
				else if (ch=='3') printf("%6d",bbs.size);
				else if (ch=='4') printf("%s",byte2str(bbs.size));
				else if (ch=='5') printf("%5s",byte2str(bbs.size));
				else if (ch=='6') printf("%6s",byte2str(bbs.size));
				else {iii--;printf("%d",bbs.size);}
			}
			else if (strcmp(str,"!È­ÀÏ!")==0||strcmp(str,"!ÆÄÀÏ!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%s",bbs.filename);
				else if (ch=='1') printf("%-12.12s",bbs.filename);
				else if (ch=='2') printf("%12.12s",bbs.filename);
				else if (ch=='3') printf("%-12.12s",bbs.filename);
				else if (ch=='4') printf("%12.12s",bbs.filename);
				else if (ch=='5') printf("%-12.12s",bbs.filename);
				else if (ch=='6') printf("%12.12s",bbs.filename);
				else if (ch=='7') printf("%-20.20s",bbs.filename);
				else if (ch=='8') printf("%20.20s",bbs.filename);
				else if (ch=='9') printf("%-30.30s",bbs.filename);
				else if (ch=='f') printf("%d",bbs.fcount);
				else {iii--;printf("%s",bbs.filename);}
			}
			else if (strcmp(str,"!Å©±â!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%s",byte2str(bbs.filesize));
				else if (ch=='1') printf("%5s",byte2str(bbs.filesize));
				else if (ch=='2') printf("%6s",byte2str(bbs.filesize));
				else if (ch=='3') printf("%d",bbs.filesize);
				else if (ch=='4') printf("%6d",bbs.filesize);
				else if (ch=='5') printf("%8d",bbs.filesize);
				else if (ch=='6') printf("%d",bbs.filesize/1024);
				else if (ch=='7') printf("%6d",bbs.filesize/1024);
				else if (ch=='8') printf("%-8d",bbs.filesize);
				else if (ch=='9') printf("%4.4s",byte2str(bbs.filesize));
				else {iii--;printf("%d",bbs.filesize);}
			}
			else if (strcmp(str,"!ºÐ·ù!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%s",bbs.keyword);
				else if (ch=='1') printf("%-8s",bbs.keyword);
				else if (ch=='2') printf("%-4.4s",bbs.keyword);
				else if (ch=='3') printf("%8s",bbs.keyword);
				else if (ch=='4') printf("%4.4s",bbs.keyword);
				else if (ch=='5') printf("%2.2s",bbs.keyword);
				else if (ch=='6') printf("%-12.12s",bbs.keyword);
				else if (ch=='7') printf("%12.12s",bbs.keyword);
				else {iii--;printf("%s",bbs.keyword);}
			}
			else if (strcmp(str,"!ÃßÃµ!")==0) {
				char buff2[280],buff3[280],buff4[280];
				strcpy(buff2,"");strcpy(buff3,"");strcpy(buff4,"");
				if (bbs.good<0) bbs.good=0;
				if (bbs.good>0) strcpy(buff2,cfg.gd_str[bbs.good%10]);		//ÃßÃµº°»ö»ó
				if (strlen(buff2)>0) {
					sprintf(buff3,"[s%s",buff2);
					strcpy(buff4,"[u");
				}
				ch=ss[iii++];
					 if (ch=='0') printf("%s",buff3);
				else if (ch=='1') printf("%s",buff4);
				else if (ch=='3') printf("%8.8s",cfg.gd_name[bbs.good%10]);
				else if (ch=='4') printf("%-8.8s",cfg.gd_name[bbs.good%10]);
				else if (ch=='6') printf("%s",buff2);
				else {iii--;printf("%c",' '+bbs.good%10);}
			}
			else if (strcmp(str,"!Âù¼º!")==0) {
				ch=ss[iii++];
					 if (ch=='0') printf("%d" ,bbs.ok);
				else if (ch=='1') printf("%d" ,bbs.no);
                else if (ch=='2') printf("%d" ,bbs.an);
				else if (ch=='3') printf("%3d",bbs.ok);
				else if (ch=='4') printf("%3d",bbs.no);
                else if (ch=='5') printf("%3d",bbs.an);
                else if (ch=='6') {if (bbs.ok) printf("Âù¼º:%d ",bbs.ok);}
                else if (ch=='7') {if (bbs.no) printf("¹Ý´ë:%d ",bbs.no);}
                else if (ch=='8') {if (bbs.an) printf("ÀÀ´ä:%d ",bbs.an);}
				else if (ch=='9') sprintf(buff,"%3d:%-3d",bbs.ok,bbs.no);
				else iii--;
			}
			else if (strcmp(str,"!»èÁ¦!")==0) {
				ch=ss[iii++];
                     if (ch=='0') printf("%s" ,bbs.del=='D'?"[»èÁ¦]":"");
                else if (ch=='1') printf("%s" ,bbs.del=='D'?"[»èÁ¦]":"      ");
                else if (ch=='2') printf("%s" ,bbs.del=='D'?"D":"");
                else if (ch=='3') printf("%s" ,bbs.del=='D'?"D":" ");
                else if (ch=='4') printf("%s" ,bbs.del=='D'?"Del":"");
                else if (ch=='5') printf("%s" ,bbs.del=='D'?"Del":"   ");
				else iii--;
			}
			else if (strcmp(str,"!¸í·É!")==0) {
				bzero(str,10);
				for (i=0;i<8;i++) {
					if (ss[iii]<=' ') break;
					str[i]=ss[iii++];
				}
				del_space(str);del_esc3(str);
				sprintf(buff,"bin/%s.lsh",str);
				if(is_file(buff)) {
					sys_tem("%s '%s' '%s' '%s' %d '%s'",
						buff,pf.id,pf.name,dateyang(11,pf.birthday,pf.moon),pf.type,go.code);
				}
				else printf(buff);
				fflush(stdout);
			}
			else if (strcmp(str,"!°­Á¦!")==0) {
				bzero(str,50);
				for (i=0;i<50;i++) {if (ss[iii]<' ') break;str[i]=ss[iii++];}
				strcpy(auto_cmd,str);
			}
			else if (strcmp(str,"!·Î°í!")==0) {  //text È­¸é º¸¿©ÁÜ
				bzero(str,40);
				for (i=0;i<40;i++) {if (ss[iii]<=' ') break;str[i]=ss[iii++];}
				sprintf(buff,"%s/logo/%s",club_go.dir,str);
				mview(Yes,str);
			}
			else if (strcmp(str,"!¸ð¾ç!")==0) {   //È­¸éÇ¥½Ã¹æ¹ý¼öÁ¤
				bzero(str,20);
				str[0]=ss[iii++];str[1]=ss[iii++];str[2]=0;
				bmode=atoi(str);
			}
			else if (strcmp(str,"!¼­¹ö!")==0) {
				ch=ss[iii++];
				strcpy(buff,"");
				if (ch=='0') sprintf(buff,"%s.%u",cfg.sip,cfg.nip[cfg.hostno%20]);
				if (ch=='1') sprintf(buff,"%s.%u",cfg.sip,cfg.nip[moni.hostno%20]);
				printf("%-15s",buff);
				//126.123.123.123
			}
			else if (strcmp(str,"!¼­¹ø!")==0) {
				bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];str[2]=0;n=atoi(str);
				sprintf(buff,"%s.%u",cfg.sip,cfg.nip[n%20]);
				printf("%-15s",buff);
				//126.123.123.123
			}
			else if (strcmp(str,"!±âÅ¸!")==0) {   //È­¸éÇ¥½Ã¹æ¹ý¼öÁ¤
				ch=ss[iii++];
					 if (ch=='0') printf("%s",autoup?"[ÀÚµ¿µî·Ï»óÅÂ]":"");
				else iii--;
			}
			else if (strcmp(str,"!½Ã°£!")==0) {
				bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];str[2]=0;n=atoi(str);
				printf(now_str(n));
			}
			else if (strcmp(str,"!¸ð´Ï!")==0) {
				ch=tolower(ss[iii++]);
				if (ch=='0') {
					if (bit(moni.mode2,1)==0) printf("%-8.8s",moni.name);
					else					  printf("[35;1m%-8.8s[0;1m",moni.name);
				}
				else if (ch=='1') printf("%-6.6s",moni.tty);
				else if (ch=='2') {del_esc(moni.hostname);del_space(moni.hostname);printf("%-20.20s",moni.hostname);}
				else if (ch=='3') printf("%-8.8s",moni.gocode);
				else if (ch=='4') printf("%-20.20s",moni.goname);
				else if (ch=='5') printf("%-8.8s",moni.club);
				else if (ch=='6') printf("%-2d",moni.hostno);
				else if (ch=='7') printf("%s",moni.msg?"#":"|");
				else if (ch=='8') printf("%s",moni.msg?"°ÅºÎ":"Çã¿ë");
				else if (ch=='9') printf("%s",datestr(4,moni.login));
				else if (ch=='a') printf("%2d",moni.type);
				else if (ch=='b') printf("%2d",moni.mode);
				else if (ch=='c') printf("%2d",moni.stat);
				else if (ch=='d') printf("%-70.70s",moni.what);
				else if (ch=='e') printf("%-30.30s",moni.what);
				else if (ch=='f') printf("%-30.30s",moni.what);
				else if (ch=='g') printf("%s",datestr(4,moni.logout));
				else if (ch=='h') printf("%d",moni.msg);
				else if (ch=='j') printf("%6d",moni.pfnum);
				else if (ch=='k') printf("%s",datestr(43,how_old(moni.login)));
				else if (ch=='l') {
					strcpy(buff,no_spc(moni.tty));
					strchng2(buff,"tty","");
					strchng2(buff,"dev","");
					strchng2(buff,"pts","t");
					printf("%-3.3s",buff);
				}
				else if (ch=='m') {
					if (moni.mode==99) printf("Àá¼ö");
					else if (moni.msg) printf("°ÅºÎ");
					else if (bit(moni.mode2,3)) printf("°ÔÀÓ");
					else printf(awork[moni.mode>29?29:moni.mode]);
				}
				else if (ch=='n') {sprintf(buff,"%3d",how_old(moni.login)/60);printf("%3.3s",buff);}
				else if (ch=='p') printf("%-8s",moni.name);
				else if (ch=='x') allmode2=set_bit(allmode2,1,1);
				else {
					iii--;
					if (is_same(tty,moni.tty)&&moni.hostno==cfg.hostno)
						printf("[7m%-8.8s[0;1m",moni.id);
					else
						printf("%-8.8s",moni.id);
				}
			}
			else if (strcmp(str,"!µ¿½Å!")==0) {
				bzero(str,20);str[0]=ss[iii++];str[1]=ss[iii++];n=atoi(str);
                     if (n== 0) printf("%d",cpf.num);
                else if (n== 1) printf("%s",cpf.id);
                else if (n== 2) printf("%s",cpf.name);
                else if (n== 3) printf("%d",cpf.type);
				else if (n== 4) printf("%s",ccfg.atype[cpf.type]);
				else if (n== 5) printf(who>=1?datestr(0,pf2.birthday):"********");
				else if (n== 6) printf("%c",pf2.sex);
				else if (n== 7) printf(who>2?pf2.id_no:"********");
				else if (n== 8) printf("%s",who>=1?pf2.post:"****");
				else if (n== 9) printf("%s",who>=1?pf2.addr1:"****");
				else if (n==10) printf("%s",who>=1?pf2.tele:"****");
				else if (n==11) printf("%s",who>=1?pf2.offi:"****");
				else if (n==20) printf("%s",datestr(2,cpf.inday ));
				else if (n==22) printf("%s",datestr(2,cpf.logout));
                else if (n==23) printf("%d",cpf.all_log);
                else if (n==24) printf("%d",cpf.countw);
                else if (n==25) printf("%d",cpf.countu);
                else if (n==26) printf("%d",cpf.countd);
				else if (n==27) printf(datestr(3,cpf.all_time));
				else if (n==31) printf(ccfg.disp_memo1?ccfg.memo1:"");
				else if (n==32) printf(ccfg.disp_memo2?ccfg.memo2:"");
				else if (n==33) printf(ccfg.disp_memo3?ccfg.memo3:"");
				else if (n==34) printf(ccfg.disp_memo4?ccfg.memo4:"");
				else if (n==35) printf(ccfg.disp_memo5?ccfg.memo5:"");
				else if (n==41) printf(ccfg.disp_memo1?cpf.memo1:"");
				else if (n==42) printf(ccfg.disp_memo2?cpf.memo2:"");
				else if (n==43) printf(ccfg.disp_memo3?cpf.memo3:"");
				else if (n==44) printf(ccfg.disp_memo4?cpf.memo4:"");
				else if (n==45) printf(ccfg.disp_memo5?cpf.memo5:"");
			}
			else printf(str);
		}
	}
	_quit:
	fflush(NULL);
	return (ret);
}


view_text(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	view_text_(20,buff);
}

view_text5(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	view_text_(-20,buff);
}

view_text_line(char *filename,int line) {view_text_(line,filename);}

view_text_(int mode,char *filename)
{
	char c, s[10];
	int line=0;
	int tline=0;
	int ii=0,key,len,linemode=No;
	FILE *fp;

	tline=count_line(filename);
	len=file_size(filename);
	if (mode<0) {linemode=Yes;mode*=-1;}  //Ãâ·Â½Ã ÁÙ¹øÈ£µµ Ãâ·Â

	re_view:
	line=0;
	if ((fp=fopen(filename,"r"))==NULL) return No;
	key=No;
	ii=0;
	if (linemode) printf("%5d ",line+1);
	while (ii++<len) {
		c=getc(fp);
		putchar(c);
		if (mode>0&&c=='\n') {
			line ++;
			if (line % mode ==0) {
				s[0]=0;
				printf(" ####(P%d/%d) °è¼Ó[ENTER] ÁßÁö(Q) ´Ù½Ã(R) ¿¬¼Ó(S) ´Ù¿î(D) ÀçÃâ·Â(A) >>",line/mode,tline/mode+1);
				lineinput(s,5);check_han(s);printf("[80D[2K");
				if (s[0]=='r'||s[0]=='R') { ii=0;line=0;rewind(fp);}                if (s[0]=='a'||s[0]=='A') { ii=0;line=0;rewind(fp);mode=99999;}
				if (is_char("PpQqXx",s[0])) {key=Yes;break;}
				if (s[0]=='S'||s[0]=='s') mode=99999;
				if ((s[0]=='D'||s[0]=='d')) {
					set_statdown(8);	   //¸Þ¼¼Áö ¼ö½Å¹æÁö
					sz_file(filename);
					set_statdown(OLD_MONI_MODE);
				}
			}
			if (linemode) printf("%5d ",line+1);
		}
	}
	if (!key) {
		printf("[80D[2K #### ³»¿ëÀÇ ³¡ÀÔ´Ï´Ù. [ENTER] ´Ù½Ã(R) ÀçÃâ·Â(A) >>");
		lineinput(s,5);check_han(s);
		if (s[0]=='r'||s[0]=='R') { line=0;rewind(fp);goto re_view;}
		if (s[0]=='a'||s[0]=='A') { line=0;rewind(fp);mode=99999; goto re_view;}
	}
	fclose(fp);
	return Yes;
}


view_text1(char *filename)
{
	char c;
	FILE *fp;
	if ((fp=fopen(filename,"r"))==NULL) return No;
	while (!feof(fp)&&(c=fgetc(fp))!=0&&c!=-1) putchar(c);
	fclose(fp);
	return Yes;
}

view_text2(char *filename)
{
	char buff[300];
	FILE *fp;
	int i=0;
	if ((fp=fopen(filename,"r"))==NULL) return;
	while (fgets(buff,200,fp)!=NULL) {
		printf(buff);
		if (i++%20==19) getchar();
	}
	fclose(fp);
	if (i++%20!=0) getchar();
}


view_textxy(char *filename,int x,int y)
{
	char buff[300];
	FILE *fp;

	if ((fp=fopen(filename,"r"))==NULL) return;

	while (fgets(buff,200,fp)!=NULL)
		if (buff[0]!=0) {
			xy(x,y++);
			printf("%s",buff);    //ÇØ´çµÇ´Â ÁÙÀ» º¸¿©ÁÜ
		}
	fclose(fp);
}



view3(char *buff)
{
	return view_(3,"",buff);
}


char *gd_name(int mark)
{
	int i2;
	static char buff[30];
	strcpy(buff,"");
	for (i2=0;i2<10;i2++) {
		if ((int)acolor[i2].mark==(int)mark) {
			strcpy(buff,acolor[i2].name);
			break;
		}
	}
	return (buff);
}


/* ·Î°íÈ­ÀÏ Ãâ·Â */
//È­ÀÏÀÖÀ¸¸é 1 ¾øÀ¸¸é 0 return
view2(char *filename)
{
	int ret=No;
	ret=view(filename);
	if (ret) pressenter();
	return ret;
}


/* ¸Þ´ºÀÇ ·Î°íÈ­ÀÏ Ãâ·Â */
//È­ÀÏÀÖÀ¸¸é 1 ¾øÀ¸¸é 0 return
view_logo(char *go_code)
{
	char filename[80];
	int ret=No;
	sprintf(filename,"%s/logo/%s.mnu",club_go.dir,go_code);
	ret=view(filename);
	return ret;
}


//È­ÀÏÀÖÀ¸¸é 1 ¾øÀ¸¸é 0 return
logo(char *filename,int stop)
{
	int ret=No;
	char buff[80];
	strcpy(buff,filename);
	if (empty(buff)) sprintf(buff,"logo/%s.mnu",go.code);
	ret=view(buff);
	if(ret&&stop&&!nostop) getchar3();
	return (ret);
}


//°Ô½ÃÆÇ ÀÚ·á¼ö¸¦ return ÇØÁØ´Ù.
char *b_num(char *gocode,int mode)
{
	FILE *fp;
	static char buff[50];
	char query[500],last_date[100],table_name[100],title[200];
	int now_num,n1,n2,n3;
	int newnum,allnum;
	MYSQL *sock,mysql;
	MYSQL_RES	*qres;
	MYSQL_ROW	qrow;

	newnum=allnum=0;
    sock=mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
    if ((mysql_select_db(sock, DB_CM)) == -1) {
        printf("## ERR 3431: %s\n",mysql_error(sock));
		mysql_close(sock);
		return (buff);
	}
	allnum=1;
	strcpy(last_date,"");
	strcpy(title,"");
	strcpy(buff,"");
	sprintf(table_name,"%s_%s",club_go.code,gocode);
	sprintf(query,"SELECT total,last_date,name FROM bcfg where table_name='%s' limit 1",table_name);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres))!=NULL) {
			if (qrow[0]) allnum=atoi(qrow[0]);
			if (qrow[1]) strncpy(last_date,qrow[1],16);
			if (qrow[2]) strcpy(title,qrow[2]);
		}
		mysql_free_result(qres);
	}
		 if (mode== 0) sprintf(buff,"%3d",allnum);
	else if (mode== 1) sprintf(buff,"%4d",allnum);
	else if (mode== 2) sprintf(buff,"%5d",allnum);
	else if (mode== 3) sprintf(buff,"%d",allnum);
	else if (mode== 4) sprintf(buff,"%s",last_date);
	else if (mode== 5) sprintf(buff,"%s",title);
	else if (mode== 6) sprintf(buff,"%8.8s",title);
	else			   sprintf(buff,"");
	return (buff);
}



