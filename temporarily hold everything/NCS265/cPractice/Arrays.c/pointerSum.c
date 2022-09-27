#include <stdio.h> 
#define N 10 

int main(void) 
{
	int a[N] = {5,5,5,5,5,5,5,5,5,5} , sum, *p;

	sum = 0 ;
	for( p = &a[0]; p < &a[N]; p++ ) 
		sum += *p ; 

	printf("%d\n", sum) ; 

	return( 0 ) ; 

} 

