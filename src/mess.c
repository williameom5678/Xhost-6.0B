// ¸Ş¼¼Áö Àü¼Û°ü·Ã
#include <fcntl.h>
#include <stdarg.h>
#include <dirent.h>    //µğ·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä
#include "bbs.h"

//¸Ş¼¼Áö Àü¼ÛÀÇ Á¾·ù
//say  ÀÏ¹İÀü¼Û
//mm   ¸Ş¼¼ÁöÀü¼Û
////   ¸¶Å©·ÎÀü¼Û

//ÇØ´çÆ÷Æ® 1ÁÙ ¸Ş¼¼Áö¸¦ º¸³½´Ù.
message(const char *fmt,...)
{
	char filename[250];
	char mess[400];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(mess,fmt, ap);
	va_end(ap);
	if (strlen(mess)>0) {
		sprintf(filename,"user/message/%s.mes",no_spc(tty));
		buff2file(mess,filename);
	}
    fflush(NULL);
}

//ÇöÀç ¸Ş´ºÀÇ ÀüÃ¼ ÀÌ¿ëÀÚ¿¡°Ô ±Ó¼Ó¸» ÀüÇÏ±â
//mode==0:ÀüÃ¼È¸¿ø 1:ÇöÀçµ¿È£È¸ ÀüÃ¼ 2:¼Õ´ÔÀüÃ¼ 3:È¸¿øÀüÃ¼
//		4:ÇöÀç ¸Ş´º ÀüÃ¼È¸¿ø¿¡°Ô 8.¹Ù·Î º¸³¿ 9:ÁöÁ¤µÈÈ¸¿ø¿¡°Ô
to_all_say(int mode,int mode2,char *buffstr)
{
	FILE *fp;
	char toid[9];
	char messbuff[300],buff[300],filename[100];
	MONI amoni[1500];
	int first;
    int i,ii,n,count,found;
	DIR *dp;
    struct dirent *dfp;

	strcpy(toid,"");
    if (pf.type<cfg.allsay) {mess("ÀüÃ¼¸Ş¼¼Áö »ç¿ëµî±ŞÀÌ ¾Æ´Õ´Ï´Ù.");return;}

	check_cmd(buffstr);
	for (i=0;i<1500;i++) strcpy(amoni[i].id,"");
	//¾ÆÀÌµğ ÁöÁ¤¾ÈµÇÀ»¶§ ¼±ÅÃÇØ¼­ Àü¼Û °¡´É¿©ºÎ¸¦ È®ÀÎÇØ¼­ moni¿¡ ÀúÀå

    dp= opendir("user/moni/");
	count=0;
    while((dfp= readdir(dp)) != NULL) {
       if(strncmp(dfp->d_name,"user.",5)!=0) continue;
        sprintf(filename,"user/moni/%s",dfp->d_name);
        if ((fp=fopen(filename,"r"))==NULL) continue;
        fseek(fp,400,SEEK_SET);
        fread(&moni,sizeof_moni,1,fp);
        fclose(fp);
        if (strlen(moni.tty)==0||strlen(moni.id)<3||moni.mode==0) continue;
        sprintf(buff,"/dev/%s",moni.tty);
        ii=how_old_file(buff);
        if (ii>60*60) continue;
        if (moni.msg) continue;
        if ((moni.mode==5||moni.mode==6||moni.mode==8||
              moni.mode==14||moni.mode==16||moni.mode==18||moni.mode==19)) continue;
        if ( (mode==4&&is_same(moni.gocode,go.code)&&is_same(moni.club,club_go.code))||
             (mode==1&&is_same(moni.club)&&club_go.code)||
             (mode==2&&moni.type==0)||
             (mode==3&&moni.type>0)||
             (mode==8)||
             (mode==0) ) {
            found=No;
            for (i=0;i<count;i++) {
                if (amoni[i].hostno==moni.hostno&&is_same(amoni[i].tty,moni.tty)) {
                    found=Yes;
                    break;
                }
            }
            if (!found) amoni[count++]=moni;
        }
    }
	closedir(dp);


	_cont0:
	if (count<1) {printf("\n ## Àü¼Û´ë»ó¾øÀ½\n");goto _endsay;}

	first=Yes;
	printf("Àü¼Û´ë»ó: ");
	for (i=0;i<count;i++) {
		printf("%-8s ",amoni[i].id);
		if (i%6==5) printf("          ");
	}
	if (i%6!=0) printf("\n");
    view("forum/main/frm/say/allsay.mes");
	printf("ÀüÃ¼¸Ş¼¼Áö>",buff);
	lineinput(buff,250);check_han(buff);printf("\n");
	if (strlen(buff)<3) goto _endsay;
	if	(bit(cfg.mode,16)) sprintf(messbuff," %s[7m%-8s[m>>\"%s\"\n",first?"\n":"",pf.id,buff);
	else				   sprintf(messbuff," %s%-8s>>\"%s\"\n",first?"\n":"",pf.id,buff);

	//½ÇÁ¦ ¸Ş¼¼Áö Àü´Ş
	for (i=0;i<count;i++) {
		if (amoni[i].mode==3) { 	//´ëÈ­¹æ
			del_enter(messbuff);
			sprintf(buff,"7[21;1H\n[21;1H%s[23;1H8",messbuff);
			to_tty(amoni[i].hostno,amoni[i].tty,buff);		//´ëÈ­¹æÀÏ¶§
		}
		else to_tty(amoni[i].hostno,amoni[i].tty,messbuff);
	}
	_endsay:
    view("forum/main/frm/say/allsay.end");
	return;
}



//mode==2 : ´ëÈ­½Ç¿¡¼­.. º¸³¿	mode==3 ¹«Á¶°Ç º¸³¿(½Ã»ğÁøÀü¿ë)
//Æ¯Á¤ÀÌ¿ëÀÚ¿¡°Ô ±Ó¼Ó¸» ÀüÇÏ±â

to_say(int mode,char *idstr,char *buffmess)
{
	char outmess[300],buff[300],buffstr[300];
	char toid[9];
	char macro=No;

	strcpy(outmess,"");
	strcpy(buffstr,buffmess);
	strcpy(toid,idstr);
	strcpy(g_id,toid);
	strcpy(g_name,toid);
	if (guest_mode&&bit(cfg.chatmode,10)) {
        view("forum/main/frm/error/noguest.err");
		goto _fail;
	}
	if (mode!=0) re_print = Yes;
	check_cmd(buffstr);
	if (is_same(mmc[0],"to")) strcpy(mmc[0],"say");
	if (is_same(mmc[0],"/ear")) strcpy(mmc[0],"/say");
	if (is_same(mmc[0],"/mm")) strcpy(mmc[0],"/to");
	if (mmc[0][0]=='/') {
		if (!is_same(mmc[0],"/say")&&
			!is_same(mmc[0],"/in")&&
			!is_same(mmc[0],"/to")
			) macro=Yes;  //¸¶Å©·Î
	}
	if (mode==3&&(pf.type<18&&!in_file2("system/say2.id",pf.id))) mode=0;
	if (strlen(toid)<1) strcpy(toid,mmc[1]);
	strcpy(g_id,toid);
	if (strlen(g_name)<1) strcpy(g_name,moni.name);
	if (strlen(g_name)<1) strcpy(g_name,g_id);
	//¾ÆÀÌµğ ÁöÁ¤¾ÈµÇÀ»¶§ ¼±ÅÃÇØ¼­ Àü¼Û °¡´É¿©ºÎ¸¦ È®ÀÎÇØ¼­ moni¿¡ ÀúÀå
	if (strlen(toid)<1) {
		if (mode==2) printf("[21;1H\n");  //´ëÈ­¹æ¿¡¼­ º¸³¿
        if (sel_user("forum/main/frm/say/say2.mes")) {      //È¸¿øUSÁ¤º¸
            strcpy(toid,moni.id);
            strcpy(g_id,moni.id);
            strcpy(g_name,moni.name);
            if (strlen(toid)<3||!is_moni(toid)) goto _fail;     //Á¢¼ÓÁßÀÌ ¾Æ´Ò¶§
            goto _found;
        }
        strcpy(toid,g_id);   //°Ë»ö½ÇÆĞ
        goto _fail;
	}
    if (strlen(toid)<3||!is_moni(toid)) goto _fail;     //Á¢¼ÓÁßÀÌ ¾Æ´Ò¶§
    //printf("%s %d",toid,is_moni(toid));
	strcpy(g_id,toid);

    if (read_pf2(g_id)) strcpy(g_name,pf2.name);
    _found:
	if (strlen(g_name)<1) strcpy(g_name,moni.name);
	if (strlen(g_name)<1) strcpy(g_name,g_id);
	buff2cmd(buffstr,outmess,2);	 //¸Ş¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ (¸Ş¼¼Áö ÃßÃâ)
	if (macro) {
		bzero(outmess,300);
		if (toid[0]==0) strcpy(toid,"È¸¿ø");
		if (!say_macro(outmess,buffstr,pf.id,toid)) {
			if (mode==2) printf("[21;1H\n");  //´ëÈ­¹æ¿¡¼­ º¸³¿
			printf(" %s ¸¶Å©·Î ¸í·ÉÀÌ ¾ø½À´Ï´Ù.\n",mmc[0]);
			return;
		}
	}

    //ÇØ´ç¾ÆÀÌµğ »ç¿ëÀÚ¿¡°Ô ¸Ş¼¼Áö¸¦ º¸³½´Ù.
    to_say_moni(mode,moni,outmess,macro);
	return;

	_fail:
	if (strlen(toid)<3) return;
    else if (read_pf2(toid)) {
        if (!view("forum/main/frm/say/notlog.mes")) printf("¸Ş¼¼ÁöÀü¼Û¸¦ º¸³¾¼ö ¾ø½À´Ï´Ù. ÂÊÁö¸¦ ³²±æ±î¿ä?>>");
		if (yesno2("",Yes)) to_memo(mode,toid,"");
		printf("\n");
	}
	else {
        view("forum/main/frm/say/notid.mes");
	}
	return;
}


//mode==2 : ´ëÈ­½Ç¿¡¼­.. º¸³¿	mode==3 ¹«Á¶°Ç º¸³¿(½Ã»ğÁøÀü¿ë)
to_say_moni(int mode,MONI moni,char *outmess,int macro)
{
	char messbuff[300],buff[300];
	char buff1[200];
	int first,say_count;

	first=Yes;
	say_count=0;

    strcpy(g_id,moni.id);
    strcpy(g_name,moni.name);

    if (strlen(outmess)==0&&!macro) {
        view("forum/main/frm/say/saymes.mes");
	}
	while (1) {
        strcpy(buff,"");
		say_count++;
//		  printf("***%d %d %d***",cfg.sayline,say_count,macro);
		if (cfg.sayline>0&&say_count>cfg.sayline) goto _endsay;
		if (cfg.sayline==255) goto _endsay;
        if (strlen(outmess)==0) {
			if (mode==2) printf("[23;1H");
            printf("%-10.10s¢Ğ ",moni.id);
			lineinput(buff,250);check_han(buff);printf("\n");
			if (buff[0]=='\\'&&buff[1]=='/') {buff[0]=' ';all_trim(buff);}
		}
		else {
			strcpy(buff,outmess);
		}
		if (strlen(buff)<1||is_same(buff,".")||
			is_same(buff,"q")||is_same(buff,"p")||is_same(buff,"/q")) break;
        sprintf(messbuff,"%-10.10s¢Ñ\"%s\"\n",pf.id,buff);

		//¼±ÅÃÈ¸¿øÀÇ ID,TTY¸¦ »Ì¾Æ¼­ moni·Î ÀúÀå
		if (first) { //Ã³À½º¸³»¸é \n º¸³¿
            if (!to_moni(mode,moni,"\n")) goto _failsay;
            first=No;
		}
		if (is_char(messbuff,'$')) strchng2(messbuff,"$#","$ #");
        if (!to_moni(mode,moni,messbuff)) goto _failsay;
		if (macro||strlen(outmess)>0) break;
	}

	_endsay:
    if (say_count>1) view("forum/main/frm/say/sayend.mes");
	if (mode==2) printf("[21;1H\n");
	if (mode!=2&&macro) printf("\n %s\n",outmess);
	if (mode!=2) printf("\n\n\n");
	return;

	_failsay:
	if (mode==2) printf("[s[21;1H\n");
    view("forum/main/frm/say/sayfail.mes");
    if (mode==2) printf("[23;3H[u");
	return;
}

//mode==2 : ´ëÈ­½Ç¿¡¼­.. º¸³¿	mode==3 ¹«Á¶°Ç º¸³¿(½Ã»ğÁøÀü¿ë)
//Æ¯Á¤ÀÌ¿ëÀÚ¿¡°Ô ±Ó¼Ó¸» ÀüÇÏ±â
to_say_tty(int mode,char *toid,char *outmess,int macro)
{
	char messbuff[300],buff[300];
	char buff1[200];
	int first,say_count;
	PF old_pf2;
	old_pf2=pf2;

	first=Yes;
	say_count=0;

	strcpy(g_id,toid);
    if (read_pf2(g_id)) strcpy(g_name,pf2.name);
	if (strlen(g_name)<1) strcpy(g_name,toid);
	if (outmess[0]==0&&!macro) {
        view("forum/main/frm/say/saymes.mes");
	}
	while (1) {
		say_count++;
//		  printf("***%d %d %d***",cfg.sayline,say_count,macro);
		if (cfg.sayline>0&&say_count>cfg.sayline) goto _endsay;
		if (cfg.sayline==255) goto _endsay;
		if (outmess[0]==0) {
			if (mode==2) printf("[23;1H");
			sprintf(buff," [%s]",toid);
			printf(" %-10s>",buff);
			lineinput(buff,250);check_han(buff);printf("\n");
			if (buff[0]=='\\'&&buff[1]=='/') {buff[0]=' ';all_trim(buff);}
			if (strlen(buff)>3&&buff[0]=='/'&&buff[1]=='/') {
				strcpy(buff1,&buff[2]);
				strcpy(auto_cmd,buff1);
				printf("\n\n\n");
				return;
			}
		}
		else {
			strcpy(buff,outmess);
		}
		if (strlen(buff)<1||is_same(buff,".")||
			is_same(buff,"q")||is_same(buff,"p")||is_same(buff,"/q")) break;
		if	(bit(cfg.mode,16)) sprintf(messbuff," {[7m%-8s[m}\"%s\"\n",pf.id,buff);
		else				   sprintf(messbuff," {%-8s}\"%s\"\n",pf.id,buff);

		//¼±ÅÃÈ¸¿øÀÇ ID,TTY¸¦ »Ì¾Æ¼­ moni·Î ÀúÀå
		if (first) { //Ã³À½º¸³»¸é \n º¸³¿
			sprintf(buff,"%c\n",bit(pf2.mymode,23)?"\007":"");
            if (!to_moni(mode,moni,buff)) goto _failsay;
			first=No;
		}
		if (is_char(messbuff,'$')) strchng2(messbuff,"$#","$ #");
        if (!to_moni(mode,moni,messbuff)) goto _failsay;
		if (macro||strlen(outmess)>0) break;
	}

	_endsay:
	strcpy(g_id,toid);
    if (read_pf2(g_id)) strcpy(g_name,pf2.name);
	else				strcpy(g_name,g_id);
    if (say_count>1) view("forum/main/frm/say/sayend.mes");
	if (mode==2) printf("[21;1H\n");
	if (mode!=2&&macro) printf("\n %s\n",outmess);
	if (mode!=2) printf("\n\n\n");
	pf2=old_pf2;
	return;

	_failsay:
	if (mode==2) printf("[s[21;1H\n");
    view("forum/main/frm/say/sayfail.mes");
	if (mode==2) printf("[23;3H[u");
	pf2=old_pf2;
	return;
}

//Æ¯Á¤ÀÌ¿ëÀÚ¿¡°Ô ÂÊÁö ÀüÇÏ±â
to_memo(int mode,char *idstr,char *buffstr)
{
	FILE *fp;
	char toid[20];
	char buff[700];
	char filename[300];

	char messbuff[700];
	char buff3[101][300];
	int i,count;

	strcpy(messbuff,buffstr);  //¸Ş¼¼Áö ºĞ¼®
	for (i=0;i<100;i++) strcpy(buff3[i],"");
	if (guest_mode&&bit(cfg.chatmode,11)) {
        view("forum/main/frm/say/noguest.mes");
		return No;
	}
	if (strlen(idstr)>3) strcpy(mmc[1],idstr);
	if (strlen(mmc[1])<3) {  //¾ÆÀÌµğ ÁöÁ¤¾ÈµÊ
		if (mode==2) printf("[21;1H\n");  //´ëÈ­¹æ¿¡¼­ º¸³¿
        sel_user("forum/main/frm/say/memo1.mes");
		strcpy(mmc[1],moni.id);
		strcpy(toid,moni.id);
	}
	strcpy(toid,mmc[1]);
	if (strlen(toid)<3) goto _fail;
    if (!read_pf2(toid)) {
		printf("\n ### [%s] È¸¿øÀ» Ã£À»¼ö ¾ø½À´Ï´Ù.",toid);
		goto _fail;
	}
	strcpy(g_id,pf2.id);
	strcpy(g_name,pf2.name);

	count=0;
	//ÇØ´çµÇ´Â ¾ÆÀÌµğ¿¡ ÂÊÁö ³²±â±â
	if (strlen(messbuff)>0) {
		strcpy(buff3[0],messbuff);
		count=1;
	}
	else {
        view("forum/main/frm/say/tomess5.mes");
		count=0;
		for (i=0;i<99;i++) {
			printf("\n%2d.",i+1);lineinput(buff,290);check_han(buff);
			if (is_same(buff,"q")||is_same(buff,"p")||is_same(buff,"/q")) {
                view("forum/main/frm/say/tomess6.mes");
				return No;
			}
			if (buff[0]==0||is_same(buff,".")) break;
			strcpy(buff3[i],buff);
			count++;
		}
	}
	if (count<1) goto _fail;
    sprintf(filename,"user/message/%s.id",toid);
    if ((fp=fopen(filename,"a+"))==NULL) {
        check_dir("user/message/");
        if ((fp=fopen(filename,"w+"))==NULL) return No;
    }
	fprintf(fp,"  [7m ¡¼ %s(%s)´ÔÀÌ ³²±ä ¸Ş¼¼Áö ¡½   %s [0;1m\n",pf.id,pf.name,now_str(39));     //¸Ş¼¼Áö ¹öÆÛ¿¡ ÀúÀå
	for (i=0;i<count;i++) {
		del_esc(buff3[i]);
		if (strlen(buff3[i])>0) {
			fprintf(fp,"%s\n",buff3[i]);     //¸Ş¼¼Áö ¹öÆÛ¿¡ ÀúÀå
		}
	}
	if (count>1) fprintf(fp," ........ ¸Ş¼¼Áö ³¡ .......\n");     //¸Ş¼¼Áö ¹öÆÛ¿¡ ÀúÀå
	fclose(fp);
	if (count>1) {
		sprintf(buff," ##%s ´ÔÀÇ ¸Ş¼¼Áö°¡ µµÂøÇß½À´Ï´Ù.%s",pf.id,bit(pf2.mymode,23)?"\007":"");
		to_mess(pf2.id,buff);
	}
	printf("\n ### %s(%s)´Ô²² ¸Ş¼¼Áö¸¦ ³²°å½À´Ï´Ù.\n",pf2.id,pf2.name);
	return Yes;
	_fail:
	printf("\n ### Ãë¼ÒµÇ¾ú½À´Ï´Ù.\n");
	return No;
}


//ÇØ´ç¾ÆÀÌµğ »ç¿ëÀÚ¿¡°Ô ¸Ş¼¼Áö¸¦ º¸³½´Ù.
to_mess(char *id,char *mess)
{
	char buff[1000];
	//id°Ë»ö->moni;
	if (!is_moni(id)) return No;
	if (moni.mode==3) sprintf(buff,"7[21;1H\n[21;1H%s[23;1H8",mess);
	else			  strcpy(buff,mess);
	to_tty(moni.hostno,moni.tty,buff);		//´ëÈ­¹æÀÏ¶§
	return Yes;
}


//ÇØ´ç¾ÆÀÌµğ »ç¿ëÀÚ¿¡°Ô ¸Ş¼¼Áö¸¦ º¸³½´Ù.
to_moni(int mode,MONI moni,char *messbuff)
{
	char outbuff[5000];
	char buff[5000];
	strcpy(outbuff,messbuff);
	if (strlen(messbuff)>1&&messbuff[strlen(messbuff)-1]!='\n') strcat(outbuff,"\n");
    if (pf.type<18&&is_id_up(mode,moni)) return No;
	if (moni.mode==3) { 	//´ëÈ­¹æ
		del_enter(outbuff);
		sprintf(buff,"7[21;1H\n[21;1H%s[23;1H8",outbuff);
		to_tty(moni.hostno,moni.tty,buff);		//´ëÈ­¹æÀÏ¶§
	}
	else to_tty(moni.hostno,moni.tty,outbuff);
	return Yes;
}

//ÇØ´ç¾ÆÀÌµğ°¡ ¾÷¶Ç´Â ¸Ş¼¼Áö ±İÁö ÀÎÁö¸¦ ÆÄ¾ÇÇÑ´Ù.
is_id_up(int mode,MONI moni)
{
	FILE *fp;
	int n,i,rec,found=No;
	char filename[100];
	if(moni.mode!=0&&(mode==3||moni.mode!=99)) {
		found=Yes;
	}
	if (!found) {
        view("forum/main/frm/say/notlog.mes");
	}
	else if (moni.mode==4||
		(moni.mode==5&&!bit(cfg.messmode,4))||
		moni.mode==6||
		moni.mode==8||
		moni.mode==14||
		(moni.mode==3&&bit(cfg.messmode,5))||
		(moni.mode==4&&bit(cfg.messmode,6))||
		(moni.mode==15&&bit(cfg.messmode,6))||
		(moni.mode==16&&bit(cfg.messmode,1))||
		moni.mode==19) {
        view("forum/main/frm/say/notsay%d.mes",moni.mode);
		return Yes;
	}
	else if (moni.msg)		 {
        view("forum/main/frm/say/notmsg.mes");
		return Yes;
	}
	return No;
}


say_macro(char *messbuff,char *cmd2,char *id1,char *id2)
{
	FILE *fp;
	char buff[1500];
	char buff1[1500];
	char buff2[1500];
	char cmd[100];
	int ret=No;
    sscanf(cmd2,"%s",cmd);
	strcpy(messbuff,"");
	if (strlen(cmd)<2||cmd[0]!='/') return No;
	strchng2(cmd,"/","");strchng2(cmd,"/","");

	//¸¶Å©·Î È­ÀÏÀĞ±â
    if ((fp=fopen("forum/main/frm/say/macro.txt","r"))==NULL) {
		printf("\n frm/say/macro.txt ¸¶Å©·Î ÆÄÀÏÀÌ ¾ø½À´Ï´Ù.");
		return ret;
	}
	while (fgets(buff,200,fp)!=NULL) {
		del_enter(buff);
		if (buff[0]!=0&&!is_char("#;",buff[0])&&strlen(buff)>6) {
			buff2buff1(buff,buff1,buff2);
			if (is_same(buff1,cmd)) {
				del_enter(buff2);
				strcpy(messbuff,buff2);
				strchng2(messbuff,"!me!",id1);
				strchng2(messbuff,"!to!",id2);
				ret=Yes;
				break;
			}
		}
	}
	fclose(fp);
	return ret;
}



//mode=0 ÀÏ¹İ(mess)  1:´ëÈ­¹æ (printf)
set_msg(int mode,char *buffstr) 	 //¸Ş¼¼Áö,ÃÊ´ë °¡´É ¿©ºÎ
{
	char buff[100];
	strcpy(buff,buffstr);del_esc(buff);
	buff[1]=0;
    if      (is_same(buff,"y")) pf.msg=No;
    else if (is_same(buff,"n")) pf.msg=Yes;
    else if (buff[0]==0)        pf.msg=!pf.msg;
    if (pf.msg) printf("## ÃÊ´ë(¸Ş¼¼Áö) ºÒ°¡ »óÅÂ·Î ÁöÁ¤ (MSG N) **\n");
    else        printf("## ÃÊ´ë(¸Ş¼¼Áö) °¡´É »óÅÂ·Î ÁöÁ¤ (MSG Y) **\n");
    fflush(NULL);
    if (!guest_mode) {
        MYSQL     *sock,mysql;
        MYSQL_RES *qres;
        MYSQL_ROW qrow;
        char query[500];
        sock = mysql_connect(&mysql,DB_HOST,DB_USER,DB_PASSWD);
        mysql_select_db(sock,DB_NAME);
        sprintf(query,"update user set msg='%d' WHERE id='%s'",pf.msg,pf.id);
        mysql_query(sock, query);
        mysql_close(sock);
	}
    set_stat(1,"");
    sleep(1);
    re_print=No;
}




to_tty(int hostno,char *stty,char *outmess)
{
	char buff[100];
	char bufftty[100];
	int fout;
	strcpy(bufftty,stty);
	strchng2(bufftty,"/dev/","");
	if (is_same(bufftty,"www")) {
		mess("WWW Á¢¼ÓÀÚ·Î ¸Ş¼¼Áö¸¦ Àü´ŞÇÒ¼ö ¾ø½À´Ï´Ù.");
		return No;
	}
//	  printf("¹Ş´Â»ç¶÷: HNO:%d  TTY:%s ¸Ş:'%s'\n",hostno,stty,outmess);
//	  printf("º¸³»´ÂÀÌ: HNO:%d  TTY:%s ID:'%s'\n",cfg.hostno,tty,pf.id);
	if (strlen(bufftty)<1) return No;
	if (cfg.count_server==1) hostno=cfg.hostno;
	if (cfg.hostno != hostno) {
		return (svr_send(hostno,stty,outmess));   //´Ù¸¥ ¼­¹ö·Î º¸³¿
	}
	sprintf(buff,"/dev/%s",bufftty);
	del_space(buff);
	fout = open(buff,O_WRONLY|O_NDELAY);
	if (fout==-1) {
		printf("\n\n ## **** %s ERROR. (¸Ş¼¼ÁöÀü¼Û½ÇÆĞ H:%d)****\n\n\n\n",buff,hostno);
		return No;
	}
	else {
		write(fout,outmess,strlen(outmess));
		close(fout);
	}
	return Yes;
}


to_tty2(int hostno,char *tty,char *outmess)
{
	char buff[100];
	int fout;
	del_space(tty);
	if (is_same(tty,"www")) return No;
	if (strlen(tty)<1) return No;
	if (cfg.count_server<=1) hostno=cfg.hostno;
	if (bit(cfg.messmode,7)||cfg.hostno != hostno)
		return (svr_send(hostno,tty,outmess));
	sprintf(buff,"/dev/%s",tty);
	fout = open(buff,O_WRONLY|O_NDELAY);
	if (fout != -1) {
		write(fout,outmess,strlen(outmess));
		close(fout);
		return Yes;
	}
	return No;
}

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

svr_send(int hostno, char *stty,char *message)
{
	char send_message[1010],bufftty[100],buff[200],buff1[200],buff2[200];	// Àü¼Û¿ë ¹öÆÛ
	int i,ii,sockfd ;					// ¼ÒÄÏ ¹øÈ£
	unsigned short int server_port=SERVER_PORT[0];
	struct sockaddr_in address; 	// ¼ÒÄÏ¿¡ »ç¿ëÇÒ ÁÖ¼Ò ±¸Á¶Ã¼
	int result=0, count;			// ClientÀÇ Á¢¼Ó ¼º°ø ¿©ºÎ Ç¥Çö
	char mess_file[128];
	int nwrite = -1;
	FILE *fp;

	strcpy(bufftty,stty);
	strchng2(bufftty,"/dev/","");
	if (cfg.count_server<=1) hostno=cfg.hostno;

	bzero(send_message,1010);
	if (strlen(message)>1000) message[1000]=0;
    sprintf(send_message,"\255\254\255M%-10s%s",bufftty,message);  // Àü¼Û¿ë ¹öÆÛ¿¡ ³»¿ë ÀúÀå
    sockfd=socket(AF_INET,SOCK_STREAM, 0) ;    // ¼ÒÄÏ »ı¼º
	address.sin_family = AF_INET ;		// ARPA Internet Protocol »ç¿ë
	sprintf(buff,"%s.%u",cfg.sip,cfg.nip[hostno%100]);  // ¹Ş´Â ¼­¹ö IP
	address.sin_addr.s_addr = inet_addr(buff);

    for (ii=0;ii<5;ii++) {
		count=0;
		result=0;
		while (count<5) {
			server_port=(unsigned short int)SERVER_PORT[count++];
			address.sin_port = htons(server_port) ; 	 // Port ¼³Á¤
			result=connect(sockfd,(struct sockaddr *)&address,sizeof(address));
            // Client¿¡ Á¢¼Ó ¿äÃ»
			if(result == -1) {
			usleep(10000); continue;}
			result=write(sockfd,send_message,sizeof(send_message));
            // Á¢¼Ó¿¡ ¼º°ø Çß´Ù¸é send_messageÀÇ ³»¿ë Àü¼Û
            if(result == -1) {msleep(1);continue;}
			break;
		}
		if (result != -1) break;
        msleep(3);
	}
	close(sockfd);	   // ¼ÒÄÏ ¼Ò¸ê
    if (result==-1) return No;
    return Yes;    // ¿Ï·á
}


