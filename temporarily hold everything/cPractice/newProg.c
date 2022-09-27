#include <stdio.h>
#include <string.h>


int exponent( int k, int exponent)
{
	for( int i = 1; i < exponent ; i++) 
		k = k * 3 ; 
	return k ; 
}

int add( int k, int j)
{
	return( k + j ) ; 
} 

int subtract( int k, int j ) 
{
	return( k - j ) ; 
} 

char penis(void)
{
	char hank[10] = "Penis!" ; 
	return hank ; 
} 


int main(void) 
{
	int a = 3, b = 3, c ; 

	c = add(a, b) ; 

	printf("the function returned %d\n", c) ; 

	return( 0 ) ; 

} 
