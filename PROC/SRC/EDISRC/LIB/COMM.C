/* ==============================================================
   1999.12.29   dacom EDI 상용서비스로 전환
   ver 1.0 	x25관련 부분 삭제.
* ============================================================== */
#include <stdio.h>
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
/* #include <x25/x25.h>   do not used */
/* #include <x25/x25addrstr.h> do not */ 
/* #include <x25/x25str.h>  do not */
/* #include <x25/x25ioctls.h>  do not */
/* #include <x25/ccittproto.h>  do not */

#define     MAXNOBUFRETRY   5
#define     MAX_EVENT_SIZE  34

#ifndef INADDR_NONE
#define INADDR_NONE 0xffffffff
#endif

struct sockaddr_in 	tcp_serv_addr;
struct servent     	tcp_serv_info;
struct hostent		tcp_host_info;

static char	tcpOpenErr[255];
/* ==========================================================
   ver 1.0 	x25관련 부분 삭제.
char x25SvcOpenErr[255];
static char x25PvcOpenErr[255];
static struct x25_setup_pvc_str pvc_str ;
* ========================================================== */


int
tcpOpen(host,port)
char *host;
int port;
{
	int 	fd, 	resvport;
	unsigned long	inaddr;
	struct servent	*sp;
	struct hostent	*hp;


	memset((char*) &tcp_serv_addr,'\0',sizeof(tcp_serv_addr));
	tcp_serv_addr.sin_family = AF_INET;

	if (port <= 0) {
		sprintf(tcpOpenErr,"port is below zero\n");
		return(-1);
	}
	tcp_serv_addr.sin_port = htons(port);
	
	/*dsa2000  2007.04.25. 64Bit 장비 변경에 따른 수정작업.*/
	tcp_serv_addr.sin_addr.s_addr = inet_addr(host);

/*	if ((inaddr = inet_addr(host)) != INADDR_NONE) {
		strncpy((char*)&tcp_serv_addr.sin_addr,(char*)&inaddr, sizeof(inaddr));
		tcp_host_info.h_name = NULL;
	}
	else {
		if ( (hp = gethostbyname(host)) == NULL) {
			sprintf(tcpOpenErr,"gethostbyname(%s) error, errno: %d\n",host);
			return(-1);	
		}
		tcp_host_info = *hp;
		strncpy((char*)&tcp_serv_addr.sin_addr,hp->h_addr,hp->h_length);
	}*******************************************************************************/
	
	if (port >= 0) {
		if ((fd = socket(PF_INET,SOCK_STREAM,0)) < 0) {
			sprintf(tcpOpenErr,"socket(PF_INET,..) error, errno: %d\n",errno);
			return(-1);
		}
	}

	if (connect(fd,(struct sockaddr*)&tcp_serv_addr,sizeof(tcp_serv_addr)) < 0){
		sprintf(tcpOpenErr,"connect error, errno : %d\n",errno);
		printf("tcpOpenErr : %s\n",tcpOpenErr);
		close(fd);
		return(-1);
	}
	return(fd);
}

/*   ============================================================
1999.12.29 사용안함
   ver 1.0 	x25관련 부분 삭제.

int
x25SvcOpen( ifname, addr )
char    *ifname;
char    *addr;
{
    char    *p, *sp;
    static  int     fd = -1;
    struct  x25addrstr  serv_addr;
    struct  x25_userdata    userdata;

    if ( ( fd = socket ( AF_CCITT, SOCK_STREAM, X25_PROTO_NUM ) ) < 0 ) {
		sprintf(x25SvcOpenErr,"socket(AF_CCITT,..) error, errno: %d\n",errno);
        return(-1);
    }

    bzero ( (char *) &serv_addr, sizeof (serv_addr) );
    strncpy(serv_addr.x25ifname, ifname, X25_MAX_IFNAMELEN);
    strncpy(serv_addr.x25_host, addr, X25_MAXHOSTADDR);
    serv_addr.x25_family         = AF_CCITT;
    serv_addr.x25hostlen = strlen ( serv_addr.x25_host);

    if (connect(fd, (struct sockaddr *)&serv_addr,sizeof(serv_addr) ) < 0 ){
		sprintf(x25SvcOpenErr,"connect(%d,..) errno: %d\n",fd,errno);
        close(fd);
        return(-1);
    }
    return (fd);
}


int
x25PvcOpen(ifname,lci)
char    *ifname;
int     lci;
{
    char    *p, *sp;
    static  int     fd = -1;
    unsigned char   buf[50];

    if ( ( fd = socket ( AF_CCITT, SOCK_STREAM, X25_PROTO_NUM ) ) < 0 ) {
		sprintf(x25PvcOpenErr,"socket(AF_CCITT,..) error, errno: %d\n",errno);
        return(-1);
    }
    strcpy(pvc_str.ifname, ifname);
    pvc_str.lci = lci;

    if ( ioctl(fd, X25_SETUP_PVC, &pvc_str ) < 0 ) {
    	if ( errno == EBUSY ) 
        	sprintf(x25PvcOpenErr, "%d is already in use \n", 
						pvc_str.lci);
    	else if ( errno == EINVAL ) 
        	sprintf(x25PvcOpenErr, "%d really configured as a PVC?\n", 
						pvc_str.lci);
    	else if ( errno == ENODEV )
        	sprintf(x25PvcOpenErr,"%s is not a valid X.25 interface\n", 
						pvc_str.ifname);
    	else if ( errno == ENETUNREACH ) 
        	sprintf(x25PvcOpenErr,"Level2 (LAP-B Level) is down \n");
    	else if ( errno == ENETDOWN ) 
        	sprintf(x25PvcOpenErr,"Interface %s is down now. run x25init\n", 
						pvc_str.ifname);
		else  
			sprintf(x25PvcOpenErr,"ioctl(%d,..) error, errno: %d\n",errno);
		
		return(-1);
    }
    while (recv(fd, buf, 50, MSG_OOB) > 0 );
    return(fd);
}

*   ============================================================*/

int
readn(fd,ptr,nbytes)
int fd;
char *ptr;
int nbytes;
{
	int nleft, nread;

	nleft = nbytes;

	while (nleft > 0) {
		nread = read(fd,ptr,nleft);
		if (nread < 0)
			return(-1);
		else if (nread == 0)
			break;

		nleft -= nread;
		ptr += nread;
	}
	return(nbytes - nleft);
}

int
writen(fd,ptr,nbytes)
int fd;
char *ptr;
int nbytes;
{
    int nleft, nwritten;

    nleft = nbytes;

    while (nleft > 0) {
        nwritten = write(fd,ptr,nleft);
        if (nwritten < 0)
            return(-1);
        nleft -= nwritten;
        ptr += nwritten;
    }
    return(nbytes - nleft);
}
