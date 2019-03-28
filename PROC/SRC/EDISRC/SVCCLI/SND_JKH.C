/* 외환은행에 급여 이체파일 전송*/

#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "comm.h"
#include "common.h"
#include "clidef.h"

#include <sys/types.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <fcntl.h> 
#include <varargs.h>

#define     MAXNOBUFRETRY   5
#define     MAX_EVENT_SIZE  34

#ifndef INADDR_NONE
#define INADDR_NONE 0xffffffff
#endif

struct sockaddr_in 	tcp_serv_addr;
struct servent     	tcp_serv_info;
struct hostent		tcp_host_info;

static char	tcpOpenErr[255];



int sfd = -1;
extern	void snd_timeout();
extern	void rcv_timeout();

int	rsp;
char	rspbuf[3+1];

int
main(argc,argv)
int argc;
char **argv;
{

	char 	*filename[100];
	int	i,filenum;
	char	job_type[2+1];
	char	end[80],type[80];
	int 	fd;

	if (argc < 3) {
		printf("usage: sndd -f filename,...\n");
		printf("usage: sndd -a filename\n");
		sleep(1);
		return(-1);
	}

	strcpy(job_type,"SD");			/* send data */
	filenum= 0;
	if (!strncasecmp(argv[1],"-f",2))  {
		strcpy(type,"NEW");
		for(i = 0; i < argc-2; i++)  {
			filename[i] = argv[i+2];
			if (access(filename[i], F_OK) < 0) {
				printf("%s doesn't exist\n",filename[i]);
				sleep(1);
				return(-1);
			}
			filenum++;
		}
	}
	else if (!strncasecmp(argv[1],"-a",2)) {
		strcpy(type,"APP");
		for(i = 0; i < 1; i++)  {
			filename[i] = argv[i+2];
			if (access(filename[i], F_OK) < 0) {
				printf("%s doesn't exist\n",filename[i]);
				sleep(1);
				return(-1);
			}
			filenum++;
		}
	}
	else {
		printf("usage: sndd -f filename,...\n");
		printf("usage: sndd -a filename\n");
		sleep(1);
		return(-1);
	}

	tcp_serv_addr.sin_family = AF_INET;
	tcp_serv_addr.sin_port = htons(PORT);
	tcp_serv_addr.sin_addr.s_addr = inet_addr(IP);
	
	
        if((sfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
            printf ( "socket error...\n");
            	

	if (connect(sfd,(struct sockaddr*)&tcp_serv_addr,sizeof(tcp_serv_addr)) < 0){
		printf("6\n");
		sprintf(tcpOpenErr,"connect error, errno : %d\n",errno);
		printf("tcpOpenErr : %s\n",tcpOpenErr);
		close(fd);
		return(-1);
	}
	

/*	
	if ((sfd = tcpOpen(IP,PORT)) < 0) {
		printf("tcpOpen(%s,%d) failed\n",IP,PORT);
		return(-1);
	}
*/	
	rsp = snd_login(job_type,NULL,' ',NULL,NULL);

	if (rsp == OK) {
		for(i =0 ; i < filenum; i++) {
			if (i == filenum -1 ) 
				strcpy(end,"END");
			else	
				strcpy(end,"NXT");

			if (snd_filepath(filename[i],MAGICLINKID,NULL,end,type) < 0) {
				printf("snd_filepath(%s,%s,NULL,%s,%s) failed\n",
					filename[i],MAGICLINKID,end,type);
				sleep(1);
				return(-1);
			}
			printf("snd_filepath(%s,%s,NULL,%s,%s) success\n",
					filename[i],MAGICLINKID,end,type);
		}
	}
	else
		return(-1);

    rsp = snd_logout(job_type,NULL,' ',NULL,NULL);
    if (rsp != OK) {
        printf("snd_logout failed\n");
        return(-1);
    }
    else
        printf("OK\n"); 
}

int
snd_filepath(fpath,snder_id,rcver_id,end,type)
char *fpath;
char *snder_id,*rcver_id;
char *end;
char *type;
{
	SEND	send;
	CONF	conf;
	char	data[4096+1];
	char	*fname,*p;
	struct stat stbuf;
	long	total_bytes,cur_sent_bytes,seqno;
	int 	fd;
	int 	nwritten, nread,i;
	char	dacom_fname[80];

	if (access(fpath,F_OK) < 0) {
		printf("%s doesn't exits\n",fpath);
		return(-1);
	}
	lstat(fpath,&stbuf);
	total_bytes = stbuf.st_size;

	memset(&send,' ',sizeof(SEND));

	strncpy(send.common.trx_code,TRX_CODE,strlen(TRX_CODE));
	strncpy(send.common.msg_code,"100",3);
	strncpy(send.common.rsp,"000",3);
    fname = fpath;
    printf("fname : %s\n",fname);
    
    if((p=(char *) strrchr(fpath, '/')) != NULL)  { 
        p++;
        fname = p;
    }
	strncpy(send.filename,fname,strlen(fname));
	sprintf(send.filesize,"%010ld",total_bytes);
	strncpy(send.snder_id,snder_id,strlen(snder_id));
	strncpy(send.rcver_id,rcver_id,strlen(rcver_id));
	send.compressed = 'N';
	strncpy(send.compressed_size,"0000000000",10);
	strncpy(send.eof,end,strlen(end));
	strncpy(send.trans_type,type,strlen(type));
	send.filecode = 'A';

    sigset(SIGALRM,snd_timeout);
    alarm(ALARM);
    if ((nwritten = writen(sfd,&send,sizeof(SEND))) != sizeof(SEND)) {
        alarm(0);
        printf("writen(sfd,..) failed\n");
        return(-1);
    }
    alarm(0);
	printf("=>: [%-150.150s]\n",&send);

	memset(&send,'\0',sizeof(SEND));
    sigset(SIGALRM,rcv_timeout);
    alarm(ALARM);
    if ((nread = readn(sfd,&send,sizeof(SEND))) != sizeof(SEND)) {
        alarm(0);
        printf("%d = readn(sfd,..) failed\n",nread);
        return(-1);
    }
    alarm(0);
	printf("<=: [%-150.150s]\n",&send);

	if (rsp_print(send.common.rsp) < 0)
        return(-1);

	if (strncmp(send.common.trx_code,TRX_CODE,strlen(TRX_CODE))) {
        printf("trx_code failed [%-8.8s][%-8.8s]\n",TRX_CODE,send.common.trx_code);
        return(-1);
    }

    if (strncmp(send.common.msg_code,"110",3)) {
        printf("메세지 종류 오류입니다. [110] [%-3.3s]\n",send.common.msg_code);
        return(-1);
    }
    printf("Local[%-20.20s] Dacom[%-20.20s]\n", fname,send.filename);

	memset(dacom_fname,'\0',80);
    strncpy(dacom_fname,send.filename,20);
    for (i = 0; i < strlen(dacom_fname); i++) {
        if (dacom_fname[i] == ' ')
            dacom_fname[i] = '\0';
    }

	cur_sent_bytes = 0;
	if (!strncmp(type,"APP",3)) {
		cur_sent_bytes = atoln(send.filesize,10);
		if (cur_sent_bytes < 0) {
			printf("total bytes 오류입니다. \n");
			return(-1);
		}
	}
	seqno = 0;
	printf("total_bytes[%ld] cur_sent_bytes[%ld] seqno[%ld]\n",
		total_bytes,cur_sent_bytes,seqno);
	printf("First Report=========\n");

	if ((fd = open(fpath,O_RDONLY)) < 0) {
		printf("open(%s,..) failed\n",fpath);
		return(-1);
	}
	lseek(fd,cur_sent_bytes,SEEK_SET);

	while(cur_sent_bytes < total_bytes) {
		memset(data,' ',4096+1);

		if ((nread = read(fd,data,DATA_SIZE)) < 0) {
			printf("read(fd,..) failed\n");
			close(fd);
			return(-1);
		}
		cur_sent_bytes += nread;

	    sigset(SIGALRM,snd_timeout);
    	alarm(ALARM);
    	if ((nwritten = writen(sfd,data,nread)) != nread) {
 			alarm(0);
 			printf("writen(sfd,..) failed\n");
 			return(-1);
    	}
    	alarm(0);
	}
	close(fd);

	printf("Last Report==========\n");
	printf("total_bytes [%ld] cur_sent_bytes[%ld] seqno[%ld]\n",
		total_bytes,cur_sent_bytes,seqno);


	memset(&conf,'\0',sizeof(CONF));
    sigset(SIGALRM,rcv_timeout);
    alarm(ALARM);
    if ((nread = readn(sfd,&conf,sizeof(CONF))) != sizeof(CONF)) {
        alarm(0);
        printf("%d = readn(sfd,..) failed\n",nread);
        return(-1);
    }
    alarm(0);

	printf("<=: [%-150.150s]\n",&conf);

    if (rsp_print(conf.common.rsp) < 0)
        return(-1);

    if (strncmp(conf.common.trx_code,TRX_CODE,strlen(TRX_CODE))) {
        printf("trx_code failed [%-8.8s][%-8.8s]\n",TRX_CODE,conf.common.trx_code);
        return(-1);
    }

    if (strncmp(conf.common.msg_code,"130",3)) {
        printf("메세지 종류 오류입니다. [130] [%-3.3s]\n",conf.common.msg_code);
        return(-1);
    }
    if (strncmp(conf.filename,dacom_fname,strlen(dacom_fname))) {
        printf("filename 오류입니다. [%-20.20s] [%-20.20s]\n",
			dacom_fname,conf.filename);
        return(-1);
    }
	if (cur_sent_bytes == total_bytes && total_bytes == atoln(conf.filesize,10))
		;
	else {
		printf("total_bytes 오류입니다. [%ld] [%ld] [%ld]\n",
			cur_sent_bytes,total_bytes,atoln(conf.filesize,10));
		return(-1);
	}

	if (conf.confirm != 'Y') {
		printf("confirm 오류입니다. [Y] [%c]\n",conf.confirm);
		return(-1);
	}
    return(0);
}

