#include <stdio.h> 
#include <string.h> 



int fibonnaci( int n ) ; 


int main(void) 
{

	int i ;

	printf("Please enter the number you wish the fibonacci sequence to be computed to => ") ; 

	scanf( "%d", &i) ; 

	printf("\n") ; 

	for( int n = 0 ; n < i ; i++) 
{ 

	printf("%d\n", fibonnaci(i)) ; 
} 

	return 0 ; 

} 


int fibonnaci( int n ) 
{
	if ( n <= 1)
		return 1 ; 

	return (fibonnaci(n-1) + fibonnaci(n-2)) ; 

}
