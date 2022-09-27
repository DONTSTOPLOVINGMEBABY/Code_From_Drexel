#include <stdio.h> 

int main()
{
	int i, n ;  

	printf("How many numbers do you want to reverse? ") ; 
	scanf("%d", &n) ; 


	double a[n] ; 

	printf("Enter %d numbers: ", n) ; 
	for (i = 0; i< n; i++ ) 
		scanf("%lf", &a[i]) ; 

	printf("In reverse order:") ; 
	for (i = n - 1 ; i >= 0; i--) 
		printf(" %lf", a[i]) ; 
	printf("\n") ; 


	return( 0 ) ; 
}
