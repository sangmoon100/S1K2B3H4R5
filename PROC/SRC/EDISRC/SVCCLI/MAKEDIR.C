#include <stdio.h>
#include <sys/errno.h>

make_dir(path)
char *path;  
{
	int	len;
	char 	dir[80];
	char	tmp1[80];
	char	tmp2[80];
	char	*p, *next, *strtok();

	len = strlen (path);
	umask(0);
	memset (dir, 0, 80);
	strcpy(dir, path);
	tmp1[0] = '\0';
	p = dir;
	while (1) 
	{
		if ((p = strtok(p,"/")) == NULL) break;
		next =  p + strlen(p) + 1;
		sprintf(tmp2,"%s/%s",tmp1, p);
		p = next;
		if (mkdir(tmp2, 0777)) 	
		{
		   	if (errno == EEXIST) ;
	    	else  {
				return (-1);
	     	}
		} else chmod(tmp2,0777);
		if (strlen (tmp2) == len) break;
		strcpy (tmp1, tmp2);
 	}
	return (0);
}

