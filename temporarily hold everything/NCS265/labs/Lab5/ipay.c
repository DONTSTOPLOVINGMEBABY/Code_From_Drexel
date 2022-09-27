/* A C program for innumerate lunchers. The program will take a given subtotal from the luncher and compute the 7% tax and a 22% tip (on the untaxed amount) and display the total for the luncher. */ 

#include <stdio.h> 
#include <string.h> 
#include <math.h>
#include <stdlib.h> 

int main() 
{
	double subtotal ; 
	char *buff = NULL ; 
	size_t len = 0 ; 

	printf( "Enter your subtotal => ") ; 

	getline( &buff, &len, stdin ) ;
	sscanf( buff, "%lf", &subtotal) ; 

	printf( "Total: $%.2f\n", (subtotal * .07 ) + (subtotal * .22) + subtotal ) ;  


	free( buff ) ; 	
	
	return( 0 ) ; 

} 
