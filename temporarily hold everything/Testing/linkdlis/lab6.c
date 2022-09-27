#include <stdio.h>
#include  <string.h>

int add3( int a[], int n )
{
	int i ;

	for(i=0;i<n;i++)
		printf(" %d ", ( *(a+i) + 3 ) ) ;
	
	return( 0 ) ;
}


int add3i(int *a, int n) 
{
	int i ;

   for(i=0;i<n;i++)
      printf(" %d ", ( *(a+i) + 3 ) ) ;

   return( 0 ) ;
}



int main( void )
{
   int list[4] = {0, 1, 2, 3} ;


   add3i( list, 4 ) ;

   return( 0 ) ;

}
