#include <string.h>
#include <stdio.h> 

/* prototype */ 

int foo( int k ) ; 



int main( void ) 
{
	int j = 12, k = 13, r ; 

	r = foo( j ) ; 

	printf( "foo returned %d\n", r ) ; 

	if( j != 12 ) 
		printf( "j changed\n" ) ;
	if( k != 13 ) 
		printf( "k changed\n" ) ; 
	
	return( 0 ) ; 
} 


int foo( int k ) 
{   
   /* j is local, and k
   behaves so */

   int j = 23 ;
   int rv = k * j ;

   k = 928357 ;

   return( rv ) ;
}


