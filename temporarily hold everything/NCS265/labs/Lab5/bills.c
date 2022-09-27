/* A C program that prompts the user for an integer, then shows how to represent the amount with the fewest number of $20, $10, $5, and $1 bills. */

#include <stdio.h>
#include <string.h>
#include <math.h> 
#include <stdlib.h> 


int main () 

{
	int bills ; 
	char *buff = NULL ;
	size_t len = 0 ; 


	printf( "Enter a dollar amount => ") ;

	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &bills ) ;

	
	printf( "$20 bills: %2d", bills / 20 ) ;
	printf( "\n$10 bills: %2d\n", bills % 20 / 10 ) ; 
	printf("$ 5 bills: %2d\n", bills % 20 % 10 / 5 ) ; 
	printf("$ 1 bills: %2d\n", bills % 20 % 10 % 5 / 1 ) ; 


	free( buff ) ; 


	return( 0 ) ; 

} 

