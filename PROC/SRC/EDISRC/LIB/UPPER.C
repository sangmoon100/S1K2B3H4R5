#include <ctype.h>

int
nupper(buf,len)
char *buf;
int	len;
{
	int i;
	char *p;

	p = buf;
	
	for(i = 0 ; i < len; i++,p++)
		if (islower(*p))
			buf[i] = toupper(*p);
	return(0);
}

int
upper(buf)
char *buf;
{
	int i;
	char *p;

	p = buf;

	for(i = 0 ; i < strlen(buf); i++,p++)
		if (islower(*p))
			buf[i] = toupper(*p);
	return(0);
}


