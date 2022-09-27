#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <math.h> 


int main( void ) 
{

	int calls ; 

	printf("Enter how many fork calls you would like to go through => ") ; 

	scanf("%d", &calls) ; 

	for ( int i = 0 ; i != calls ; i++ )
	{
		fork() ; 
	}

	printf("hello\n") ;


/* 

	if (getpid() != 0)
	{
		double a , call = calls ;  
		a =  pow(2, call) ; 
		printf("there should be %f hellos printed to stdout\n", a ) ; 
	}
*/ 


	return 0 ;
} 
