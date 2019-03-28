#include <time.h>
#include <unistd.h>
#include <stdio.h>

char *
_utctimeall(tm)
time_t  tm;
{
    struct  tm  *tp;
    static  char    buf[15];    /* YYMMDDHHmmss */

    memset(buf,'\0', 15);
    if (tm == 0) time((time_t *) &tm);
    tp = localtime((time_t *) &tm);
    sprintf(buf,"%04d%02d%02d%02d%02d%02d",tp->tm_year+1900, tp->tm_mon+1,
         tp->tm_mday, tp->tm_hour, tp->tm_min, tp->tm_sec);
    return (buf);
}
