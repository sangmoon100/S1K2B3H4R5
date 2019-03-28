#include	<stdio.h>
#include	<errno.h>
#include	<sys/stat.h>
#include	<varargs.h>
#include	<sys/socket.h>
#include	<signal.h>
#include	<sys/ipc.h>
/* ===========================================================
1999.12.29  
ver  1.0   x25관련 삭제 
#include	<x25/x25.h>
* ===========================================================*/

#define		LOGSIZE		1024*512

extern 	int errno;
FILE *logfp;

mkDir(dir)
char *dir;
{
 	if (mkdir(dir,0777))    {
		if (errno == EEXIST)    
 			return;
 		else  
 			return(-1);
  	}
}

int
openLogFile(logfile)
char *logfile;
{
    if ((logfp = fopen(logfile, "a+")) == 0) {
		fprintf(stderr, "fopen(%s) error, errno: %d\n", logfile,errno);
		return(-1);
    }
}

int
clearLogFile(logfile)
char *logfile;
{
	char    command[80];
    struct  stat stbuf;
    int     size;

    fstat(fileno(logfp), &stbuf);
    if (stbuf.st_size < LOGSIZE)
        return(0);
    fclose(logfp);

    sprintf(command,"mv %s %s.old",logfile,logfile);
	system(command);
}

int
LOG ( va_alist )
va_dcl
{
    char    *format;
    va_list args;

    if ( logfp == NULL ) return(0);

    va_start ( args );
    format = va_arg ( args, char *);

    vfprintf( logfp, format, args );
    va_end (args );

    fflush(logfp);
}
