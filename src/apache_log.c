#include <stdio.h>

//192.0.0.33 - - [28/Jul/2000:05:43:46 +0900] "GET /shopping/main.htm HTTP/1.1" 200 1807
//211.32.252.111 - - [29/Jul/2000:13:28:41 +0900] "GET /ch.cgi?rn=11234 HTTP/1.1" 200 264
//211.58.1.125 - - [29/Jul/2000:13:28:56 +0900] "GET /xto/main.ht HTTP/1.1" 404 217
//211.63.128.110 - - [29/Jul/2000:13:29:08 +0900] "GET /shop/main.htm HTTP/1.1" 200 2508
main(int argc, char **argv)
{
    FILE *fp,*fp2;
    char buff[3000],buff1[3100],buff2[3100],buff3[3100];
    char datafile[500],filename[500];
    int i,year,month;
    strcpy(datafile,"access_log");
    if (argc>1) strcpy(datafile,argv[1]);
    if (!(fp=fopen(datafile,"r"))) {
        printf("%s file not found\n",datafile);
        return;
    }
    while (fgets(buff,3000,fp)) {
        buff[2999]=0;
        if (strlen(buff)<50||strlen(buff)>2500) continue;
        for (i=6;i<30;i++) {
            strncpy(buff1,&buff[i],6);
            if (strcmp(buff1," - - [")==0) {
                bzero(buff2,3100);strncpy(buff2,&buff[i+9],3);
                bzero(buff3,3100);strncpy(buff3,&buff[i+13],4);
                //printf("%-30.30s|%s|%s|%s|\n",buff,buff1,buff2,buff3);
                year=atoi(buff3);
                month=0;
                if (strcmp(buff2,"Jan")==0) month=1;
                else if (strcmp(buff2,"Feb")==0) month=2;
                else if (strcmp(buff2,"Mar")==0) month=3;
                else if (strcmp(buff2,"Apr")==0) month=4;
                else if (strcmp(buff2,"May")==0) month=5;
                else if (strcmp(buff2,"Jun")==0) month=6;
                else if (strcmp(buff2,"Jul")==0) month=7;
                else if (strcmp(buff2,"Aug")==0) month=8;
                else if (strcmp(buff2,"Sep")==0) month=9;
                else if (strcmp(buff2,"Oct")==0) month=10;
                else if (strcmp(buff2,"Nov")==0) month=11;
                else if (strcmp(buff2,"Dec")==0) month=12;
                sprintf(filename,"%s.%04d%02d",datafile,year,month);
                if (year>0&&month>0&&(fp2=fopen(filename,"a+"))) {
                    fprintf(fp2,buff);
                    fclose(fp2);
                }
                break;
            }
        }
    }
    fclose(fp);
}
