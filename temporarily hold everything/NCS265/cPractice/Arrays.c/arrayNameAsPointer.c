#include <stdio.h> 

int main(void)
{
	int a[10] = {0} ;

	*a = 7 ; 

	printf("First element now equals %d\n\nLoading...\nArray now holds the values: ", *a ) ;

	*a = 0 ; 

	for (int i = 0; i<10; i++) 
	{	*(a+i) +=  i ; printf("%d ", *(a+i) ) ; }

	printf("\n") ; 
	
	return(0) ; 

} 
