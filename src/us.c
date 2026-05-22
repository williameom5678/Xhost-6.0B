#include "bbs.h"
//±¸Á¶Ã¼¸¦ º¯¼ö·Î ³Ñ±â¹Ç·Î ->¿¬»êÀÚ¸¦ »ç¿ëÇØ¾ßÇÔ
int comp1(MONI *moni1,MONI *moni2) {
    return (moni1->login-moni2->login);
}

#include <dirent.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä
#define AMONI_MAX 1000
MONI amoni[AMONI_MAX];
int amoni_count;
view_user(int mode,int mode2,char *tid)
{
	FILE *fp;
	DIR *dp;
    struct dirent *dfp;
    char buff[350],filename[100],buffstr[350],buffstr1[350],buffstr2[350];
	char cont=No;
    char not_stop=No;
    int  found,i,ii,ihostno=0,n,i2,count=0,maxline,key,select_mode=No,test_mode=No;
    int  mode3;
    time_t t;
    MONI moni2;
    PF nowpf;


    nowpf=pf;
    amoni_count=0;
    time(&t);
    bzero(&amoni,sizeof(amoni));
    for (i=0;i<AMONI_MAX;i++) amoni[i].login=t+10000;

    allmode2=set_bit(allmode2,1,0);
    if (mode==1&&cfg.usdisp>0) mode=cfg.usdisp;
		 if (is_same(go.code,"chat")) mode3=2;
	else if (club_mode) 			  mode3=1;
	else							  mode3=0;

    if (mode>9980) select_mode=Yes;
    mode%=10;
    if (mode2==8) {mode2=1;test_mode=Yes;}
    if (mode2==9) {mode2=1;not_stop=Yes;}
	if (mode3==0&&bit(cfg.usermode,1)) return;
	if (mode3==1&&bit(cfg.usermode,3)) return;
	if (mode3==2&&bit(cfg.usermode,3)) return;
	if (nowpf.type<16&&mode>=8) mode=1; //	µî±Þ16¹Ì¸¸ÀÌ mode18,19»ç¿ë
    if (cfg.usdisp>=30) mode=cfg.usdisp%10;
	if (mode<1) mode=1;

	//Ãâ·Â¾ç½ÄÀÐ¾î¿À±â
    strcpy(buffstr,"");strcpy(buffstr1,"");strcpy(buffstr2,"");
    sprintf(buff,"forum/main/frm/us/us%d.frm",mode);
    if (!is_file(buff)) sprintf(buff,"forum/main/frm/us/us.frm");
	file2buff(buffstr,buff,300);
    if ( mode==4||mode==5||mode==6 ) {
        sprintf(buff,"forum/main/frm/us/us%d-1.frm",mode);
        file2buff(buffstr1,buff,300);
        sprintf(buff,"forum/main/frm/us/us%d-2.frm",mode);
        file2buff(buffstr2,buff,300);
    }

	maxline=20;
	if (mode>2&&mode<8) maxline=10;

    view("forum/main/frm/us/us.log");
    if (!view("forum/main/frm/us/us%d.top",mode)) view("forum/main/frm/us/us.top");
    i=atoi(tid);
    if (i>0&&i<99) {ihostno=i;strcpy(tid,"");}
    amoni_count=0;

    dp= opendir("user/moni/");
    while((dfp= readdir(dp)) != NULL) {
       if(strncmp(dfp->d_name,"user.",5)!=0) continue;
        sprintf(filename,"user/moni/%s",dfp->d_name);
        if ((fp=fopen(filename,"r"))==NULL) continue;
        fseek(fp,400,SEEK_SET);
        fread(&moni,sizeof_moni,1,fp);
        fclose(fp);
        found=Yes;
        sprintf(buff,"/dev/%s",moni.tty);
        ii=how_old_file(buff);
        //mess("%s id:%s time:%d pid:%d found=%d",buff,moni.id,ii,moni.pid,found);
        i2=moni.offmin*60;
        if (i2<1) i2=30*60;
        if (moni.type>17) i2=12*60*60;
        if (moni.hostno==cfg.hostno&&ii>i2) {
            found=No;
            if (moni.pid>100) {
                kill(moni.pid,SIGKILL);
                sprintf(buff,"rm -rf tmp/up%d%s",cfg.hostno,no_spc(moni.tty));
                system(buff);
            }
            unlink(filename);
        }

        if (found) amoni[amoni_count++]=moni;
    }
	closedir(dp);

    qsort(amoni,AMONI_MAX,sizeof(amoni[0]),comp1);

    for (i=0;i<amoni_count;i++) {
        moni=amoni[i];
        if (moni.mode<1||strlen(moni.id)<3||strlen(moni.tty)<1) continue;
        strcpy(pf.id,moni.id);
        strcpy(pf.name,moni.name);
        if ((i+1)<=99)  sprintf(g_buff4,"%2d.",i+1);
        else            sprintf(g_buff4,"%3d",i+1);
        sprintf(g_buff3,"%2d",i+1);
        sprintf(g_buff1,"%3d",i+1);
        if (mode==4) {
            if (i%4==0)       view3(buffstr1);  //Ã¹Ä­
            else if (i%4==3)  view3(buffstr2);  //¸¶Áö¸·
            else              view3(buffstr);   //°¡¿îµ¥
        }
        else if (mode==5) {
            if (i%5==0)       view3(buffstr1);  //Ã¹Ä­
            else if (i%5==4)  view3(buffstr2);  //¸¶Áö¸·
            else              view3(buffstr);   //°¡¿îµ¥
        }
        else if (mode==6) {
            if (i%3==0)       view3(buffstr1);  //Ã¹Ä­
            else if (i%3==2)  view3(buffstr2);  //¸¶Áö¸·
            else              view3(buffstr);   //°¡¿îµ¥
        }
        else {
            view3(buffstr);     //Ãâ·Â¾ç½ÄÃâ·Â
        }
        key=No;
        if (!not_stop&&!cont) {
            if (mode==4) {
                if (i%80==79) key=Yes;
            }
            else if (mode==5) {
                if (i%100==99) key=Yes;
            }
            else if (mode==6) {
                if (i%60==59) key=Yes;
            }
            else if (i%maxline==(maxline-1)) key=Yes;
            if (key) {
                if (!view("forum/main/frm/us/us%d.pag",mode)) view("forum/main/frm/us/us.pag");
                lineinput(buff,30);check_han(buff);printf("[80D[2K");
                if (is_same(buff,"q")||is_same(buff,"p")||
                    is_same(buff,"n")||is_same(buff,"x") ) {i=0;break;}
                else if (is_same(buff,"s")) cont=Yes;
                else if (strlen(buff)>0) {
                    strcpy(auto_cmd,buff);
                    break;
                }
            }
		}
	}
    allmode2=set_bit(allmode2,1,0);
    pf=nowpf;
    if (mode==4&&i>0&&i%4!=0) view("forum/main/frm/us/us%d-%d.end",mode,i%4);
    if (mode==5&&i>0&&i%5!=0) view("forum/main/frm/us/us%d-%d.end",mode,i%5);
    if (mode==6&&i>0&&i%3!=0) view("forum/main/frm/us/us%d-%d.end",mode,i%3);
    if (!view("forum/main/frm/us/us%d.end",mode)) view("forum/main/frm/us/us.end");
    if (select_mode) return;
    view("forum/main/frm/us/us.bye");
}



//ÇØ´çID ¼±ÅÃÇÑµÚ MONI¿¡ ÀúÀå
sel_user(char *filename)
{
	FILE *fp;
    char buff[350],buff2[100],buffstr[350];
    char tid[30];
    int  i,n,i2;
	int  found=No;

    strcpy(auto_cmd,"");
    view_user(0,0,""); //¼±ÅÃ¸ðµå
	//¼±ÅÃ
	_select:
    strcpy(tid,"");strcpy(buff,"");
    if (!view(filename)) printf(" ¹øÈ£ ¶Ç´Â ID¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä >>");
    if (strlen(auto_cmd)>0) {strcpy(buff,auto_cmd);printf(auto_cmd);}
    else {
        lineinput(buff,30);
        if (strlen(buff)<1|is_quit(buff)) {
            strcpy(moni.id,"");
            printf("\n");
            return No;
        }
    }
    check_han(buff);printf("\n");
    strcpy(tid,buff);
    strcpy(moni.id,"");
    strcpy(g_id,"");strcpy(g_name,"");

    found=No;
    _cont2:
    n=atoi(tid);
    if (is_same(tid,"q")||is_same(tid,"p")||is_same(tid,"/q"))  return No;
    if (is_same(tid,"x")||is_same(tid,"xx")||is_same(tid,"/x")) return No;
    if (strlen(tid)<1||(n==0&&strlen(tid)==1)) goto _select;

    if (strlen(tid)>=3) {
        for (i=0;i<amoni_count;i++) {
            if (!is_same(amoni[i].id,tid)) continue;
            moni=amoni[i];
            found=Yes;
            break;
        }
    }
    if (!found&&n>0&&n<=amoni_count) {
        if (strlen(amoni[n-1].id)<3) goto _select;
        moni=amoni[n-1];
        found=Yes;
    }
    strcpy(g_id,moni.id);
    if (!found) {
        moni.mode=0;
        if (read_pf2(tid)) {
            strcpy(moni.id,pf2.id);
            strcpy(moni.name,pf2.name);
            strcpy(g_id,pf2.id);
            strcpy(g_name,pf2.name);
            found=Yes;
        }
        else {
            strcpy(moni.id,tid);
            strcpy(g_id,tid);
            view("forum/main/frm/us/sus.err");
        }
		if (strlen(tid)<3) strcpy(tid,"");
	}
    strcpy(auto_cmd,"");
    return found;
}


//return 0: ¾øÀ½  1:¾ÆÀÌµð ÀÖÀ½  2:¸ÞÀÏ¼ö½Å°ÅºÎ  3:¸Þ¼¼Áö¼ö½Å°ÅºÎ
is_moni(char *tid)
{
	FILE *fp;
	DIR *dp;
    struct dirent *dfp;
    char filename[100];
    MONI moni2;

    dp= opendir("user/moni/");
    while((dfp= readdir(dp)) != NULL) {
        if(strncmp(dfp->d_name,"user.",5)!=0) continue;
        sprintf(filename,"user/moni/%s",dfp->d_name);
        if ((fp=fopen(filename,"r"))!=NULL) {
            fseek(fp,400,SEEK_SET);
            fread(&moni2,sizeof_moni,1,fp);
            fclose(fp);
            if (strcmp(moni2.id,tid)==0) {
                moni=moni2;
                closedir(dp);
                return moni.mode;
            }
        }
    }
	closedir(dp);
    return No;
}


