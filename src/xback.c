#include <stdio.h>
#include <string.h>
#include <time.h>

main(int argc, char **argv)
{
    char buff[100],date[100];
	struct tm *tp;
    int mode=0;
    time_t today;

    time(&today);   //오늘의 날짜 지정
	tp = localtime(&today);
    sprintf(date,"%02d%02d%02d",tp->tm_year%100,(tp->tm_mon+1),tp->tm_mday);

    chdir("/");
    if (argc>1) mode=atoi(argv[1]);
         if (mode==1) sprintf(buff,"tar cfvz /nfs2/akom%s.tgz nfs/akom  > /dev/null",date);
    else if (mode==2) sprintf(buff,"tar cfvz /nfs2/pds%s.tgz  nfs/pds   > /dev/null",date);
    else if (mode==3) sprintf(buff,"tar cfvz /nfs2/data%s.tgz nfs/data  > /dev/null",date);
    else if (mode==4) sprintf(buff,"tar cfvz /nfs2/html%s.tgz nfs/html  > /dev/null",date);
    else if (mode==5) sprintf(buff,"tar cfvz /nfs2/var%s.tgz  nfs/var   > /dev/null",date);
    else if (mode==6) sprintf(buff,"tar cfvz /nfs2/etc%s.tgz  etc root > /dev/null",date);
    else {
        printf("\n");
        printf(" xback 1 : backup to /nfs2/akom%s.tgz  from nfs/akom \n",date);
        printf(" xback 2 : backup to /nfs2/pds%s.tgz   from nfs/pds  \n",date);
        printf(" xback 3 : backup to /nfs2/data%s.tgz  from nfs/data \n",date);
        printf(" xback 4 : backup to /nfs2/html%s.tgz  from nfs/html \n",date);
        printf(" xback 5 : backup to /nfs2/var%s.tgz   from nfs/var  \n",date);
        printf(" xback 6 : backup to /nfs2/etc%s.tgz   from etc root\n",date);
        printf(" uses; /etc/crontab
01 4 * * * root /akom/bin/xback 3
01 2 */3 * * root /akom/bin/xback 1
01 3 */3 * * root /akom/bin/xback 2
01 5 */3 * * root /akom/bin/xback 4
01 6 */10 * * root /akom/bin/xback 5
01 6 */10 * * root /akom/bin/xback 6
");
        return;
    }
    system(buff);
}
