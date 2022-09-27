#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

int main() 
{
	int i, n ;

   printf("How many numbers do you want to reverse? ") ;
   scanf("%d", &n) ;

	int a[n] ;


	printf("Enter %d numbers into the array ", n) ; 
	for( i = 0 ; i<n ; i++ ) 
		scanf("%d", &a[i]) ; 

	
	printf("Your array currently contains these values in this order: ") ;

	for( i=0 ; i<n ; i ++ ) 
		if ( i == n - 1 )
      {
         printf("%d\n", a[i]) ;
      }
      else
      {
         printf("%d, ", a[i]) ;
      }

	printf("Now this is what it looks like cleared: ") ;
	
	for( i=0; i<n ; i++ ) 
		a[i] = 0 ;					// The only important part to this program  

	for( i=0 ; i<n ; i ++ )
		if ( i == n - 1 ) 
		{
			printf("%d\n", a[i]) ; 
		}
		else
		{
      	printf("%d, ", a[i]) ;
		}

	return( 0 ) ; 
} 


