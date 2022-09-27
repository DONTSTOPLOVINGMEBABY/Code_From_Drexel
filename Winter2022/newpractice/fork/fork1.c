#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h> 

int main(void) 
{
	printf("L0\n") ; 

	if (fork() == 0)
	{
		printf("L1\n") ; 

		if (fork() == 0)
		{
			printf("L2\n") ; 
			fork() ; 
		} 
	}

	printf("Bye\n") ;

	exit(0) ; 

	wait(NULL) ;  

		

	return 0 ; 

} 
