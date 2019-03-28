/* 외환은행에서 전송한  급여이체결과 수신   

*/

#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "comm.h"
#include "common.h"
#include "clidef.h"

int sfd = -1;
extern	void snd_timeout();
extern	void rcv_timeout();

int	rsp;
char rspbuf[3+1];

int
main(argc,argv)
int argc;
char **argv;
{

	int		i,ret;
	char 	filename[100];
	char	rcv_dir[80];
	char	job_type[2+1];			/* RD, RS, RR */
	char	flag;
	char	from_time[14+1],to_time[14+1];

	if (argc != 5 && argc != 7) {
		printf("usage: rcvd [-d rcv_dir] co+data flag from to\n");
		return(-1);
	}
	else if (argc == 5){
		sprintf(rcv_dir,"%s",getcwd(NULL,80));
		strcpy(filename,argv[1]);
		flag = *argv[2];
		strcpy(from_time,argv[3]);
		strcpy(to_time,argv[4]);
		if (strlen(from_time) != 14  || strlen(to_time) != 14) {
			printf("usage: rcvd [-d rcv_dir] co+data flag from to\n");
			return(-1);
		}							/* just usage check */	
	}
	else if (argc == 7 && !strncmp(argv[1],"-d",2)) {
		if (*argv[2] != '/') 
			sprintf(rcv_dir,"%s/%s",getcwd(NULL,80),argv[2]);
		else
			strcpy(rcv_dir,argv[2]);

		if (access(rcv_dir,F_OK) < 0) {
			if (make_dir(rcv_dir) < 0) {
				printf("cannot creat %s \n",rcv_dir);
				return(-1);
			}
		}							/* rcv dir creation */
		chdir(rcv_dir);				/* move to the dir */
		if (!strncasecmp(rcv_dir+strlen(rcv_dir)-2,"rr",2)) 
			strcpy(job_type,"RR");		/* rcv report */		 
		else if (!strncasecmp(rcv_dir+strlen(rcv_dir)-2,"rs",2)) 
			strcpy(job_type,"RS");		/* snd report */
		else
			strcpy(job_type,"RD");		/* data */

		strcpy(filename,argv[3]);
		flag = *argv[4];
		strcpy(from_time,argv[5]);
		strcpy(to_time,argv[6]);
		if (strlen(from_time) != 14  || strlen(to_time) != 14) {
			printf("usage: rcvd [-d rcv_dir] co+data flag from to\n");
			return(-1);
		}							/* just usage check */	
	}
	else  {
		printf("usage: rcvd [-d rcv_dir] co+data flag from to\n");
		return(-1);
	}

	if ((sfd = tcpOpen(IP,PORT)) < 0) {
		printf("tcpOpen(%s,%d) failed\n",IP,PORT);
		return(-1);
	}

	rsp = snd_login(job_type,filename,flag,from_time,to_time);
	/*========================================*/
	printf("job_type===> %s", job_type) ;
	printf("filename===> %s", filename) ;
	printf("flag  ===> %s", flag) ;
	
	/*========================================*/
	

	if (rsp == OK) {
		while(1) {
			ret = rcv_filepath();
			if (ret < 0) {
				printf("rcv_filepath() failed\n");
				return(-1);
			}
			else if (ret == 0) {
				printf("rcv_filepath() success\n");
				continue;		/* NXT */
			}
			else
				break;			/* EOF */
		}
	}
	else if (rsp == NODATA) {
		printf("snd_login no data with that condition \n");
		return(-1);
	}
	else {
		printf("snd_login failed\n");
		return(-1);
	}

	rsp = snd_logout(job_type,filename,flag,from_time,to_time);

	if (rsp != OK) {
		printf("snd_logout failed\n");
		return(-1);
	}
	printf("rcv data successfully\n");
	return(0);
}
int
rcv_filepath()
{
	SEND	send;
	CONF	conf;
	char	data[4096+1];
	char	command[128];

	char	eof[3+1];
	char	trans_type[3+1];

	long	total_bytes,cur_rcved_bytes,seqno;
	int 	fd,i;
	int 	nwritten, nread;
	char	dacom_fname[80];
	struct  stat stbuf;

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
    
	if ((rsp = rsp_print(send.common.rsp)) != OK)
		return(-1);

	if (strncmp(send.common.trx_code,TRX_CODE,strlen(TRX_CODE))) {
        printf("trx_code failed [%-8.8s][%-8.8s]\n",
			TRX_CODE,send.common.trx_code);
        return(-1);
    }

    if (strncmp(send.common.msg_code,"100",3)) {
        printf("메세지 종류 오류입니다. [100] [%-3.3s]\n",send.common.msg_code);
        return(-1);
    }
	total_bytes = atoln(send.filesize,10);
	if (total_bytes <= 0) {
		printf("total_bytes 오류입니다. [%ld]\n",total_bytes);
		return(-1);
	}
	memset(dacom_fname,'\0',80);
	strncpy(dacom_fname,send.filename,20);
	for (i = 0; i < strlen(dacom_fname); i++) {
		if (dacom_fname[i] == ' ')
			dacom_fname[i] = '\0';
	}

	memset(eof,'\0',3+1);
	strncpy(eof,send.eof,3);

	if (strncasecmp(eof,"END",3) && strncasecmp(eof,"NXT",3)) {
		printf("Eof Mark 오류입니다. [NXT/END] [%3.3s]\n",eof);
		return(-1);
	}

	memset(trans_type,'\0',3+1);
	strncpy(trans_type,send.trans_type,3);

	if (strncasecmp(trans_type,"NEW",3) && strncasecmp(trans_type,"APP",3)) {
		printf("trans_trans_type 오류입니다. [NEW/APP] [%3.3s]\n",trans_type);
		return(-1);
	}
	
	strncpy(send.common.trx_code,TRX_CODE,strlen(TRX_CODE));
	strncpy(send.common.msg_code,"110",3);
	strncpy(send.common.rsp,"000",3);

	strncpy(send.filename,dacom_fname,strlen(dacom_fname));
	cur_rcved_bytes = 0;

	if (!strncasecmp(trans_type,"APP",3)) {
		if (access(dacom_fname,F_OK) != 0)
			strncpy(send.filesize,"0000000000",10);
		else {
			lstat(dacom_fname,&stbuf);
			cur_rcved_bytes = stbuf.st_size;
			sprintf(send.filesize,"%010ld",cur_rcved_bytes);
		}
	}
	else {
		strncpy(send.filesize,"0000000000",10);
	}
	send.snder_id[0] = 'A'; 		/* for trick */

    sigset(SIGALRM,snd_timeout);
    alarm(ALARM);
    if ((nwritten = writen(sfd,&send,sizeof(SEND))) != sizeof(SEND)) {
        alarm(0);
        printf("writen(sfd,..) failed\n");
        return(-1);
    }
    alarm(0);
	printf("=>: [%-150.150s]\n",&send);

    printf("Local[%-20.20s] Dacom[%-20.20s]\n",
		dacom_fname,send.filename);

	if ((fd = open(dacom_fname,O_WRONLY|O_CREAT|O_TRUNC,0644)) < 0) {
		printf("open(%s,..) failed\n",dacom_fname);
		return(-1);
	}
	seqno = 0;
	lseek(fd,cur_rcved_bytes,SEEK_SET);
	printf("total_bytes[%ld] cur_rcved_bytes[%ld] seqno[%ld]\n",
		total_bytes,cur_rcved_bytes,seqno);

	while(cur_rcved_bytes < total_bytes) {
		int rsize;
		memset(data,'\0',4096+1);

	    sigset(SIGALRM,rcv_timeout);
    	alarm(ALARM);
    	if ((nread = read(sfd,data,DATA_SIZE)) < 0) {
 			alarm(0);
			close(fd);
 			printf("%d = readn(sfd,..) failed\n",nread);
 			return(-1);
    	}
		else if (nread == 0)  {
			alarm(0);
			break;
		}
    	alarm(0);

    	if ((nwritten = writen(fd,data,nread)) != nread) {
 			printf("%d = writen(fd,..) failed\n",nwritten);
 			return(-1);
    	}
		cur_rcved_bytes += nread;
	}
	close(fd);
	printf("total_bytes [%ld] cur_rcved_bytes[%ld] seqno[%ld]\n",
		total_bytes,cur_rcved_bytes,seqno);

	memset(&conf,' ',sizeof(CONF));
    strncpy(conf.common.trx_code,TRX_CODE,strlen(TRX_CODE));
    strncpy(conf.common.msg_code,"130",3);
    strncpy(conf.filename,dacom_fname,strlen(dacom_fname));
	sprintf(conf.filesize,"%010ld",cur_rcved_bytes);

	if (cur_rcved_bytes == total_bytes)  {
		strncpy(conf.common.rsp,"000",3);
		conf.confirm = 'Y';
	}
	else {
		printf("total bytes 오류입니다.\n");
		return(-1);
	}

    sigset(SIGALRM,snd_timeout);
    alarm(ALARM);
    if ((nwritten = writen(sfd,&conf,sizeof(CONF))) != sizeof(CONF)) {
        alarm(0);
        printf("%d = writen(sfd,..) failed\n",nwritten);
        return(-1);
    }
    alarm(0);
    printf("=>: [%-150.150s]\n",&conf);

	if (!strncasecmp(eof,"NXT",3))
		return(0);
	else
    	return(1);
}
