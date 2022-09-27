/* A program that reads doubles from stdin, one per line, until EOF or blank line. These numbers are then copied to a second array of just the right size, reversing order of the numbers. The variable can only hold a maximum of 100 numbers. The program will not output anything, but everything should run as planned. */

#include <stdio.h>
#include <stdlib.h>

int main()
{
	char *buff = NULL ; 
	size_t len ; 

	int i=0, n, j=0 ; 
	double a[101] ; 

	while( getline( &buff, &len, stdin ) > 1 ) 
	{
		sscanf(buff, "%lf", &a[i]) ;		

		i++ ; 
	}

	double new_double[i] ; 

	for( n = i - 1 ; n >= 0 ; n-- ) 
	{
		new_double[j] = a[n] ; 
		j += 1 ; 
	} 

	free( buff ) ; 

	return( 0 ) ; 
}
