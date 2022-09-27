#include <stdio.h> 


void add3( int *p ) 
{ *p += 3 ; } 

int main( void ) 
{
	int i = 28 ; 

	add3( &i ) ; /* pass in integers address to add3 */
	printf("%d\n", i) ; 

	return( 0 ) ; 

} 

