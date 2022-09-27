/* A program that reads an integer from the user, n, and creates a right trial with legs of length n */ 

#include <string.h> 
#include <stdio.h>
#include <stdlib.h> 

int main() 
{
	char *buff = NULL ;
	size_t len ; 
	int count, i, z, x=0,y ; 

	printf("Enter integer: ") ; 
	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &count) ; 

	for (i=1;i<=count;i++) 
	{
		for (z=count-x; z<count ; z++)
		{
			printf(" ") ;  

		} 

		for (y=count-x; y>0 ; y--)
		{
			printf("*") ; 
		} 

		x += 1 ; 
		printf("\n") ; 
	
	}

	free( buff ) ; 

	return( 0 ) ; 
}
	
