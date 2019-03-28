/*++++++++++++++++++++++++++++++++++++++++*/
/*+        Configuration Define          +*/
/*++++++++++++++++++++++++++++++++++++++++*/

#define	HOME 		"/hper/insa/edi"

/* #define IPADDRESS 	"164.124.12.105" */
#define IPADDRESS 	"172.22.1.105"     /* 1999.12.08 변경*/
/* #define IPADDRESS 	"203.233.124.56"   * 1999.12.28 변경*/
/* #define IPADDRESS 	"164.124.12.34" */

/* #define IPADDRESS 	"164.124.12.24" */
#define PORTNUM		1690
/* #define PORTNUM		2212 */

#define MAX_LEN 	2048 
#define DATA_LEN 	1890 

#define LOGIN_ID 	"BK01495 "    /*  하나로에서 원격지에 로그인 할 id*/
#define PASSWD 		""       

/*++++++++++++++++++++++++++++++++++++++++*/
/*+             Path Define              +*/
/*++++++++++++++++++++++++++++++++++++++++*/

#define	SRC	"/SRC"
#define BIN	"/bin"

#define DATA		"data"
#define WAIT		"WAIT"
#define	SENT		"SENT"
#define RECV		"RECV"
#define SENDLIST	"SENDLIST"
#define RECVLIST	"RECVLIST"
#define TRANLIST	"TRANLIST"

#define LOG		"log"
#define SENDLOG		"SENDLOG"
#define RECVLOG 	"RECVLOG"

#define SERIAL_FILE "SERIAL_FILE"

/*++++++++++++++++++++++++++++++++++++++++*/
/*+             Etc Define              +*/
/*++++++++++++++++++++++++++++++++++++++++*/

#define DACOM			"DACOM-EDI"
#define LOGSIZE			256*1024	
#define INIT			1
#define NORM			0


typedef struct {
char gubun[2];
char companyCode[2];
char dataCode[3];
char compress; 
char size[4];
char seqNo[6];
char end[2];
} commHead;

typedef struct {
char gubun[2];
char companyCode[2];
char dataCode[3];
char seqNo[6];
char rsp[3];
} rspHead;

typedef struct {
commHead hd;
char 	data[1900];
} sndDataFormat;

typedef struct {
commHead hd;
char 	data[1900];
} rcvDataFormat;



