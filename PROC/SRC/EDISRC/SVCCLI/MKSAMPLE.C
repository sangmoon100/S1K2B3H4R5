#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
int
main(argc,argv)
int argc;
char *argv[];
{
	long	total_bytes;
	char	snder_id[16];
	char	rcver_id[16];
	char	codata[8];
	int		sfd,dfd,nwritten,nread;
	char	srcfile[80],dstfile[80];
	char	header[80];
	char	buf[1024+1];
	struct stat stbuf;

	if (argc != 6) {
		printf("usage: mksample snder_id rcver_id co+data srcfile dstfile\n");
		return(-1);
	}
	strcpy(snder_id,argv[1]);
	strcpy(rcver_id,argv[2]);
	strcpy(codata,argv[3]);
	strcpy(srcfile,argv[4]);
	strcpy(dstfile,argv[5]);
	
	if (access(srcfile,F_OK) != 0) {
		printf("%s doesn't exist \n",srcfile);
		return(-1);
	}
	if ((sfd = open(srcfile,O_RDONLY)) < 0) {
		printf("open(%s,O_RDONLY) failed\n",srcfile);
		return(-1);
	}
	fstat(sfd,&stbuf);
	total_bytes = stbuf.st_size;
	sprintf(header,"<<NEHEAD>>1N%010ld%010ld%-10.10s%-6.6s001%-10.10s\r\n",
		total_bytes,total_bytes,snder_id,codata,rcver_id);

	if ((dfd = open(dstfile,O_WRONLY|O_CREAT|O_TRUNC,0644)) < 0) {
		printf("open(%s,O_RDONLY) failed\n",dstfile);
		return(-1);
	}
	
	if ((nwritten = write(dfd,header,strlen(header))) != strlen(header)) {
		printf("write(dfd,..) failed\n");
		return(-1);
	}

	while ((nread = read(sfd,buf,1024)) > 0) {
		if ((nwritten = write(dfd,buf,nread)) != nread) {
			printf("write(dfd,..) failed\n");
			return(-1);
		}
	}
	close(sfd);
	close(dfd);
}
