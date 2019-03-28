#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define	read_lock(fd, offset, whence, len) \
lock_reg(fd, F_SETLK, F_RDLCK, offset, whence, len)
#define	readw_lock(fd, offset, whence, len) \
lock_reg(fd, F_SETLKW, F_RDLCK, offset, whence, len)

#define	write_lock(fd, offset, whence, len) \
lock_reg(fd, F_SETLK, F_WRLCK, offset, whence, len)
#define	writew_lock(fd, offset, whence, len) \
lock_reg(fd, F_SETLKW, F_WRLCK, offset, whence, len)

#define	un_lock(fd, offset, whence, len) \
lock_reg(fd, F_SETLK, F_UNLCK, offset, whence, len)

#define	is_readlock(fd, offset, whence, len) \
lock_test(fd, F_RDLCK, offset, whence, len)
#define	is_writelock(fd, offset, whence, len) \
lock_test(fd, F_WRLCK, offset, whence, len)

pid_t	lock_test(int, int, off_t, int, off_t);

