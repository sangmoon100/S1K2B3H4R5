#include <signal.h>
void
snd_timeout()
{
	printf("snd_timeout occured\n");
	return;
}
void
rcv_timeout()
{
	printf("rcv_timeout occured\n");
	return;
}
