#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(void)
{
	printf("starting off, no fork call yet\n") ; 


	char *args[] = {"execvcall", NULL} ; 

	if (fork() == 0)
	{
		execvp(args[0],  args) ; 
	} 

	printf("print this twice and you're done\n") ; 

	return 0 ; 

}
