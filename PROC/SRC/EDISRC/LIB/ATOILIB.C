#include <stdio.h>

long
atoln(buf, size)
char *buf;
int size;
{
    long number;

    char tmp[20];

    if (size > 10 || size <= 0)
        return(-1);

    memset(tmp,'\0',sizeof(tmp));
    strncpy(tmp,buf,size);

    number = atol(tmp);
    return(number);
}

int
atoin(buf, size)
char *buf;
int size;
{
    int number;
    char tmp[20];

    if (size > 6 || size <= 0)
        return(-1);

    memset(tmp,'\0',sizeof(tmp));
    strncpy(tmp,buf,size);

    number = atoi(tmp);
    return(number);
}


