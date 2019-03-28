#define		COMMON_SIZE		40
#define		BUF_SIZE		4096

typedef struct {
	char trx_code[9];				/* 상대방 tr_code */
	char msg_code[3];			/* 전문 번호 */
	char rsp[3];				/* 응답코드 */
	char project[20];			/* 업무 코드 not used */
	char filler[5];
} COMMON;
	
typedef struct {
	COMMON 	common;
	char	msg[10];			/* "CONNECT" , "OK" */
	char	svc_gubun;			/* 'E' */
	char	filler[99];			
} SESSION;						/* 001 , 010 */

typedef struct {
	char	co_code[2];			/* 업체 코드 */
	char	data_code[3];		/* 업무 코드 */
	char	filler[15];			/* not used */
	char	flag;				/* 수신 Flag */
	char	from_time[12];		/* YYYYMMDDhhmmss */
	char	to_time[12];			/* YYYYMMDDhhmmss */
} RCVCND;

typedef struct {
	COMMON 	common;				
	char 	login_id[20];		/* magicLink Id */
	char 	password[8];		/* magicLink password */
	char	job_type[2];			/* job type (SD, RD, SR, RR) */
	RCVCND	rcvcnd;
	char	passchange;			/* wanna change password, set this field to Y */
	char	new_password[8];		
	char	commsize[4];		/* default 2048 */
	char	peer_id[10];
	char	filler[12];
} NEGO;

typedef struct {
	COMMON	common;
	char	filename[20];		/* 업체 2 + 정보 3 + index 3 */
	char	filesize[10];		/* size of file to send */
	char	snder_id[20];
	char	rcver_id[20];
	char	compressed;			/* not used */
	char	compressed_size[10]; /* not used */
	char	eof[3];				/* "NXT" or "END" */
	char	trans_type[3];		/* "NEW" or "APP" */
	char	filecode;			/* A : ascii, B : ebcdic */
	char	filler[22];
} SEND;							/* 030 , 040 */

typedef struct {
	COMMON 	common;				
	char	filename[20];		/* 업체 2 + 정보 3 + index 3 */
	char	filesize[10];		/* size of file received */
	char	confirm;			/* 처리 여부 'Y' or 'N' */
	char	filler[79];
} CONF;
