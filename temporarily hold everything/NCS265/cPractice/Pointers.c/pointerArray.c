#include <stdio.h> 


void arrPrint( double a[], int n) 
{
	for( int i = 0; i<n; i++ ) 
	{
		*(a+i) += 1 ; 
		printf("%lf\n", *(a+i)) ; 
	}
}


int main(void) 
{
	double henry[5] = {1,2,3,4,5} ;

	arrPrint( henry, 5) ; 

	return( 0 ) ; 

} 

