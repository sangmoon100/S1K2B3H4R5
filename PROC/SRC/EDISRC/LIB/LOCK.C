#include <sys/types.h>
#include <fcntl.h>
#include "lock.h"
#define	off_t	long

int
lock_reg(fd, cmd, type,offset,whence,len)
int fd,cmd,type,whence;
off_t offset,len;
{
	struct flock lock;
	
	lock.l_type = type;
	lock.l_start = offset;
	lock.l_whence = whence;
	lock.l_len = len;

	return(fcntl(fd,cmd,&lock));
}

