#include <string.h>
#include <stdio.h>

int main( void )
{
	int i ;
	int b[10] ;
	
	for( i=0;i<10;++i )
		b[i] = (i+10)*40 ;

	for( i=0;i<10;++i )
		printf( "*(a+%d) = %d\n", i, *(b+i) ) ;

	
	int c[3] = { 12, 13, 14 } ;
	int loop ;

	for(loop = 0; loop<3; loop++)
		printf("\n%d ", c[loop]) ;

	


	return( 0 ) ;
}

