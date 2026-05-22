#include <ctype.h>
#include <malloc.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "akom.h"

file_size(char *filename)
{
	struct stat stbuf;
	if ((stat(filename,&stbuf))==-1) return 0;
	return stbuf.st_size;
}


main(int argc, char **argv)
{
    FILE *fp1,*fp2;
    char buff[500],filename[500],outfile[500];
    int total,count,mode;
    head rs_head;
    bbs  rs_bbs;
    pds  rs_pds;
    if (argc<3||strlen(argv[1])<2) {
        printf("ex) %s [mode] [Error Filename]\n",argv[0]);
        printf("mode:pds,bbs\n");
        return 0;
    }
    count=0;
    mode=0;
    if (strcmp(argv[1],"pds")==0) mode=1;
    else if (strcmp(argv[1],"bbs")==0) mode=2;
    else {
        printf("ERROR mode!  ex) %s [mode] [Error Filename]\n",argv[0]);
        printf("mode:pds,bbs\n");
        return 0;
    }

    strcpy(filename,argv[2]);
    sprintf(outfile,"%s.out",filename);

    if ( (fp1 = fopen(filename,"r")) == NULL) {
        printf("cannot read %s\n",filename);
		return 0;
	}
    if ( (fp2 = fopen(outfile,"w")) == NULL) {
        printf("cannot write %s\n",outfile);
		return 0;
	}

    fseek(fp1,0L,SEEK_SET);
    fread(&rs_head, sizeof(head), 1, fp1);
/*
    total = rs_head.total;
    if (total<1) {
        printf(" total==0 error \n");
        return 0;
    }
*/
    fwrite(&rs_head, sizeof(head), 1, fp2);
    count=0;
    while (fread(&rs_pds, sizeof(pds), 1, fp1)) {
        printf("%s %s %s ",rs_pds.id,rs_pds.name,rs_pds.filename);
        if (strlen(rs_pds.id)&&
            strlen(rs_pds.name)&&
            strlen(rs_pds.filename)) {
            count++;
            printf("  Recover count:%d\n",count);
            fwrite(&rs_pds, sizeof(pds), 1, fp2);
        }
        else {
            printf("  Skip\n");
        }
    }
    fclose(fp1);
    fclose(fp2);
    printf("%d data Recovered\n",count);

    if (count<1) {
        unlink(outfile);
    }
    else {
        printf("%s(%d byte) -> %s.old\n",filename,file_size(filename),filename);
        sprintf(buff,"mv %s %s.old",filename,filename);
        system(buff);
        printf("%s(%d byte) -> %s\n",outfile,file_size(outfile),filename);
        sprintf(buff,"mv %s %s",outfile,filename);
        system(buff);
    }
}
