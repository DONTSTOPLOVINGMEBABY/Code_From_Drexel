/* A program that reads an integer from the user, n, and creates a right triangle with legs of length n */

#include <string.h> 
#include <stdio.h> 
#include <stdlib.h> 

int main() 
{ 
	char *buff = NULL ; 
	size_t len ; 
	int count, i, z, x = 0 ; 

	printf("Enter integer: ") ;
	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &count ) ;  

	for (i=1;i<=count;i++) 
	{

	for (z=count-x;z>=1; z--) 
		
		{
			printf("*") ; 
		} 

		x += 1 ; 
		printf("\n") ; 

	} 


	free( buff ) ; 


	return( 0 ) ; 
} 

