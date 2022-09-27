#include <stdio.h>
#include <string.h>

int main( void ) 
{
	int i ;
	int a[5] ;
	int *p = NULL ;

	for( i=0; i<5; ++i )
		a[i] = (i+2)*3 ;

	for( i=0; i<5; ++i )
		printf( "*(a+%d) = %d\n", i, *(a+i) ) ;

	for( p=a, i=0; i<5; ++i, ++p )
		*p += 2 ;

	return( 0 ) ;

} 

typedef struct sNode sNode ; 

struct sNode
{
	int i ;
	sNode *next ;
}


