#include <stdio.h>
#include <stdlib.h>

int main( void ) 
{
	int i= 5 ,
		j =12 ;

	int *p = NULL ;

	p = &i ; 
	*p = 23 ;

	printf( "*p is %d\n", *p ) ;
	printf( "i is now %d\n", i ) ;

	p = &j ;
	printf( "*p is now %d\n", *p ) ;


	return( 0 ) ;
}

