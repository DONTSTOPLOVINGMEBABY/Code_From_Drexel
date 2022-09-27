#include <string.h> 
#include <stdio.h> 

#include "foo.h" 

int foo( int k ) ; 

int main( void ) 
{
	int j = 12, 
		 k = 13, 
		 r ; 

	r = foo( j ) ; 

	printf( "foo returned %d\n", r ) ; 

	return( 0 ) ; 
}


/* In order to compile this program using gcc, you have to use the following command "gcc main.c foo.c -o foo". */ 
