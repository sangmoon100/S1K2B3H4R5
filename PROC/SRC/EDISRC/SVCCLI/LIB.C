#include <signal.h>
#include <fcntl.h>
#include <stdio.h>
#include "clidef.h"
#include "comm.h"
#include "common.h"

extern	void snd_timeout();
extern	void rcv_timeout();
extern	int		sfd;
extern	int		rsp;
int
snd_login(job,fname,flag,ft,tt)
char *job,*fname,*ft,*tt;
char flag;
{
    NEGO    nego;
    int     nwritten,nread;

    memset(&nego,' ',sizeof(NEGO));

    strncpy(nego.common.trx_code,TRX_CODE,strlen(TRX_CODE));
    strncpy(nego.common.msg_code,"003",3);
    strncpy(nego.common.rsp,"000",3);

    strncpy(nego.login_id,MAGICLINKID,strlen(MAGICLINKID));
    strncpy(nego.password,PASSWORD,strlen(PASSWORD));
    strncpy(nego.job_type,job,strlen(job));
    strncpy(nego.rcvcnd.co_code,fname,2);
    strncpy(nego.rcvcnd.data_code,fname+2,3);
    strncpy(nego.rcvcnd.filler,fname+5,strlen(fname));
    nego.rcvcnd.flag = flag;
    strncpy(nego.rcvcnd.from_time,ft,strlen(ft));
    strncpy(nego.rcvcnd.to_time,tt,strlen(tt));

    sigset(SIGALRM,snd_timeout);
    alarm(ALARM);
    if ((nwritten = writen(sfd,&nego,sizeof(NEGO))) != sizeof(NEGO)) {
        alarm(0);
        printf("%d = writen(sfd,..) failed\n",nwritten);
        return(-1);
    }
    alarm(0);
	printf("=>: [%-70.70s]\n",&nego);

    sigset(SIGALRM,rcv_timeout);
    alarm(ALARM);
    if ((nread = readn(sfd,&nego,sizeof(NEGO))) != sizeof(NEGO)) {
        alarm(0);
        printf("%d = readn(sfd,..) failed\n",nread);
        return(-1);
    }
    alarm(0);
	printf("<=: [%-70.70s]\n",&nego);

    if ((rsp = rsp_print(nego.common.rsp)) != OK)
        return(-1);

    if (strncmp(nego.common.msg_code,"030",3)) {
        printf("메세지 코드가 틀립니다. [030][%-3.3s]\n",nego.common.msg_code);
        return(-1);
    }

    if (strncmp(nego.login_id,MAGICLINKID,strlen(MAGICLINKID))) {
        printf("LOGIN ID가 틀립니다. [%-10.10s][%-10.10s]\n",
            nego.login_id,MAGICLINKID);
        return(-1);
    }
    return(0);
}


int
snd_logout(job,fname,flag,ft,tt)
char *job,*fname,*ft,*tt;
char flag;
{
    NEGO    nego;
    int     nwritten,nread;

    memset(&nego,' ',sizeof(NEGO));

    strncpy(nego.common.trx_code,TRX_CODE,strlen(TRX_CODE));
    strncpy(nego.common.msg_code,"007",3);
    strncpy(nego.common.rsp,"000",3);

    strncpy(nego.login_id,MAGICLINKID,strlen(MAGICLINKID));

	sigset(SIGALRM,snd_timeout);
    alarm(ALARM);

    if ((nwritten = writen(sfd,&nego,sizeof(NEGO))) != sizeof(NEGO)) {
        alarm(0);
        printf("%d = writen(sfd,..) failed\n",nwritten);
        return(-1);
    }
    alarm(0);
	printf("=>: [%-150.150s]\n",&nego);

	memset(&nego,'\0',sizeof(NEGO));
    sigset(SIGALRM,rcv_timeout);
    alarm(ALARM);
    if ((nread = readn(sfd,&nego,sizeof(NEGO))) != sizeof(NEGO)) {
        alarm(0);
        printf("%d = readn(sfd,..) failed\n",nread);
        return(-1);
    }
    alarm(0);
	printf("<=: [%-150.150s]\n",&nego);

    if ((rsp = rsp_print(nego.common.rsp)) != OK)
        return(-1);

    if (strncmp(nego.common.msg_code,"070",3)) {
        printf("메세지 코드가 틀립니다. [070][%-3.3s]\n",nego.common.msg_code);
        return(-1);
    }
    if (strncmp(nego.login_id,MAGICLINKID,strlen(MAGICLINKID))) {
        printf("LOGIN ID가 틀립니다. [%-10.10s][%-10.10s]\n",
            nego.login_id,MAGICLINKID);
        return(-1);
    }
    return(0);
}

int
rsp_print(rsp)
char *rsp;
{
    if (!strncmp(rsp,"000",3))
        return(atoin(rsp,3));
    else if (!strncmp(rsp,"001",3))  {
        printf("시스템 장애입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"002",3))  {
        printf("USER-ID 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"003",3))  {
        printf("비밀번호 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"004",3))  {
        printf("JOB-TYPE  오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"005",3))  {
        printf("조건에 맞는 데이타가 없습니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"006",3))  {
        printf("전송종류 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"007",3))  {
        printf("전송 BYTE(화일크디) 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"008",3))  {
        printf("전문 형식 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else if (!strncmp(rsp,"099",3))  {
        printf("기타 오류입니다...\n");
        return(atoin(rsp,3));
    }
    else {
        printf("정의 되지 않은 오류입니다.\n");
        return(99);
    }
}
