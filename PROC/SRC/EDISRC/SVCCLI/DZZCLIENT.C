/*
-- usage   : dzzclient -i "ip" -p "port" -c "command" 
-- compile :
             Sun : cc -lsocket -lnsl -g -o  dzzclient dzzclient.c
             HP  : cc +M1 +DA2.0W -g -o dzzclient dzzclient.c
*/
#include   <stdio.h>
#include   <string.h>
#include   <stdlib.h>
#include   <unistd.h>
#include   <sys/socket.h>
#include   <arpa/inet.h>

#define    RCVBUFSIZE 1024
#define    SNDBUFSIZE 1024
#define    FAILURE    -1

void DieWithError(char * errorMessage);
int  ha_strlen(char *string);
int  ha_batch_start(int ic, char **iv);

char               *servIP;
unsigned short     echoServPort;
char               echoString[SNDBUFSIZE];
unsigned int       echoStringLen;
char               v_command[200];

int main(int argc, char *argv[])
{
    int                sock;
    struct sockaddr_in echoServAddr;
    char              *tmpString;
    char               echoBuffer[RCVBUFSIZE];
    char               sendBuffer[SNDBUFSIZE];
    int                bytesRcvd, totalBytesRcvd;
    int                i_ret;
    FILE              *fd;
    char               v_host[50];

    i_ret = ha_batch_start(argc, argv);

    if (i_ret == FAILURE) {
        printf("Usage: %s -iIP -pPORT -cCOMMAND\n", argv[0]);
        printf("배치 작업 초기화 오류!!\n");
        exit(FAILURE);
    }

/*
    printf("ip=[%s]\nport=[%d]\ncommand=[%s]\n", servIP, echoServPort, v_command);
*/

    memset(v_host,0x00,sizeof(v_host));
    gethostname(v_host,sizeof(v_host));

    if(( fd=popen(v_command,"r") ) == NULL)
    {
        printf("error : popen error\n");
        return -1;
    }

    memset(&echoServAddr, 0, sizeof(echoServAddr));
    echoServAddr.sin_family = AF_INET;
    echoServAddr.sin_addr.s_addr = inet_addr(servIP);
    echoServAddr.sin_port  = htons(echoServPort);

        if((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == 0)
            printf ( "sock success..[%d]\n",sock);

        if(connect(sock, (struct sockaddr *) &echoServAddr, sizeof(echoServAddr)) == 0)
            printf ( "conn success..[%d]\n",sock);
        
   exit ;

    memset(echoString, 0x00, sizeof(echoString));

    while(fgets(echoString, SNDBUFSIZE, fd))
    {
        if((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
            DieWithError("socket() failed");

        if(connect(sock, (struct sockaddr *) &echoServAddr, sizeof(echoServAddr)) < 0)
            DieWithError("socket connect() failed");
        
        echoStringLen = ha_strlen(echoString);
        echoString[echoStringLen-1] = 0x00;

        memset(sendBuffer, 0x00, sizeof(sendBuffer));
        sprintf(sendBuffer,"[%s]%s",v_host,echoString);
        echoStringLen = ha_strlen(sendBuffer);
    
        if(send(sock, sendBuffer, echoStringLen, 0) != echoStringLen) 
            DieWithError("send() sent a different number of bytes than expected");
    
        totalBytesRcvd = 0;
        if((bytesRcvd = recv(sock, echoBuffer, RCVBUFSIZE -1, 0)) <= 0)
            DieWithError("recv() failed");
    
        memset(echoString, 0x00, sizeof(echoString));

        shutdown(sock,0);
        close(sock);
    }

    exit(0);
}

void DieWithError(char * errorMessage)
{
    perror(errorMessage);
    exit(1);
}

int ha_strlen(char *string)
{
    int     length;
    size_t  orglen;

    char    *vptr;

    orglen = strlen(string);

    vptr = (char *)&orglen;
    vptr += sizeof(size_t);
    vptr -= sizeof(int);

    memcpy(&length, vptr, sizeof(int));

    return (length);
}

int ha_batch_start(int ic, char **iv)
{
    int  i, cnt = 0;

    for(i = 1; i < ic; i++)
    {
        /*
         * ip
         */
        if (!strcmp(iv[i], "-i"))
        {
            i++;
            servIP = iv[i];
            cnt++;
        }
        else if (!strncmp(iv[i], "-i", 2))
        {
            servIP = iv[i] + 2;
            cnt++;
        }

        /*
         * ip
         */
        else if (!strcmp(iv[i], "-p"))
        {
            i++;
            echoServPort = atoi(iv[i]);
            cnt++;
        }
        else if (!strncmp(iv[i], "-p", 2))
        {
            echoServPort = atoi(iv[i] + 2);
            cnt++;
        }

        /*
         * command
         */
        else if (!strcmp(iv[i], "-c"))
        {
            i++;
            memset(v_command, 0x00, sizeof(v_command));
            strcpy(v_command,iv[i]);
            cnt++;
        }
        else if (!strncmp(iv[i], "-c", 2))
        {
            memset(v_command, 0x00, sizeof(v_command));
            strcpy(v_command,iv[i] + 2);
            cnt++;
        }
    }

    /*
     * 필수 매개변수가 모자란 경우
     */
    if (cnt < 3)
    {
        return (-1);
    }

    return (cnt);
}
