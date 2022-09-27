#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>



void fork4()
{
	printf("L0\n");
	if (fork() != 0)
	{
		printf("L1\n");
		if (fork() != 0)
		{
			printf("L2\n");
			fork();
		}
	}
	printf("Bye\n");
}


void main(void) 
{

	fork4() ; 



} 














