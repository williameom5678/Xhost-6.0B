//±âº»À¯Æ¿
#include "bbs.h"
#include <stdarg.h>
#include <dirent.h>    //µð·ºÅä¸® È­ÀÏ¸í º¯È¯ÇÔ¼ö¶§¹®¿¡ ÇÊ¿ä

int is_file(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	if (strlen(buff)<1) return No;
	return (access(buff,0)!=-1);
}

void check_dir(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	if (strlen(buff)>0&&!is_file(buff)) mkdir3(buff);
}


int view(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	if (bit(allmode,11)) {
		printf("*LOGO=%s(%dB)*",buff,file_size(buff));
		getchar();
	}
    if (strlen(buff)<1||buff[strlen(buff)-1]=='/') return No;
	return view_(1,buff,"",0);
}


mview(int mode,const char *fmt,...)
{
	char filename[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(filename,fmt, ap);
	va_end(ap);
	if (!is_file(filename)) return;
		 if (stristr(filename,".jpg")) view_jpg(filename,mode);
	else if (stristr(filename,".vtx")) view_vtx(filename,mode);
	else if (stristr(filename,".ra"))  view_ra(filename,mode);
	else if (stristr(filename,".rm"))  view_ra(filename,mode);
	else if (stristr(filename,".wav")) view_ra(filename,mode);
	else if (stristr(filename,".mp2")) view_ra(filename,mode);
	else if (stristr(filename,".mp3")) view_ra(filename,mode);
	else view(filename);
}


sys_tem(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	return sys_tem_(buff,1);
}

sys_tem2(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	return sys_tem_(buff,2);
}

sys_tem3(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	return sys_tem_(buff,3);
}


view_jpg(char *filename,int mode)
{
	char buff[200];
	if (is_file(filename)&&stristr(filename,".jpg")) {
		strcpy(buff,cfg.jpgstr);
		strconv3(buff);
		if (!bit(allmode,24)) view3(buff);		//printf("7\n8[5;5H");
		if (!bit(allmode,25)) sys_tem("%s '%s'",cfg.jpgsz,filename);
		else				  sys_tem("sz '%s'",filename);
		if (mode) getchar3();
	}
}


view_ra(char *filename,int mode)
{
	if (strlen(filename)>0&&is_file(filename)) {
		sys_tem("%s '%s'",cfg.sz,filename);
		if (mode) getchar3();
	}
}


view_vtx(char *filename,int mode)
{
	if (is_file(filename)) {
		printf(ESCVTX);
		view_text1(filename);
		if (mode) getchar3();
		printf(VTXOFF);
	}
}



yesno(char *mess,int defaultkey)
{
    char buff[10];
	int n;
	printf(mess);
	if (g_yes) {
		printf(g_yes?"Yes":"No");
		n=g_yes;
		g_yes=0;
		return n;
	}
	lineinput(buff,2);check_han(buff);
	if (strlen(buff)<1) return defaultkey;
	if (is_same(buff,"q")) return -1;
	if (is_same(buff,"a")) return -2;
	if (is_same(buff,"s")) return -3;
	if (is_same(buff,"n")) return No;
	if (is_same(buff,"0")) return 0;
	if (is_same(buff,"y")) return Yes;
	if (is_same(buff,"1")) return 1;
	return defaultkey;
}

yesno2(char *mess,int defaultkey)
{
	int ret;
	ret=yesno(mess,defaultkey);
	printf("\n");
	return (ret);
}

yesno3(char *filename,int defaultkey)
{
	int ret;
	view(filename);
	ret=yesno("",defaultkey);
	printf("\n");
	return (ret);
}

//¹®ÀÚ¿­¿¡ ÇØ´ç¹®ÀÚ°¡ Æ÷ÇÔµÇ¾î ÀÖ´Â°¡?
int is_char(char *s1,char c)
{
	int i=0;
	while (s1[i]) if (s1[i++]==c) return Yes;
	return (No);
}

int is_digit(char c)
{
	if (c<'0'||c>'9') return No;
	return Yes;
}


char *lwr(byte *str)
{
	static char buff[200];
	strcpy(buff,str);
	strlwr(buff);
	return (buff);
}


char *upr(byte *str)
{
	static char buff[200];
	strcpy(buff,str);
	strupr(buff);
	return (buff);
}


char *strlwr(byte *str)
{
	for(; *str ;str++)
	if(isupper(*str))
		*str=tolower(*str);
	return (str);
}


char *strupr(byte *str)
{
	for(; *str ;str++)
	if(islower(*str))
		*str=toupper(*str);
	return (str);
}




//µÎ°³ÀÇ ¹®ÀÚ°¡ ¿ÏÀüÈ÷ °°Àº°¡?
is_same(char *buff1,char *buff2)
{
	if (strcasecmp(buff1,buff2)==0) return Yes;
	return No;
}

//µÎ°³ÀÇ ¹®ÀÚ°¡ ¿ÏÀüÈ÷ °°Àº°¡?	  100ÀÚ¸¸ ºñ±³ÇÔ
is_same2(char *buff1,char *buff2)
{
	if (strcmp(buff1,buff2)==0) return Yes;
	return No;
}

//µÎ°³ÀÇ ¹®ÀÚ¿­À» Æ÷ÇÔ¿©ºÎÈ®ÀÎ Æ÷ÇÔµÇ¸é Yes
int stristr(const char *s1,const char *s2)
{
	int i=0,nn;
	char ss1[5000];
	char ss2[5000];
	if (s1[0]==0||s2[0]==0||(int)strlen(s1)<(int)strlen(s2)) return No;
	strcpy(ss1,s1);
	strcpy(ss2,s2);
	strlwr(ss1);
	strlwr(ss2);
	if (strstr(ss1,ss2)==NULL) return No;
	return Yes;
}


//°ø¹éÀ» ¾ø¾Ø´Ù
del_space(char *str)
{
	register int x,y;
	x=0;
	while (str[x]) {
		if (str[x] == ' '||str[x]=='\n') {
			y=x;
			while (str[y]) {
				str[y] = str[y+1];
				if (str[y]==0) break;
				y++;
			}
		}
		else x++;
	}
}


printfL0()
{
	printf("\n");
}
printfL1()
{
	printf("+---------+---------+---------+---------+---------+---------+---------+--------\n");
}
printfL2()
{
	printf(" ¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡¦¡\n");
}
printfL3()
{
	printf(" ¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬¦¬\n");
}



void gotoXY(int x,int y)  {
	printf("[%d;%dH",y,x);
}


empty(char *buff)
{ return (buff[0]==0);
}


pressenter()
{
	char buff[500];
	bzero(buff,200);
	_cont1:
	printf("[Enter] Å°¸¦ ´©¸£½Ê½Ã¿ä.");
    fflush(NULL);
	lineinput(buff,400);
	printf("\n");
	if (strlen(buff)>0&&is_esc(buff)) goto _cont1;
}

clrscr()
{
	printf("\033[2J\033[;H");
    fflush(NULL);
}



cls()
{
	printf("\033[2J\033[;H");
    fflush(NULL);
}


//ESC,°ø¹é,Enter¸¦ ÀüºÎÁ¦°ÅÇÑ´Ù.
del_clear(char *buff)
{
	int i,n;
	char buff2[300];
	byte nn,a,b,c;
	i=0;
	n=0;
	a=32;
	b=126;
	c=160;
	while (buff[i]!=0) {
		nn=(byte)buff[i];
		if (((nn>=a&&nn<=b)||nn>=c)&&nn!='\n'&&nn!=' ')
			 buff2[n++]=buff[i];
		i++;
	}
	buff2[n]=0;
	strcpy(buff,buff2);
}


is_esc(unsigned char *buff)
{
	int i,n,ret=No;
	byte nn,a,b,c;
	i=0;
	n=0;
	a=32;
	b=126;
	c=160;
	while (buff[i]!=0) {
		nn=(byte)buff[i];
		if (! ( (nn>=a&&nn<=b) || nn>=c ) ) ret=Yes;
		i++;
	}
	return ret;
}


del_esc(unsigned char *buff)
{
	int i,n;
	char buff2[300];
	byte nn,a,b,c;
	i=0;
	n=0;
	a=32;
	b=126;
	c=160;
	while (buff[i]!=0) {
		nn=(byte)buff[i];
		if ( (nn>=a&&nn<=b) || nn>=c )
			 buff2[n++]=buff[i];
		i++;
	}
	buff2[n]=0;
	strcpy(buff,buff2);
}


//¹®ÀÚÁß¿¡¼­ ; * µîÀ» Á¦°ÅÇÑ´Ù.  ÀÓÀÇ SHELLÀ» ¸·´Â´Ù.
del_esc3(unsigned char *buff)
{
	int i,n;
	char buff2[300];
	unsigned char nn;
	i=0;
	n=0;
	while (n<300&&(nn=(unsigned char)buff[i])) {
		if ( ((nn>=32&&nn<=126) || nn>=160 )
			 &&buff[i]!=';'&&buff[i]!='<'
			 &&buff[i]!='>'&&buff[i]!='*'
			 &&buff[i]!='\\'
			 &&buff[i]!='&')
			 buff2[n++]=buff[i];
		i++;
	}
	buff2[n]=0;
	strcpy(buff,buff2);
}

del_char1(char *buff,char ch)
{
	int i;
	for (i=0;i<(int)strlen(buff);i++) {
		if (buff[i]==ch) {
			buff[i]=0;
			all_trim(buff);
			break;
		}
	}
}



//¹®ÀÚÁß¿¡¼­ ¼ýÀÚ,-¸¸ ¹Þ¾Æµå¸°´Ù.
del_char2(char *buff)
{
	int i,i2;
	char buff2[300];
	bzero(buff2,300);
	i=i2=0;
	while (buff[i]!=0) {
		if ((buff[i]>='0'&&buff[i]<='9')||
			buff[i]=='-'||buff[i]=='('||buff[i]==')')
				buff2[i2++]=buff[i];
		i++;
	}
	strcpy(buff,buff2);
}


del_enter(unsigned char *buff)
{
	int i,n;
	char buff2[3000];
	i=0;
	n=0;
	while (buff[i]!=0) {
		if ( buff[i]!='\n'&&buff[i]!='\r' ) buff2[n++]=buff[i];
		i++;
	}
	if (n>(int)strlen(buff)) n=(int)strlen(buff);
	buff2[n]=0;
	strcpy(buff,buff2);
}



del_tab(unsigned char *buff)
{
	int i,n;
	char buff2[400];
	i=0;n=0;
	bzero(buff2,400);
	while (buff[i]!=0) {
		if ( buff[i]!='\t'&&buff[i]!='\n'&&buff[i]!='\r' ) buff2[n++]=buff[i];
		i++;
	}
	strcpy(buff,buff2);
}


all_trim(char *buff)	  //¾çÂÊ¿¡¼­ ºó°ø°£ Á¦°ÅÇÏ±â  2->1
{
	char buff1[2500];
	strcpy(buff1,buff);
	alltrim(buff,buff1);	  //¾çÂÊ¿¡¼­ ºó°ø°£ Á¦°ÅÇÏ±â  2->1
}


rtrim(char *buff)	   //¾çÂÊ¿¡¼­ ºó°ø°£ Á¦°ÅÇÏ±â  2->1
{
	int i;
	for (i=(int)strlen(buff);i>=0;i--) {
		if (buff[i]==0||buff[i]==' ') buff[i]=0;
		else break;
	}
}


alltrim(char *buff1,char *buff2)	  //¾çÂÊ¿¡¼­ ºó°ø°£ Á¦°ÅÇÏ±â  2->1
{
	char buff3[2500];
	char buff4[2500];
	int  first;
	unsigned int i,i2;

	strcpy(buff3,buff2);
	i2=0;
	first=Yes;
	strcpy(buff1,"");
	strcpy(buff3,"");
	for (i=0;i<strlen(buff2);i++) {
		if (!first||buff2[i]!=' ') {
			buff3[i2]=buff2[i];
			buff3[i2+1]=0;
			i2++;
			first=No;
		}
	}

	strcpy(buff1,"");
	i2=0;
	for (i=0;i<strlen(buff3);i++)
		if (buff3[i]!='\n'&&buff3[i]!='\r') {
			buff1[i2]=buff3[i];
			buff1[i2+1]=0;
			i2++;
		}
	rtrim(buff1);
}


dateinput0(time_t t)
{
	char buff[100];
	strcpy(buff,datestr(1,t));
	if (dateinput(buff)) t=str2date(buff);
	return t;
}


dateinput(char *str)
{
	int i,j;
	int ret=0;
	unsigned char ch;
    fflush(NULL);
//1999-12-31
	for (i=0;i<10;i++)
		if (str[i]=='\0') for (j=i;j<10;j++) str[j]=' ';
	for (i=0;i<10;i++) if (str[i]!='-'&&(str[i]<'0'||str[i]>'9')) str[i]=' ';
	str[10]=0;
	str[4]=str[7]='-';
	printf("7%s8",str);
	i=2;
	printf("%c%c",str[0],str[1]);
	while(1) {
		str[4]=str[7]='-';
		ch=getchar();
		if (ch=='\n') break;
		else if(ch == '\b') {
			str[i]=' ';
			if(i==5||i==8) {
				printf("\b-\b\b \b");
				i-=2;
			}
			else if(i > 0) {
				printf("\b \b");
				i--;
			}
            fflush(NULL);
		}
		else if((ch == 0x1b) | (ch == 0x18) | (ch == 0x0f));
		else if(i < 10) {
			str[i++] = ch;
			putchar(ch);
			if (i==4||i==7) {putchar('-');i++;}
		}
	}
	for (i=0;i<10;i++) if (str[i]<' ') str[i]=' ';
	str[10]=0;
    fflush(NULL);
	return ret;
}

lineinput_(char *str,int len,int echo)
{
	int i = 0;
	int ret=0;
	unsigned char ch;
    fflush(NULL);
	if (len<1) return ret;
	while((ch=getchar()) != '\n' ) {
        if (i<0) i=0;
		if(ch == '\b') {
			if(i > 0) {
				printf("\b \b");
				i--;
			}
		}
		else if(echo==9&&(ch<' '||ch==138)) i=0;      //´Ù½ÃÀÔ·Â¹ÞÀ½
		else if(echo==5&&(ch<' '||ch>'~'));
		else if(echo==6&&(ch<'0'||ch>'z'));
		else if(echo==7&&(ch<'0'||ch>'z'||ch=='r'||ch=='R')) ret=1;

		else if (ch == '\x1B') {        // ¹æÇâÅ° Á¦¾î
            if((ch=getchar())== '[') {
				ch = getchar();
            }
		}

		else if((ch == 0x1b) | (ch == 0x18) | (ch == 0x0f));
		else if(i < len) {
			str[i++] = ch;
			if	   (echo==0) ;
			else if(echo==2) putchar(' ');
			else if(echo==3) putchar('*');
			else			 putchar(ch);
		}
	}
	str[i] = 0;
    fflush(NULL);
	return ret;
}


lineinput(char *str,int len)
{
	lineinput_(str,len,1);
}


lineinput2(char *str,int len)
{
	lineinput_(str,len,1);
	printf("\n");
}


lineinput3(char *mess,char *str,int len)
{
	printf(mess);
	lineinput_(str,len,1);
	printf("\n");
}


lineinput9(char *str,int len,int mode)
{
	return lineinput_(str,len,mode);		 //Æ¯¼öÅ°´Â ÀüºÎ¹«½Ã
}


lineinputx(char *str,int len)
{
	lineinput_(str,len,1);
	check_han(str);
	printf("\n");
	if (strlen(str)<3&&(is_same(str,"q")||is_same(str,"p")||is_same(str,"x")||is_same(str,"n")))
		return No;
	return Yes;


}



int numinput()
{
	char buff[20];
	lineinput_(buff,10,1);
	return atoi(buff);
}


passinput(char *str,int len)
{
	lineinput_(str,len,3);
}



getchar2()
{
	char buff[200];
    fflush(NULL);
	lineinput(buff,100);
	return buff[0];
}


getchar3()
{
	char buff[200];
	fflush(stdout);
	while(1) {
		lineinput_(buff,100,0);
		if (strlen(buff)<1) break;
	}
}


msleep(int n)
{
	fflush(stdout);
	usleep(n*100000);
}


mmsleep(int n)
{
	fflush(stdout);
	usleep(n*10000);
}


ssleep(int n)
{
	fflush(stdout);
	sleep(n);
}


print_(int mode,const char *fmt,...)
{
	va_list ap;
	char buff7[10];
	strcpy(buff7,"[7m");
	if (bit(cfg.logomode,8)) strcpy(buff7,"");
		 if (mode==1) printf("[K ### %s",buff7);
	else if (mode==3) printf("%s [78X[80D ### ",buff7);
	else			  printf("[K ### ");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
		 if (mode==1) printf("[0;1m ###\n");
	else if (mode==3) printf(" ###[0;1m\n");
	else			  printf(" ###\n");
}



xprintf(char *filename,const char *fmt,...)
{
	FILE *fp;
	char mess[200];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(mess,fmt, ap);
	va_end(ap);
	if ((fp=fopen(filename,"a+"))==NULL ) fp=fopen(filename,"w+");
	if (fp!=NULL) {
		fprintf(fp,"%s",mess);
		fclose(fp);
	}
}


//buff ÀÇ ³»¿ëÁß ÀÌ»óÇÑ ¹®ÀÚ ÀÖ´Â°¡?
sys_tem_(char *buff,int mode)
{
	unsigned char c=0;
	char OLDDIR[200];
	FILE *fp;
	int i=0;
	if (strlen(buff)<2) return 0;
	if (stristr(buff,"bin/sh")||stristr(buff,"bin/bash")||
		stristr(buff,"bin/ksh")||stristr(buff,"etc/passwd")) goto _err1;
	while ((c=buff[i++])) {
			 if (c>='0'&&c<='9') ;
		else if (c>='a'&&c<='z') ;
		else if (c>='A'&&c<='Z') ;
		else if (c==39||c>=160||c==34||c==39||c==64) ;
		else if (c==33||c==39||c==126) ;
		else if (c==' '||c=='#'||c=='/'||c=='_'||c=='-'||c=='.'||c=='>') ;
		else if ((mode==2||mode==3)&&c=='&') ;
		else if ((mode==2||mode==3)&&c=='<') ;
		else if (c==')'||c=='('||c=='?'||c=='*') ;
		else {
			_err1:
			if ((fp=fopen("/tmp/system2.tmp","a+"))!=NULL) {
				fprintf(fp,"%s %-8s%-8s C=%d %s\n",now_str(9),pf.id,tty,c,buff);
				fclose(fp);
			}
			printf("¿ÜºÎ ¸í·É ¿À·ù : %s %-8s%-8s C=%d %s\n",now_str(9),pf.id,tty,c,buff);
			pressenter();
			return 0;
		}
	}
	fflush(stdout);
	signal(SIGCLD,SIG_IGN);
	i=system(buff)/256;
	return (i);
}




mess(const char *fmt,...)
{
    char buff[3000];
    char buff2[3000];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	sprintf(buff2,"### %s ###[Enter]",buff);
	printf("%s\n",center_line(buff2));
	getchar2();
	printf("\n");
}


mess2(const char *fmt,...)
{
    char buff[3000];
    char buff2[3000];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
    printf("%s\n",center_line(buff));
    fflush(NULL);
    sleep(1);
}

mess3(const char *fmt,...)
{
    char buff[3000];
    char buff2[3000];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
    printf("%s\n",center_line(buff));
    fflush(NULL);
}



xy(int x,int y)  {
	printf("[%d;%dH",y,x);
}


char *findport(char *buff)		//ÇöÀç »ç¿ëµÇ°í ÀÖ´Â Æ÷Æ®Ã£±â
{
	char buff2[20];
	char *ttyname();
	strcpy(buff2,ttyname(1));
	buff2[19]=0;
	strcpy(buff,&buff2[5]);
	del_space(buff);
	return (buff);
}


int numselect()
{
	char buff[20];
	printf(" ¼±ÅÃ >> ");
	return numselect2();
}


int numselect2()
{
	char buff[20];
	lineinput_(buff,7,1);printf("\n");check_han(buff);
	if (is_same(buff,"q")||
		is_same(buff,"x")||
		is_same(buff,"xx")||
		is_same(buff,"p")) return -1;
	return atoi(buff);
}


int get_num(int old,int len)
{
	char buff[100];
	if (len<1) len=10;
	lineinput(buff,len);
	if (strlen(buff)<1) return old;
	return atoi(buff);
}



float get_float(float old,int len)
{
	char buff[100];
	float f;
	f=0.0;
	if (len<1) len=10;
	lineinput(buff,len);
	if (strlen(buff)<1) return old;
	sscanf(buff,"%f",&f);
	return f;
}


char get_chr(char chr)
{
	char buff[10];
	lineinput(buff,3);
	if (buff[0]==0) return chr;
	return buff[0];
}


get_str(char *str,int len)
{
	char buff[100];
	lineinput(buff,len);
	if (buff[0]!=0) strcpy(str,buff);
}



mess1(const  char *fmt,...)
{
	va_list ap;
	char buff7[10];
	strcpy(buff7,"[7m");
	if (bit(cfg.logomode,8)) strcpy(buff7,"");
	printf("\n");
	printfL2();
	printf("[s%s",buff7);
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
	printfL2();
	pressenter();
}



//Ã£´Â¹®ÀÚ¿­ ³ª¿À¸é ±×Àü±îÁö ÀüºÎ»èÁ¦
strchng8(char *src, char *search)
{
   int i, i2, len,len_search;
   len=strlen(src);
   len_search= strlen(search);
   for(i=0;src[i];i++) {
	  if(src[i]==search[0]) {
		 if(strncasecmp(&src[i], search, len_search) == 0) {
			for(i2=0;i2<len;i2++) {
				src[i2]=src[i+i2];
				src[i2+1]=0;
			}
			return Yes;
		 }
	  }
   }
   return No;
}


//Ã£´Â¹®ÀÚ¿­ ³ª¿À¸é ±×À§Ä¡ºÎÅÍ ÀüºÎ»èÁ¦
strchng9(char *src, char *search)
{
   int i, len_search;
   len_search=(int)strlen(search);
   for(i=0; src[i];i++) {
	  if(src[i] == search[0]) {
		 if(strncasecmp(&src[i], search, len_search) == 0) {
			src[i]=0;
			return Yes;
		 }
	  }
   }
   return No;
}

get_bit(int num,int bitnum)
{
	char buff[100];
	lineinput(buff,1);
	if		(buff[0]=='0') num=set_bit(num,bitnum,0);
	else if (buff[0]=='1') num=set_bit(num,bitnum,1);
	return num;
}


char *bitstr(int i)
{
	int n,n2;
	static char buff[50];
	bzero(buff,33);
	n2=0;
	for (n=0;n<32;n++) {
		buff[n2++]=bit(i,n)?'1':'0';
		if (n%10==9) buff[n2++]=' ';
	}
	return buff;
}


view_bit(unsigned int n)
{
    unsigned int n1,n2,n3,n4;
    int i;
    for (i=0;i<32;i++) {
        if (i>0&&i%8==0) printf(" ");
        n2=n<<i;
        n2=n2&0x80000000;
        printf("%d",(n2!=0));
    }
}



//ÇØ´ç ÀÚ¸®°¡ 1 ÀÎ°¡?
bit(unsigned int n,int i)
{
	return ((n>>i)&1);
}

//ÇØ´ç ÀÚ¸®ÁöÁ¤
set_bit(unsigned int n,int i,unsigned int n2)
{
	unsigned i1,i2;
	//ÇØ´ç ÀÚ¸® 0À¸·Î ¸¸µë
	i1=1<<i;	  //ÇØ´ç ÀÚ¸®¸¸ 1·Î ¸¸µë	 ³ª¸ÓÁö´Â ÀüºÎ 0
	i2=~i1; 	  //ÇØ´ç iÀÚ¸®¸¸ 0À¸·Î ¸¸µë  ³ª¸ÓÁö´Â ÀüºÎ 1
	n=n&i2; 	   //n¿¡¼­ ÇØ´ç ÀÚ¸®¸é 0 À¸·Î
	if (n2==1) n=n|i1;	 //1ÀÌ¸é 1·Î ¼¼ÆÃ
	return (n);
}


char *c_han(char *buff)
{
	static char out[10];
	char c;
	strcpy(out,"");
	c=buff[0];
	if ( (c>='0'&&c<='9')||
		 (c>='a'&&c<='z')||
		 (c>='A'&&c<='Z') ) sprintf(out,"%c",tolower(c));
	else if (strcmp(buff,"°¡")<0)  strcpy(out,"_");
	else if (strcmp(buff,"³ª")<0)  strcpy(out,"°¡");
	else if (strcmp(buff,"´Ù")<0)  strcpy(out,"³ª");
	else if (strcmp(buff,"¶ó")<0)  strcpy(out,"´Ù");
	else if (strcmp(buff,"¸¶")<0)  strcpy(out,"¶ó");
	else if (strcmp(buff,"¹Ù")<0)  strcpy(out,"¸¶");
	else if (strcmp(buff,"»ç")<0)  strcpy(out,"¹Ù");
	else if (strcmp(buff,"¾Æ")<0)  strcpy(out,"»ç");
	else if (strcmp(buff,"ÀÚ")<0)  strcpy(out,"¾Æ");
	else if (strcmp(buff,"Â÷")<0)  strcpy(out,"ÀÚ");
	else if (strcmp(buff,"Ä«")<0)  strcpy(out,"Â÷");
	else if (strcmp(buff,"Å¸")<0)  strcpy(out,"Ä«");
	else if (strcmp(buff,"ÆÄ")<0)  strcpy(out,"Å¸");
	else if (strcmp(buff,"ÇÏ")<0)  strcpy(out,"ÆÄ");
	else						   strcpy(out,"ÇÏ");
	return (out);
}


is_han(char *buff)
{
	int i,key=No;
	for(i=0;i<(int)strlen(buff);i++)
		if (ishangul(buff[i])) {
			key=Yes;
			break;
		}
	return key;
}


dosinput(char *str,int len)
{
	return doskey(str,len,2);
}

keyinput(char *str,int len)
{
	strcpy(str,"");
	return doskey(str,len,2);
}


//mode==0:º¸Åë1ÁÙÀÔ·Â
//mode==1:Ã³À½ºÎÅÍÇÏ±â
//mode==2:»óÇÏÈ­»ìÇ¥»ç¿ë
//return 0:º¸Åë 1:À§ 2:¾Æ·¡ 3:CTRL+X
int doskey(char *str, int length,int mode)
{
	char ch;	// Å° ÀÔ·Â¹Þ±âÀ§ÇØ
	int i = 0;			 // i´Â ÇöÀçÀÇ Ä­ À§Ä¡¸¦ ÁöÁ¤ÇÑ´Ù.
	int a = 0;			 // for¹®¿¡¼­ »ç¿ëÇÏ±â À§ÇØ
	int current = 0;	 // ÇöÀç ¹è¿­ÀÇ À§Ä¡
	if (length < 1) 	 // length°¡ 1ÀÌÇÏÀÌ¸é Á¾·á.
		return 0;

	//³ª¸ÓÁö´ÂÀüºÎ 0À¸·Î
	for (a=0;a<length;a++) {
		if (str[a]==0) {
			for(i=a;i<length;i++) str[i]=0;
			break;
		}
	}
	i=a;		   //i=4;
    if (mode==2) i=0;
	printf("7"); // Ä¿¼­À§Ä¡±â¾ï
	if (i==0) printf("8%s 8", str);
	else	  printf("8%s 8[%dC", str,i);

	while((ch = getchar()) != '\n' )
	{
		if (i>=length) i=length;
		if (i<0) i=0;
		if (ch == '\b') {               // ¹é½ºÆäÀÌ½º Å°¸¦ ´©¸¦°æ¿ì
			if (i>0) {
				for(a = i - 1; a < length-1; a++) str[a] = str[a+1];
				str[a]=0;
				i--;
				str[length-1] =0;
			}
		}
		else if(ch ==24) {return 3;}	// ctrl+x ´©¸¦°æ¿ì
		else if(ch == 4) {			  // ctrl+d ´©¸¦°æ¿ì
			if(i>=0) {
				for(a = i ; a < length; a++) str[a] = str[a+1];
				str[length] =0;
			}
		}
		else if (ch == '\x1B') {        // ¹æÇâÅ° Á¦¾î
			if((ch=getchar())== '[') {
				ch = getchar();
					 if (mode==0&&ch=='A') ch='D';         //À§
				else if (mode==0&&ch=='B') ch='C';       //¾Æ·¡
					 if (ch=='A') return 1;         //À§
				else if (ch=='B') return 2;       //¾Æ·¡
				else if (ch=='C') {if(i < length&&str[i]!=0) i++;}  //¿À¸¥ÂÊ
				else if (ch=='D') {if(i > 0) i--;}      //¿ÞÂÊ
			}
		}
		else {// ÀÏ¹Ý Å° ÀÔ·Â
			for(a = length;a>i&&a>0; a--) str[a] = str[a - 1];
			str[i] = ch;
			str[length] =0;
			i++;
		}

		if (i>=length) i=length;
		if (i==0) printf("8%s 8", str);
		else	  printf("8%s 8[%dC", str,i);
	}
	str[length] = '\0'; // ¸¶Áö¸·¿¡ Á¾·á¹®ÀÚ ÀÔ·Â
    fflush(NULL);
	return 0;
}




strconv3(char *buff)
{
	char buff2[200],str[20];
	char ch;
	int i,i2=0,len=(int)strlen(buff);
	bzero(buff2,200);
//	  for (i=0;i<(int)strlen(buff2);i++) {printf(" %d. %d  <%c>\n",i,buff[i],buff[i]);}pressenter();
	for (i=0;i<len;i++) {
		ch=buff[i];
		if (ch=='\\') {
			str[0]=buff[i+1];
			if (str[0]=='\\') {
				buff2[i2++]=ch;
				i+=1;
				continue;
			}
			else if (str[0]=='n') {
				buff2[i2++]='\n';
				i+=1;
				continue;
			}
			str[1]=buff[i+1];
			str[2]=buff[i+2];
			str[3]=buff[i+3];
			str[4]=0;
			ch=atoi(str);
			i+=3;
		}
		buff2[i2++]=ch;
	}
	strcpy(buff,buff2);
//	  for (i=0;i<(int)strlen(buff2);i++) {printf(" %d. %d  <%c>\n",i,buff[i],buff[i]);}pressenter();
}

char *starlen(char *buffstr)
{
	static char buff[100];
	xstrncpy(buff,"*******************",(int)strlen(buffstr));
	return (buff);
}


strchng(char *dest, char *src, char *search, char *change)
{
   int i, j, len_search, len_change,found=No;
   len_search= strlen(search);
   len_change= strlen(change);
   bzero(dest,strlen(dest));
   for(i=j=0; src[i];) {
	  if(src[i] == search[0]) {
		 if(strncmp(&src[i], search, len_search) == 0) {
			found=Yes;
			strcat(&dest[j], change);
			i+= len_search;
			j+= len_change;
		 }
		 else dest[j++] = src[i++];
	  }
	  else dest[j++] = src[i++];
   }
   dest[j] = 0;
   return found;
}

strchng2(char *src, char *search, char *change)
{
    char buff1[200000];
    bzero(buff1,200000);
	if (strchng(buff1,src,search,change)) {
		strcpy(src,buff1);
		return Yes;
	}
	return No;
}



//Æ¯Á¤ÆÄÀÏ¿¡ Æ÷ÇÔµÈ ¹®ÀÚ´Â °ÅºÎÇÑ´Ù.
check_file_char(char *buff,char *filename)
{
	int i,i2,found;
	char buff2[300];
	char buff3[300];
	bzero(buff2,300);
	file2buff(buff3,filename,300);
	i=i2=0;
	found=No;
	for (i=0;i<(int)strlen(buff);i++) {
		if (is_char(buff3,buff[i])) found=Yes;
		else buff2[i2++]=buff[i];
	}
	strcpy(buff,buff2);
	return found;
}


char *sbit(int i,int n)
{
	static char buff[10];
	sprintf(buff,bit(i,n)?"(¡Û)":"(¡¿)");
	return(buff);
}

char *nbit(int i,char *buff1,char *buff2)
{
	static char buff[100];
	char buff7[5];
	strcpy(buff7,"[7m");
	if (bit(cfg.logomode,8)) strcpy(buff7,"");
	if (i) sprintf(buff,"¡¼  %s /*[7m%s[0;1m ¡½",buff1,buff2);
	else   sprintf(buff,"¡¼ *[7m%s[0;1m / %s ¡½",buff1,buff2);
	return(buff);
}


char *rbit(int i,int n,char *buff1,char *buff2)
{
	static char buff[100];
	if (bit(cfg.logomode,8)) {
		if (bit(i,n)) sprintf(buff,"%s",buff2);
		else		  sprintf(buff,"%s",buff1);
	}
	else {
		if (bit(i,n)) sprintf(buff,"¡¼  %s /*[7m%s[0;1m ¡½",buff1,buff2);
		else		  sprintf(buff,"¡¼ *[7m%s[0;1m / %s ¡½",buff1,buff2);
	}
	return(buff);
}


char *rbit2(int i,int n,char *buff1,char *buff2)
{
	static char buff[100];
	if (bit(i,n)) sprintf(buff,"%s",buff2);
	else		  sprintf(buff,"%s",buff1);
	return(buff);
}


int gtt_bit(int i,int n)
{
	return (set_bit(i,n,bit(i,n)?0:1));
}

xstrncpy(char *a,char *b, int c)
{
	int i;
	i=strlen(b);
	if(i<1) i=1;
	if (c>i||c<1) c=i;
	strncpy(a,b,c);
	a[c]=0;
}

xstrtcpy(char *a,char *b, int c)
{
	if (c<(int)strlen(b)) strcpy(a,&b[c]);
	else strcpy(a,"");
}

is_quit(char *buff)
{
	check_han(buff);
	if (strcasecmp(buff,"q")==0||strcasecmp(buff,"p")==0||
		strcasecmp(buff,"x")==0||strcasecmp(buff,"m")==0||
		strcasecmp(buff,"xx")==0||strcasecmp(buff,"pp")==0||
		strcasecmp(buff,"qq")==0) return Yes;
	return No;
}

char *center_line(char *str)
{
    static char buffout[3000];
    char buff[3000];
    char buff2[3000];
	int i;
	strcpy(buff,str);all_trim(buff);
	i=39-strlen(buff)/2;
	if (i>1&&i<40) {
		sprintf(buff2,"%%%ds%%s",i);
		sprintf(buffout,buff2,"",buff);
	}
	else {
		strcpy(buffout,buff);
	}
	return (buffout);
}


//			say  sysop ¸Þ¼¼Áö  ÀÌ·¸°Ô µÉ¶§ ¸Þ¼¼Áö¸¸ »Ì¾Æ¼­ mess¿¡ ÀúÀå
// º¸ÅëÀº nn==2 	 buffstr->mess
buff2cmd(char *buffstr,char *mess,int nn)  //¸Þ¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ
{
	int i,n,count=0,start=No;;
	strcpy(mess,"");
	for (i=0;i<(int)strlen(buffstr);i++) {
//		  printf("%d %d %d %d '%c' <BR>",i,strlen(buffstr),nn,count,buffstr[i]);
		if (buffstr[i]!=' ') start=Yes;
		if (start&&buffstr[i]==' ') {
			count++;
			if (count>=nn) {
				strcpy(mess,&buffstr[i]);
				break;
			}
		}
	}
}


buff2buff1(char *buffstr,char *buff1,char *buff2)
{
	char buff3[3000];
	char buff4[3000];
	buff2buff_(buffstr,buff1,buff2,buff3,buff4,1);	//¸Þ¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ
}

buff2buff2(char *buffstr,char *buff1,char *buff2,char *buff3)
{
	char buff4[3000];
	buff2buff_(buffstr,buff1,buff2,buff3,buff4,2);	//¸Þ¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ
}

buff2buff3(char *buffstr,char *buff1,char *buff2,char *buff3,char *buff4)
{
	buff2buff_(buffstr,buff1,buff2,buff3,buff4,3);	//¸Þ¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ
}


//buffstr -> buff1,buff2 ·Î ºÐÇØ
buff2buff_(char *buffstr,char *buff1,char *buff2,char *buff3,char *buff4,int num)  //¸Þ¼¼Áö¸¦ °°ÀÌ ÀÔ·ÂÇÔ
{
	char str1[1000];
	char str2[1000];
	char str3[1000];
	char str4[1000];
	strcpy(str1,"");strcpy(str2,"");strcpy(str3,"");strcpy(str4,"");
	strcpy(buff1,"");strcpy(buff2,"");strcpy(buff3,"");strcpy(buff4,"");
	sscanf(buffstr,"%s%s%s%s",str1,str2,str3,str4);
	if (num==1) {
		buff2cmd(buffstr,buff2,1);
		strcpy(buff1,str1);
	}
	else if (num==2) {
		buff2cmd(buffstr,buff3,2);
		strcpy(buff1,str1);
		strcpy(buff2,str2);
	}
	else if (num==3) {
		buff2cmd(buffstr,buff4,3);
		strcpy(buff1,str1);
		strcpy(buff2,str2);
		strcpy(buff3,str3);
	}
}


char *no_spc(char *buff)
{
	static char buff2[100];
	int i,n;
	unsigned char nn;
	i=n=0;
	while (n<100&&(nn=(unsigned char)buff[i])) {
		if ( ((nn>=32&&nn<=126) || nn>=160 )
			 &&buff[i]!=';'&&buff[i]!='<'
			 &&buff[i]!='>'&&buff[i]!='*'
			 &&buff[i]!='/'&&buff[i]!='.'
			 &&buff[i]!='\\'
			 &&buff[i]!='?'&&buff[i]!='&')
			 buff2[n++]=buff[i];
		i++;
	}
	buff2[n]=0;
	return(buff2);
}

/* ¼ýÀÚ¿¡ ÄÞ¸¶³Ö¾î¼­ º¸¿©ÁÖ´Â ÇÁ·Î±×·¥ Ver1,0*/
//Æ¯¼º: 123456789 -> 12,345,678 ·Î ¸¸µå´Â ·çÆ¾
char *n2c(int num)
{
	static char pbuff[100];
	char ch,snum[100],xnum[100];
	int i, j, cm,old_num=num ;
	cm = 1 ; /* ÄÞ¸¶¸¦ Âï¾î¾ß ÇÏ´Â À§Ä¡¸¦ ÀúÀå */
	strcpy(pbuff,"");
	if (num<0) num*=-1;
	sprintf(snum,"%d",num);

	for (i=0,j=strlen(snum)-1; j>=0; j--)
	{
	  if (cm%4 == 0) /* 3°³´ÜÀ§·Î ³ª´©±â À§ÇØ¼­ */
	  {
		xnum[i++] = ',' ; /* ÄÞ¸¶¸¦ ³ÖÀ½, ´ÙÀ½¿ä¼Ò·Î ÀÌµ¿  */
		cm++ ; /* ÀÏ´Ü ÄÞ¸¶¸¦ ³ÖÀº ÀÚ¸® ´ÙÀ½À¸·Î ÀÌµ¿ */
	  }
	  xnum[i++] = snum[j] ; /* º¸Åë ¼ö¸¦ ³ÖÀ½ */
	  cm++ ; /* ÀÌ¿¡ ´ëÇÑ ÀÚ¸®, ´ÙÀ½À¸·Î ÀÌµ¿ */
	}
	xnum[i] = '\0' ; /* ³Î¹®ÀÚ ³ÖÀ½, ¹®ÀÚ¿­ ³¡ ÀÎ½ÄÀ§ÇØ */
	j=strlen(xnum);
	bzero(snum,100);

	if (old_num>=0) {
		for (i=0;j>0&&i<j;i++) {
			snum[j-i-1]=xnum[i];
		}
	}
	else {	//À½¼öÀÏ¶§
		for (i=0;j>0&&i<j;i++) {
			snum[j-i]=xnum[i];
		}
		snum[0]='-';
	}
	strcpy(pbuff,snum);
	/* Ã³¸®¹æ¹ý¿¡¼­ 1234 -> 432,1 ÀÌ µÇ¾ú±â ¶§¹®¿¡
	   ¹®ÀÚ¿­À» ¹Ý´ë·Î reverse ½ÃÅ´ -> 1,234 */
	return (pbuff);
}

unlink_file(const char *fmt,...)
{
	char buff[500];
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	if (strlen(buff)>0) unlink(buff);
}

rm_dir(char *dir)
{
	char buff[500];
	if (strlen(dir)>0) {
		sprintf(buff,"rm -rf %s",dir);
		del_esc3(buff);
		system(buff);
	}
}

touch_file(const char *fmt,...)
{
	char buff[500];
	char buff2[500];
	struct stat stbuf;
	struct utimebuf timestamp,*times=&timestamp;
	va_list ap;
	va_start(ap, fmt);
	vsprintf(buff,fmt, ap);
	va_end(ap);
	if (strlen(buff)<1) return;
	if (stat(buff,&stbuf)==-1) {
		create_file(buff);
		chmod(buff,0666);
		return;
	}
	time(&stbuf.st_atime);
	time(&stbuf.st_mtime);
	times->actime =stbuf.st_atime;
	times->modtime=stbuf.st_mtime;
	utime(buff,times);
	chmod(buff,0666);
}

create_file(char *filename)
{
	FILE *fp;
	if ((fp=fopen(filename,"w+"))!=NULL) fclose(fp);
}


mkdir3(char *buff)
{
	char buff2[200];
	if (strlen(buff)>0) {
		del_esc3(buff);
		sprintf(buff2,"mkdir -p %s",buff);system(buff2);
		sprintf(buff2,"chmod 777 %s",buff);system(buff2);
	}
}


file_size(char *filename)
{
	struct stat stbuf;
	if ((stat(filename,&stbuf))==-1) return 0;
	return stbuf.st_size;
}

count_line(char *filename)
{
	FILE *fp;
	int count=0;
	char c;
	if ((fp=fopen(filename,"r"))!=NULL) {
		while ((c=fgetc(fp))!=EOF) if (c=='\n') count++;
		fclose(fp);
	}
	return count;
}


file_copy(char *filename1,char *filename2)		 //1->2
{
	FILE *fp1,*fp2;
	int i,n;
	if (is_same(filename1,filename2)) {
		mess("%s ÆÄÀÏ¸íµ¿ÀÏ",filename1);
		return No;
	}
	if (strlen(filename1)<1||strlen(filename2)<1) {
		mess("ºóÆÄÀÏ¸í 1:\"%s\" 2:\"%s\"",filename1,filename2);
		return No;
	}
	n=file_size(filename1);
	fp1=fopen(filename1,"r");
	fp2=fopen(filename2,"w");
	if (fp1!=NULL&&fp2!=NULL) {
		for (i=0;i<n;i++) fputc(fgetc(fp1),fp2);
	}
	if (fp1!=NULL) fclose(fp1);
	if (fp2!=NULL) fclose(fp2);
	chmod(filename2,0777);
	if (n!=file_size(filename2)) {
		mess("È­ÀÏÅ©±â%d ¿ÀÂ÷%s(%d)->%s(%d)",n,filename1,file_size(filename1),filename2,file_size(filename2));
		return No;
	}
	return Yes;
}

//È­ÀÏÀÌ ¾øÀ¸¸é No Æ÷ÇÔµÇ¸é Yes;
del_emptyline(char *filename)
{
	char buff[400];
	char buff2[400];
	FILE *fp,*fp2;
	char filename2[300];
	sprintf(filename2,"tmp/tmp3%d%s",cfg.hostno,no_spc(tty)); // ÀÓ½ÃÈ­ÀÏ
	if ((fp=fopen(filename,"r"))!=NULL&&(fp2=fopen(filename2,"w+"))!=NULL) {
		while (fgets(buff,390,fp)!=NULL) {
			strcpy(buff2,buff);
			del_space(buff2);
			if (buff2[0]!=0) fprintf(fp2,"%s",buff);
		}
		fclose(fp);
		fclose(fp2);
		file_move(filename2,filename);
	}
}


//file1 ¿¡ file2¸¦ Ãß°¡ÇÔ
file_add(char *filename1,char *filename2)
{
	FILE *fp1,*fp2;
	int i,n;
	if ((fp1=fopen(filename1,"a+"))==NULL) fp1=fopen(filename1,"w+");
	if (fp1!=NULL) {
		fp2=fopen(filename2,"r+");
		if (fp2!=NULL) {
			fseekend(fp2);
			n=ftell(fp2);
			rewind(fp2);
			for (i=0;i<n;i++) fputc(fgetc(fp2),fp1);
			fclose(fp2);
		}
		fclose(fp1);
	}
}


file_move(char *filename1,char *filename2)		 //1->2
{
	if (file_copy(filename1,filename2)) {
		unlink(filename1);
		return Yes;
	}
	return No;
}


time_t file_time(char *filename) {		 //fileÀÇ ÃÖÁ¾¼öÁ¤½Ã°£
	struct stat stbuf;
	if ((stat(filename,&stbuf))==-1) return 0;
	return (stbuf.st_mtime);
}


//È­ÀÏ¼ÓÀÇ ¹®ÀÚ¿­ ÀÌ Æ÷ÇÔµÇ¸é Yes;
in_file(char *filename,char *buffstr)
{
	return in_file_(1,filename,buffstr);
}


//È­ÀÏ¼ÓÀÇ ¹®ÀÚ¿­ ÀÌ Æ÷ÇÔµÇ¸é Yes; (µ¿ÀÏÇÏ¿©¾ßÇÔ)
in_file2(char *filename,char *buffstr)
{
	char buff[500];
	int found=No;
	FILE *fp;
	if ((fp=fopen(filename,"r"))!=NULL) {
		while (fgets(buff,200,fp)!=NULL) {
			del_enter(buff);
			if (is_same(buff,buffstr)) {
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	return (found);
}


//¹®ÀÚ¿­¿¡ È­ÀÏ¼ÓÀÇ ³»¿ëÀÌ Æ÷ÇÔµÇ¸é Yes;
in_file3(char *filename,char *buffstr)
{
	return in_file_(3,filename,buffstr);
}

//È­ÀÏ¼ÓÀÇ ¹®ÀÚ¿­ ÀÌ Æ÷ÇÔµÇ¸é Yes; (30ÀÚ±îÁö¸¸ ºñ±³ µ¿ÀÏÇÏ¿©¾ßÇÔ)
in_file4(char *filename,char *buffstr)
{
	return in_file_(2,filename,buffstr);
}

//ºóÄ­À¸·Î ºÐ¸®µÈ
in_file5(char *filename,char *buffstr)
{
	FILE *fp;
	int i,key=No;
	char buff[300];
	if (strlen(buffstr)<1) return No;
	if ((fp=fopen(filename,"r"))==NULL) return No;
	while (fgets(buff,200,fp)!=NULL) {
		del_esc(buff);check_cmd(buff);
		key=No;
		for (i=0;i<10;i++) {
			if (is_same(mmc[i],buffstr)) {
				key=Yes;
				break;
			}
		}
	}
	fclose(fp);
	return key;
}


in_file_(int mode,char *filename,char *buffstr)
{
	char buff1[500];
	char buff2[500];
	int found=No;
	FILE *fp;
	strcpy(buff1,buffstr);
	if (mode==4) buff1[30]=0;
	del_clear(buff1);
	if (bit(allmode,11)) {
		printf("*INFILE=%s(%dB)*",filename,file_size(filename));
		getchar();
	}
	if ((fp=fopen(filename,"r+"))!=NULL) {
		while (fgets(buff2,200,fp)!=NULL) {
			del_clear(buff2);
			if (mode==4) buff2[30]=0;
			if ( strlen(buff2)>0&&(mode==1&&stristr(buff2,buff1)) ||
				 (mode==2&&strcasecmp(buff2,buff1)==0) ||
				 (mode==4&&strcasecmp(buff2,buff1)==0) ||
				 (mode==3&&stristr(buff1,buff2)) ) {
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	return (found);
}



//È­ÀÏ¸íÀ¸·Î Àû´çÇÑ°¡?
good_filename(char *buff)
{
    int i=0,n=0;
    unsigned char c;
    if (buff[0]==0) return No;
    for (i=0;i<(int)strlen(buff);i++)
        if (buff[i]=='.') n++;
    if (n>1) return No;   //.ÀÌ 1°³ÀÌ»óÀÏ¶§
    while ((c=buff[i++])) {
             if (c>'0'&&c<'9') ;
        else if (c>'a'&&c<'z') ;
        else if (c>'A'&&c<'Z') ;
        else if (c=='_'||c=='-'||c=='.') ;
        else {
            printf("\n %s ´Â È­ÀÏ¸íÀ¸·Î ÀûÇÕÇÏÁö ¸øÇÕ´Ï´Ù.\n",buff);
            getchar();
            return No;
        }
    }
    return Yes;
}


//ÀÌ È­ÀÏÀÌ ¿À·¡µÈ È­ÀÏÀÎ°¡?
is_old_file(char *filename,int sec)
{
	time_t tnow,i;
	time(&tnow);   //ÇöÀç½Ã°£
	i=file_time(filename);
	if ( (tnow-i)>sec ) return Yes;
	return No;
}

ch_dir(char *dirname)
{
	if (!is_dir(dirname)) {
		char olddir[200];
		getcwd(olddir,140); 	 //ÇöÀçÀÇ µð·ºÅä¸®
		mess("%s µð·ºÅä¸®¿À·ù (ÇöÀç%s)",dirname,olddir);
		return No;
	}
	chdir(dirname);
	return Yes;
}

//ÇöÀçÀÇ µð·ºÅä¸®°¡ Á¸ÀçÇÏ´Â°¡? ÀÖÀ¸¸é Yes ¾øÀ¸¸é No
is_dir(char *dirname)
{
    DIR *dp;
	struct dirent *fp;
	struct stat fs;
	if((dp= opendir(dirname)) == NULL) return No;
		/* µð·ºÅä¸® ¸ñ·Ï ¾ò±â */
	while((fp= readdir(dp)) != NULL) {
		if(strcmp(fp->d_name,".")==0) return Yes;      //.ÀÌ ÀÖ´Ù.
	}
	return No;
}

file_line(char *buff,char *filename,int line)
{
	char buff2[300];
	int n=1;
	int found=No;
	FILE *fp;
	strcpy(buff,"");
	if (line==0) line=1;
	if ((fp=fopen(filename,"r"))!=NULL) {
		strcpy(buff2,"");
		while (fgets(buff2,200,fp)!=NULL) {
			if (n++==line) {
				strcpy(buff,buff2);
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	del_enter(buff);
	return (found);
}


file_line2(char *buff,char *filename,char *str)
{
	char buff1[300],buff2[300],buff3[300];
	int n=1;
	int found=No;
	FILE *fp;
	strcpy(buff,"");
	if ((fp=fopen(filename,"r"))!=NULL) {
		strcpy(buff2,"");
		while (fgets(buff2,200,fp)!=NULL) {
			sscanf(buff2,"%s%s",buff1,buff3);
			if (is_same(buff1,str)) {
				buff2cmd(buff2,buff,1);
				del_enter(buff);
				found=Yes;
				break;
			}
		}
		fclose(fp);
	}
	return (found);
}



file_line_num(char *buff,char *filename)
{
	char buff2[300];
	int n=1;
	int found=No;
	FILE *fp;
	strcpy(buff,"");
	if ((fp=fopen(filename,"r"))!=NULL) {
		strcpy(buff2,"");
		if (fgets(buff2,200,fp)) {
			found=Yes;
			del_enter(buff);
			strcpy(buff,buff2);
		}
		fclose(fp);
	}
	return (found);
}


put_line(char *buff,char *filename)
{
	FILE *fp;
	char buff2[3020];
	strcpy(buff2,buff);
	if ((fp=fopen(filename,"a+"))==NULL) fp=fopen(filename,"w+");
	if (fp!=NULL) {
		del_enter(buff2);
		fprintf(fp,"%s\n",buff2);
		fclose(fp);
	}
}


fget_str(char *buff,char *filename,int len)
{
	FILE *fp;
	strcpy(buff,"");
	if ((fp=fopen(filename,"r"))!=NULL) {
		fread(&buff[0],len,1,fp);
		fclose(fp);
		return Yes;
	}
	return No;
}

fput_str(char *buff,char *filename,int len)
{
	FILE *fp;
	if ((fp=fopen(filename,"w+"))!=NULL) {
		fwrite(&buff[0],len,1,fp);
		fclose(fp);
	}
}




buff2file(char *buff,const char *fmt,...)
{
	FILE *fp;
    char filename[500];
	va_list ap;
	va_start(ap, fmt);
    vsprintf(filename,fmt, ap);
	va_end(ap);
    if ((fp=fopen(filename,"w"))!=NULL) {
		fprintf(fp,"%s",buff);
		fclose(fp);
		chmod(filename,0777);
	}
}

is_samefile(char *filename1,char *filename2)
{
	FILE *fp1,*fp2;
	int same=Yes;

	fp1=fopen(filename1,"r+");
	fp2=fopen(filename2,"r+");
	if (fp1!=NULL&&fp2==NULL) same=No;
	if (fp1==NULL&&fp2!=NULL) same=No;
	if (same&&fp1!=NULL&&fp2!=NULL) {
		while (!feof(fp1)&&!feof(fp2)) {
			if (fgetc(fp1)!=fgetc(fp2)) {
				same=No;
				break;
			}
		}
	}
	if (fp1!=NULL) fclose(fp1);
	if (fp2!=NULL) fclose(fp2);
	return same;
}


file2buff(char *buff,char *filename,int max)
{
	FILE *fp;
	int i,len=0;
	char ch;
	if (max==0) max=99999999;
	strcpy(buff,"");
	if ((fp=fopen(filename,"r"))==NULL) return -1;
	fseekend(fp);
	len=ftell(fp);
	rewind(fp);
	i=0;
	while ((ch=fgetc(fp))!=EOF&&i<max&&i<=len) buff[i++]=ch;
	buff[i]=0;
	fclose(fp);
	return len;
}



file_dir(char *file,char *dir, char *filename)
{
	int n,i;
	char buff1[180];
	char buff2[180];

	strcpy(dir,"");
	strcpy(filename,"");
	bzero(buff1,150);
	bzero(buff2,150);
	strcpy(buff1,file);
	if (buff1[0]==0) return;
	for (i=(int)strlen(buff1)-2;i>=0;i--) {
		if (buff1[i]=='/') {
			strcpy(buff2,&buff1[i+1]);
			buff1[i+1]=0;
			break;
		}
	}
	if (i<0) {	  //¾øÀ»°æ¿ì
		strcpy(dir,"./");
		strcpy(filename,buff1);
	}
	else {
		strcpy(dir,buff1);
		strcpy(filename,buff2);
	}
}


count_rec(char *filename,int size)
{
	FILE *fp;
	int n=0;
	if (size>0&&(fp=fopen(filename,"r+"))!=NULL) {
		fseek(fp,1,SEEK_END);
		n=ftell(fp)/size;
		fclose(fp);
	}
	if (n<0) n=0;
	return n;
}


count_frec(FILE *fp,int size)
{
	int n1=ftell(fp),n2;
	fseek(fp,1,SEEK_END);
	n2=ftell(fp)/size;
	fseek(fp,n1,SEEK_SET);
	return n2;
}


pure_name(int mode,char *buff)			//È­ÀÏ¸í¿¡¼­ ¼ø¼öÇÑ È­ÀÏºÎºÐ¸¸ »Ì¾Æ³¿
{
	char buff2[200];
	int i,i2=0;
	bzero(buff2,200);
	for (i=0;i<(int)strlen(buff);i++) {
		if		((mode==0||mode==2)&&buff[i]=='/') {i2=0;bzero(buff2,200);}
		else if (buff[i]==' '||buff[i]==0) break;
		else if (mode==2&&buff[i]=='.')    break;
		else if (i2>1&&buff2[i2]==' ')     break;
		else buff2[i2++]=buff[i];
	}
	del_space(buff2);
	del_esc(buff2);
	strcpy(buff,buff2);
}


//È­ÀÏ¿¡¼­ ÀúÀå¹øÈ£ÀÐ¾î¿È  mode:1:Áõ°¡ÇÔ
inc_numfile(int mode,char *filename)
{
	FILE *fp;
	char buff[100];
	int n=0,n2;
	c_lock(1,filename);
	if (mode==0) {
		if ((fp=fopen(filename,"r+"))!=NULL) {
			if (!fread(&n,sizeof(n),1,fp)) n=0;
			if (n<0) n=0;
			fclose(fp);
		}
	}
	else if (mode==1) {
		if ((fp=fopen(filename,"r+"))==NULL) fp=fopen(filename,"w+");
		if (fp!=NULL) {
			if (!fread(&n,sizeof(n),1,fp)) n=0;
			if (n<0) n=0;
			rewind(fp);
			n2=n+1;
			fwrite(&n2,sizeof(n),1,fp);
			fclose(fp);
		}
	}
    fflush(NULL);
	c_lock(0,filename);
	return n;
}


//È­ÀÏ¿¡ ÀúÀå
save_numfile(int num,char *filename)
{
	FILE *fp;
	c_lock(1,filename);
	if ((fp=fopen(filename,"w+"))!=NULL) {
		fwrite(&num,sizeof(num),1,fp);
		fclose(fp);
	}
	c_lock(0,filename);
    fflush(NULL);
	return num;
}


//È­ÀÏ¿¡ ÀúÀå
read_numfile(char *filename)
{
	FILE *fp;
	int num=0;
	if ((fp=fopen(filename,"r+"))!=NULL) {
		fread(&num,sizeof(num),1,fp);
		fclose(fp);
	}
	return num;
}


how_old_file(char *filename)
{
	time_t now;
	struct stat stbuf;
	time(&now); //12311231
	if ((stat(filename,&stbuf))==-1) return now;
	return (now-stbuf.st_mtime);
}



time_week(int mode,char *buff,time_t t)
{
  char rtn[26];
  static char *weeks[7] = {"ÀÏ","¿ù","È­","¼ö","¸ñ","±Ý","Åä"};
  struct tm *tp;
  tp = localtime(&t);
  strcpy (buff,weeks[tp->tm_wday]);
}


is_oldtime(time_t t,int n)
{
	time_t now;
	time(&now); //12311231
	return ((now-t)>n);
}


how_old(time_t t)
{
	time_t now;
	time(&now); //12311231
	return (now-t);
}

how_old_tty(char *dtty)
{
	char ttyfile[100];
	struct stat stbuf;
	struct utimebuf timestamp,*times=&timestamp;
	sprintf(ttyfile,"/dev/%s",dtty);
    strchng2(ttyfile,"/dev/dev/","/dev/");
    if (strlen(dtty)==0||stat(ttyfile,&stbuf)==-1) return 99999;
	times->actime =stbuf.st_atime;
	times->modtime=stbuf.st_mtime;
	utime(ttyfile,times);
    return how_old(stbuf.st_mtime);
}



//¿À´ÃÁö³­³¯Â¥ÀÎ°¡?
is_old_day(time_t t)
{
    struct tm *tp,*tp2;
	time_t now;
    time(&now);
    return (time_num(now)-time_num(t));
}


//¿À´Ã°úÀÇ ³¯Â¥ Â÷ÀÌ?
time_day(time_t t)
{
	time_t now;
	time(&now); //12311231
	return ((now-t)/86400);
}

//19961231
time_num(time_t t)
{
	struct tm *tp;
	tp = localtime(&t);
    return ((tp->tm_year+1900)*10000+(tp->tm_mon+1)*100+tp->tm_mday);
}

//19961231
now_time_num()
{
	struct tm *tp;
	time_t today;
	time(&today);	//¿À´ÃÀÇ ³¯Â¥ ÁöÁ¤
	tp = localtime(&today);
    return ((tp->tm_year+1900)*10000+(tp->tm_mon+1)*100+tp->tm_mday);
}

yearmonth(time_t t)     //9912
{
	struct tm *tp;
	tp = localtime(&t);
	return (((tp->tm_year%100)*100+tp->tm_mon+1)%10000);
}

now_yearmonth()
{
	time_t t;
	time(&t);
    return (yearmonth(t));
}


last_yearmonth(time_t t)
{
	struct tm *tp;
	tp = localtime(&t);
    return ( (tp->tm_year-1)*100+12 );
}


last_now_yearmonth()
{
    return ( (now_year()-1)*100+12 );
}


char *now_str(int mode)
{
	static char buff[50];
	time_t t;
	time(&t);
	strcpy(buff,datestr(mode,t));
	return (buff);
}


char *datestr(int mode,time_t t)
{
	static char buff[50];
	struct tm *tp;
	int n1,n2,n3;
	char buff1[20];
	char buff2[20];
	char buff3[20];
	static char *weeks[7] = {"ÀÏ","¿ù","È­","¼ö","¸ñ","±Ý","Åä"};
	tp = localtime(&t);
		 if (mode== 0) sprintf(buff,"%02d-%02d-%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday);
	else if (mode== 1) sprintf(buff,"%04d-%02d-%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday);
	else if (mode== 2) sprintf(buff,"%02d-%02d-%02d %02d:%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min);
	else if (mode== 3) sprintf(buff,"%02d-%02d %02d:%02d",tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min);
	else if (mode== 4) sprintf(buff,"%02d:%02d",tp->tm_hour,tp->tm_min);
	else if (mode== 5) sprintf(buff,"%02d%02d%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday);
	else if (mode== 6) sprintf(buff,"%02d:%02d%c",tp->tm_hour%12,tp->tm_min,tp->tm_hour/12?'p':'a');
	else if (mode== 7) sprintf(buff,"%d:%02d",t/3600,(t/60)%60);
	else if (mode== 8) sprintf(buff,"%04d-%02d-%02d %02d:%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min);
	else if (mode== 9) sprintf(buff,"%02d%02d%02d%02d%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min);
	else if (mode==10) sprintf(buff,"%02d-%02d-%02d %02d:%02d:%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min,tp->tm_sec);
	else if (mode==11) sprintf(buff,"%02d%02d%02d%02d",tp->tm_mday,tp->tm_hour,tp->tm_min,tp->tm_sec);
	else if (mode==12) sprintf(buff,"%02d%02d",tp->tm_year%100,tp->tm_mon+1);
	else if (mode==13) sprintf(buff,"%02d:%02d:%02d",tp->tm_hour,tp->tm_min,tp->tm_sec);
	else if (mode==14) sprintf(buff,"%cM %02d:%02d:%02d",tp->tm_hour>11?'P':'A',tp->tm_hour%12,tp->tm_min,tp->tm_sec);
	else if (mode==15) sprintf(buff,"%cM %02d:%02d",tp->tm_hour>11?'P':'A',tp->tm_hour%12,tp->tm_min);
    else if (mode==16) sprintf(buff,"%02d %02d:%02d%",tp->tm_mday,tp->tm_hour,tp->tm_min);
	else if (mode==17) sprintf(buff,"%02d-%02d",tp->tm_mon+1,tp->tm_mday);
	else if (mode==18) sprintf(buff,"%02d%02d",tp->tm_mon+1,tp->tm_mday);
	else if (mode==19) sprintf(buff,"%04d-%02d-%02d %02d:%02d:%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min,tp->tm_sec);
	else if (mode==24) strcpy(buff,datestr9(mode,tp->tm_year%100,tp->tm_mon+1,tp->tm_mday));
	else if (mode==25) strcpy(buff,datestr9(mode,tp->tm_hour,tp->tm_min,tp->tm_sec));
	else if (mode==20||mode==21||mode==22||mode==23||mode==26) {
		n1=t/3600;n2=(t/60)%60;n3=0;n3=t%60;
		strcpy(buff,datestr9(mode,n1,n2,n3));
	}
	else if (mode==27) sprintf(buff,"%04d%02d%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday);
	else if (mode==31) sprintf(buff,"%02d%02d",tp->tm_hour%12,tp->tm_min);
	else if (mode==32) sprintf(buff,"%02d%02d",tp->tm_hour,tp->tm_min);
	else if (mode==33) sprintf(buff,"%04d-%02d-%02d(%s) %02d:%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday],tp->tm_hour,tp->tm_min);
	else if (mode==34) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday);
	else if (mode==35) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ (%s)",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday]);
	else if (mode==36) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday);
	else if (mode==37) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ (%s)",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday]);
	else if (mode==38) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ %s½Ã %2dºÐ",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,ampm(1,tp->tm_hour),tp->tm_min);
	else if (mode==39) sprintf(buff,"%4d³â %2d¿ù %2dÀÏ (%s) %s½Ã %2dºÐ",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday],ampm(1,tp->tm_hour),tp->tm_min);
	else if (mode==40) sprintf(buff,"%s½Ã %dºÐ",ampm(1,tp->tm_hour),tp->tm_min);
	else if (mode==41) sprintf(buff,"%s %2d½Ã %2dºÐ",ampm(5,tp->tm_hour),tp->tm_hour%12,tp->tm_min);
    else if (mode==42) sprintf(buff,"%04d-%02d-%02d(%s) %02d:%02d:%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday],tp->tm_hour,tp->tm_min,tp->tm_sec);
    else if (mode==43) {if(t<0) t=0;sprintf(buff,"%3d:%02d",t/3600,(t/60)%60);}
    else if (mode==44) sprintf(buff,"%4d³â %2d¿ù",tp->tm_year+1900,tp->tm_mon+1);
    else if (mode==45) sprintf(buff,"%2d³â %2d¿ù",tp->tm_year%100,tp->tm_mon+1);
    else if (mode==46) sprintf(buff,"%02d%02d%02d%02d%02d%02d",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min,tp->tm_sec);
    else if (mode==47) sprintf(buff,"%2d³â %2d¿ù %2dÀÏ (%s)",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday]);
    else if (mode==48) sprintf(buff,"%2d³â%2d¿ù%2dÀÏ",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday);
    else if (mode==49) sprintf(buff,"%2d³â%2d¿ù%2dÀÏ(%s)",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday]);
    else if (mode==50) sprintf(buff,"%2d-%2d-%2d(%s)",tp->tm_year%100,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday]);
    else if (mode==51) sprintf(buff,"%02d%02d %02d%02d%02d",tp->tm_mon+1,tp->tm_mday,tp->tm_hour,tp->tm_min,tp->tm_sec);
    else if (mode==52) sprintf(buff,"%04d³â %2d¿ù %2dÀÏ (%s) %s½Ã %2dºÐ %2dÃÊ",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday,weeks[tp->tm_wday],ampm(1,tp->tm_hour),tp->tm_min,tp->tm_sec);
    else if (mode==53) sprintf(buff,"%d¿ù %dÀÏ %d½Ã",tp->tm_mon+1,tp->tm_mday,tp->tm_hour);
    else if (mode==54) sprintf(buff,"%04d-%02d",tp->tm_year+1900,tp->tm_mon+1);
    else if (mode==55) sprintf(buff,"%02d-%02d",tp->tm_year%100,tp->tm_mon+1);
	else if (mode==81) sprintf(buff,"%d",tp->tm_year+1900);
    else if (mode==82) sprintf(buff,"%d",tp->tm_year%100);
	else if (mode==83) sprintf(buff,"%d",tp->tm_mon+1);
    else if (mode==84) sprintf(buff,"%d",tp->tm_mday);
	else if (mode==85) sprintf(buff,"%s",weeks[tp->tm_wday]);
	else if (mode==86) sprintf(buff,"%d",tp->tm_hour);
	else if (mode==87) sprintf(buff,"%c",tp->tm_hour>11?'P':'A');
	else if (mode==88) sprintf(buff,"%d",tp->tm_hour%12);
	else if (mode==89) sprintf(buff,"%d",tp->tm_min);
	else if (mode==90) sprintf(buff,"%d",tp->tm_sec);
	else if (mode==93) sprintf(buff,"%2d",tp->tm_mon+1);
    else if (mode==94) sprintf(buff,"%2d",tp->tm_mday);
	else if (mode==95) sprintf(buff,"%2d",tp->tm_hour);
	else if (mode==96) sprintf(buff,"%2d",tp->tm_hour%12);
	else if (mode==97) sprintf(buff,"%2d",tp->tm_min);
	else if (mode==98) sprintf(buff,"%2d",tp->tm_sec);
	return (buff);
}


char *ampm(int mode,int hour)
{
	static char buff[20];
	strcpy(buff,"");
		 if (mode==0) sprintf(buff,"%s%2d" ,hour>11?"P":"A",hour%12);
	else if (mode==1) sprintf(buff,"%s %2d",hour>11?"¿ÀÈÄ":"¿ÀÀü",hour%12);
	else if (mode==2) sprintf(buff,"%s %2d",hour>11?"PM":"AM",hour%12);
	else if (mode==3) sprintf(buff,"%s %d" ,hour>11?"pm":"am",hour%12);
	else if (mode==4) sprintf(buff,"%s",hour>11?"P":"A");
	else if (mode==5) sprintf(buff,"%s",hour>11?"¿ÀÈÄ":"¿ÀÀü");
	else if (mode==6) sprintf(buff,"%s",hour>11?"PM":"AM");
	else if (mode==7) sprintf(buff,"%s",hour>11?"pm":"am");
	return (buff);
}

char *datestr9(int mode,int n1,int n2,int n3)
{
	static char buff[30];
	char buff1[100],buff2[100],buff3[100],buff4[100];
	strcpy(buff,"");
	strcpy(buff1,"");
	strcpy(buff2,"");
	strcpy(buff3,"");
	if (mode==20) {
		if (n1) sprintf(buff1,"%d½Ã°£ ",n1);
		if (n2) sprintf(buff2,"%dºÐ "  ,n2);
		if (n3) sprintf(buff3,"%dÃÊ "  ,n3);
		if (n1==0&&n2==0&&n3==0) sprintf(buff3,"0ÃÊ");
	}
	else if (mode==21) {
		strcpy(buff1,"");strcpy(buff2,"");
		if (n1) sprintf(buff1,"%d½Ã°£ ",n1);
		if (n2) sprintf(buff2,"%dºÐ "  ,n2);
		if (n1==0&&n2==0) sprintf(buff2,"0ºÐ");
	}
	else if (mode==22) {
		sprintf(buff1,"%d:%02d",n1,n2);
	}
	else if (mode==23) {
		strcpy(buff1,"   ");strcpy(buff2,"   ");
		if (n1>0)		sprintf(buff1,"%02d:",n1);
		if (n1>0||n2>0) sprintf(buff2,"%02d:",n2);
						sprintf(buff3,"%02d" ,n3);
	}
	else if (mode==24) {
		sprintf(buff1,"%d³â ",n1);
		sprintf(buff2,"%d¿ù ",n2);
		sprintf(buff3,"%dÀÏ" ,n3);
	}
	else if (mode==25) {
		sprintf(buff1,"%d½Ã ",n1);
		sprintf(buff2,"%dºÐ",n2);
	}
	else if (mode==26) {
		if ((n1/24)>0) sprintf(buff1,"%d:",n1/24);
		if (n1%24>0||n2>0) {
			sprintf(buff2,"%02d:",n1%24);
			sprintf(buff3,"%02d",n2);
		}
	}
	sprintf(buff,"%s%s%s",buff1,buff2,buff3);
	return (buff);
}



day_calc(time_t time_t1,time_t time_t2)
{
	return (time_t1-time_t2)/(24*3600);
}


char *now_week()   {
	static char buff[30];
	time_t t;
	time(&t); //12311231
	time_week(0,buff,t);
	return (buff);
}

char *date_week(time_t date2)  {
	static char buff[30];
	time_week(0,buff,date2);
	return (buff);
}


//ÇöÀç³âµµ
now_now(int mode,int mode2,time_t date2)
{
	struct tm *tp;
	time_t t;
	int i;
	if (mode2==0) {
		time(&t); //12311231
		tp = localtime(&t); //12311231
	}
	else tp = localtime(&date2); //12311231

    if      (mode==1&&tp->tm_year<=100) return tp->tm_year+1900;
    else if (mode==1) return tp->tm_year;
	else if (mode==2) return tp->tm_mon+1;
	else if (mode==3) return tp->tm_mday;
	else if (mode==4) return tp->tm_hour;
	else if (mode==5) return tp->tm_min;
	else if (mode==15) return tp->tm_sec;
	else if (mode==6) return tp->tm_wday;
	else if (mode==7) return (tp->tm_year*10000+(tp->tm_mon+1)*100+tp->tm_mday);
	else if (mode==8) return ((tp->tm_mon+1)*100+tp->tm_mday);
	else if (mode==9) return ((tp->tm_mon+1)*31+tp->tm_mday);
	else if (mode==10) {
        i=tp->tm_year;
        if (i<=100&&i>50) i+=1900;
        else if (i<=100) i+=2000;
		if(i>=1998) i-=1998;
		if(i<0||i>1000) i=0;
		return (i*12+tp->tm_mon+1);
	}
	else if (mode==11) return (tp->tm_year*100+(tp->tm_mon+1));
	return 0;
}


//³¯Â¥¸¦ º¯È¯½ÃÅ´ ½Ã°£Àº ±×´ë·Î ÇöÀçÀÇ ½Ã°£À¸·Î..
//	  time_t t; t=set_date(99,1,1); printf("%s  %d\n",ctime(&t),t);
time_t set_date(int year, char mon, char day) {
	time_t t;
	struct tm *tp;

	time(&t);
	tp= localtime(&t);
    if (year<=100&&year>50) year+=1900;
    else if (year<=100) year+=2000;
	tp->tm_year= year;
	tp->tm_year= year-1900;
	tp->tm_mon = (int)mon-1;
	tp->tm_mday= (int)day;
	t= mktime(tp);
	return t;
}


//³¯Â¥¸¦ º¯È¯½ÃÅ´
//	  YYYY/MM/DD  , YY/MM/DD
time_t str2date(char *buff) {
	int year;
	int mon;
	int day;
    char buff2[3000];
	bzero(buff2,99);
    if (strlen(buff)>30) return 0;
	if (buff[4]=='/'||buff[4]=='-') {
		strcpy(buff2,buff)	  ;buff2[4]=0;year=atoi(buff2);
		strcpy(buff2,&buff[5]);buff2[4]=0;mon =atoi(buff2);
		strcpy(buff2,&buff[8]);buff2[2]=0;day =atoi(buff2);
	}
	else {
		strcpy(buff2,buff)	  ;buff2[2]=0;year=atoi(buff2);
		strcpy(buff2,&buff[3]);buff2[2]=0;mon =atoi(buff2);
		strcpy(buff2,&buff[6]);buff2[2]=0;day =atoi(buff2);
	}
	if (year<0||mon<1||mon>12||day<1||day>31) return 0;
	return(set_date(year,mon,day));
}


time_t set_date2(int year, char mon, char day,char hour,char min) {
	time_t t;
	struct tm *tp;
    time(&t);
	tp= localtime(&t);
    if (year<=100&&year>50) year+=1900;
    else if (year<=100) year+=2000;
	tp->tm_year= year-1900;
	tp->tm_mon = (int)mon-1;
	tp->tm_mday= (int)day;
    tp->tm_hour= (int)hour;
	tp->tm_min = (int)min;
	t=mktime(tp);
	return t;
}


//³¯Â¥¸¦ º¯È¯½ÃÅ´
//	  YYYY-MM-DD 12:31	, YY-MM-DD 12:31
time_t str2date2(char *buff) {
    int year,mon,day,hour,min,sec;
    char buff2[3000];
	time_t t;
	struct tm *tp;
	time(&t);
	tp= localtime(&t);
    if (strlen(buff)>30) return 0;
	bzero(buff2,99);
	if (buff[4]=='/'||buff[4]=='-') {
		strcpy(buff2,buff)	   ;buff2[4]=0;year=atoi(buff2);
		strcpy(buff2,&buff[ 5]);buff2[4]=0;mon =atoi(buff2);
		strcpy(buff2,&buff[ 8]);buff2[2]=0;day =atoi(buff2);
		strcpy(buff2,&buff[11]);buff2[2]=0;hour=atoi(buff2);
		strcpy(buff2,&buff[14]);buff2[2]=0;min =atoi(buff2);
        strcpy(buff2,&buff[17]);buff2[2]=0;sec =atoi(buff2);
	}
	else {
		strcpy(buff2,buff)	   ;buff2[2]=0;year=atoi(buff2);
		strcpy(buff2,&buff[3 ]);buff2[2]=0;mon =atoi(buff2);
		strcpy(buff2,&buff[6 ]);buff2[2]=0;day =atoi(buff2);
		strcpy(buff2,&buff[9 ]);buff2[2]=0;hour=atoi(buff2);
		strcpy(buff2,&buff[12]);buff2[2]=0;min =atoi(buff2);
        strcpy(buff2,&buff[15]);buff2[2]=0;sec =atoi(buff2);
	}
	if (year<0||mon<1||mon>12||day<1||day>31) return 0;
    if (year<=100&&year>50) year+=1900;
    else if (year<=100) year+=2000;
	tp->tm_year= year-1900;
    tp->tm_mon = mon-1;
    tp->tm_mday= day;
    tp->tm_hour= hour;
    tp->tm_min = min;
    tp->tm_sec = sec;
	t=mktime(tp);
    return(t);
}


//³¯Â¥¸¦ º¯È¯½ÃÅ´
//	  MM/DD 12:31
time_t str2date3(char *buff) {
    char buff2[3000];
	sprintf(buff2,"%4d-%s",now_year(),buff);
	return str2date2(buff2);
}

//³¯Â¥¸¦ º¯È¯½ÃÅ´
//	  YYYYMMDD,YYMMDD ->³¯Â¥·Î ÁöÁ¤
//    YYYYMMDDHHMMSS,YYMMDDHHMMSS ->³¯Â¥·Î ÁöÁ¤
//    YYYYMMDDHHMMSS,YYMMDDHHMMSS ->³¯Â¥·Î ÁöÁ¤
//    YYMMDDHHMM ->³¯Â¥·Î ÁöÁ¤
time_t str2date4(char *buff) {
    static char buff2[3000];
         if (strlen(buff)== 8) sprintf(buff2,"%c%c%c%c-%c%c-%c%c",buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],buff[7]);
    else if (strlen(buff)== 6) sprintf(buff2,"%c%c-%c%c-%c%c",buff[0],buff[1],buff[2],buff[3],buff[4],buff[5]);
    else if (strlen(buff)==12) sprintf(buff2,"%c%c-%c%c-%c%c %c%c:%c%c:%c%c",buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],buff[7],buff[8],buff[9],buff[10],buff[11]);
    else if (strlen(buff)==14) sprintf(buff2,"%c%c%c%c-%c%c-%c%c %c%c:%c%c:%c%c",buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],buff[7],buff[8],buff[9],buff[10],buff[11],buff[12],buff[13]);
    else if (strlen(buff)==10) sprintf(buff2,"%c%c-%c%c-%c%c %c%c:%c%c",buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],buff[7],buff[8],buff[9]);
	return str2date2(buff2);
}


char *yangstr(int mode,int moon)
{
	static char buff9[10];
	if (mode==1) {
        if (moon==2) strcpy(buff9,"(À½·Â)");
        else         strcpy(buff9,"(¾ç·Â)");
	}
	else if (mode==2) {
        if (moon==2) strcpy(buff9,"(À½)");
        else         strcpy(buff9,"(¾ç)");
	}
	else {
        if (moon==2) strcpy(buff9,"À½");
        else         strcpy(buff9,"¾ç");
	}
	return (buff9);
}


char *dateyang(int mode,time_t date,int moon)
{
	static char buff[50];
    strcpy(buff,dateyang_(mode/10,mode%10,date,moon));
	return (buff);
}


char *dateyang_(int mode1,int mode2,time_t date,int moon)
{
	static char buff[50];
	char buff2[50];
	strcpy(buff2,datestr(mode1,date));
	sprintf(buff,"%s%s",buff2,yangstr(mode2,moon));
	return (buff);
}

//ÇöÀç½Ã°£ÀÌ Æ÷ÇÔµÇ¾ú´Â°¡?
in_hour(int n1,int n2)
{
	int n=now_hour();
	if (n1==0&&n2==0) return Yes;
	else if (n1==0&&n>=n1) return Yes;
	else if (n2==0&&n<=n2) return Yes;
	else if (n1==n2&&n==n2) return Yes;
	else if (n>=n1&&n<n2) return Yes;
	return No;
}


//ÁøÀÔ°¡´É ½Ã°£ È®ÀÎ
char *time_limitstr(int intime)
{
	static char buff[100];
	int now,start,end;
	start=intime/10000;  //½ÃÀÛ½Ã°£
	end  =intime%10000;  //Á¾°á½Ã°£
	sprintf(buff,"%02d:%02d ¡­ %02d:%02d",start/100,start%100,end/100,end%100);
	return (buff);
}


//ÆÄÀÏ·Î ÇÏ´Â c_lock
c_lock(int mode,char *filename)
{
	char buff[300];
	char lock_filename[300];
	int i,n;
    if (bit(cfg.mprocmode,1)) return 0; //LOCK»ç¿ë¾ÈÇÔ
	strcpy(buff,filename);del_esc3(buff);del_space(buff);
	strchng2(buff,"/","");strchng2(buff,".","");
	if (strlen(buff)<1) return Yes;
	sprintf(lock_filename,"user/lock/%s",buff);
	if (mode==0) goto make_chlock3;
	if (mode==1&&!is_file(lock_filename)) goto make_chlock1;
	else if (mode==1||mode==2) {
		if (is_old_file(lock_filename,300)) goto make_chlock2;
		n=40;if (mode==2) n=1000;
        for (i=0;i<50;i++) {
			if (!is_file(lock_filename))  goto make_chlock1;
			if (i==0&&mode==2) {
				printf(" Áö±Ý µ¥ÀÌÅ¸ °»½Å ÁßÀÔ´Ï´Ù. Àá½Ã¸¸ ±â´Ù·Á ÁÖ¼¼¿ä..\n");
				if (pf.type>=18) printf("LOCK:%s\n",filename);
			}
            msleep(1);
		}
		goto make_chlock2;
	}
	return Yes;
	make_chlock1:
	create_file(lock_filename);
    fflush(NULL);
	return Yes;
	make_chlock2:
	unlink(lock_filename);
	create_file(lock_filename);
    fflush(NULL);
	return No;
	make_chlock3:
	unlink(lock_filename);
    fflush(NULL);
	return Yes;
}

// ÇöÀç µð·ºÅä¸®ÀÇ È­ÀÏÀÇ ¼ö¸¦ ÆÄ¾ÇÇÑ´Ù. ..,. »©°í
// ¿À·ùÀÌ¸é -1;
int dir_filenum(char *dir)	  //È­ÀÏÀÇ ¼ö
{
   DIR *dp;
   struct dirent *fp;
   int count=0;

   if((dp= opendir(dir)) == NULL) return -1;
   /* µð·ºÅä¸® ¸ñ·Ï ¾ò±â */
	  /* È­ÀÏÀÌ¸§ÀÌ '.'³ª '..'³ª '.'·Î ½ÃÀÛµÇ´Â ¼û±èÈ­ÀÏÀÌ¶ó¸é ±×³É Åë°ú*/
   while((fp= readdir(dp)) != NULL) if(*(fp->d_name) != '.') count++;
   closedir(dp);
   return (count);
}



// ÇöÀç µð·ºÅä¸®ÀÇ È­ÀÏÁõ 1°³¸¦ returnÇÑ´Ù. ..,. »©°í
// ¿À·ùÀÌ¸é -1;
dir_filename(char *buff,char *dir)
{
	DIR *dp;
	struct dirent *fp;
	int count=0;
	strcpy(buff,"");
	dp= opendir(dir);
	/* µð·ºÅä¸® ¸ñ·Ï ¾ò±â */
	/* È­ÀÏÀÌ¸§ÀÌ '.'³ª '..'³ª '.'·Î ½ÃÀÛµÇ´Â ¼û±èÈ­ÀÏÀÌ¶ó¸é ±×³É Åë°ú*/
	while((fp= readdir(dp)) != NULL)
	   if(*(fp->d_name) != '.'&&strlen(fp->d_name)<=12)
			{
				strcpy(buff,fp->d_name);
				count++;
				break;
			}
	closedir(dp);
	return count;
}


