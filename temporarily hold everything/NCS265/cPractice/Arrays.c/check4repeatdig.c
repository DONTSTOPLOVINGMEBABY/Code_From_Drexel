#include <stdbool.h> 
#include <stdio.h> 

int main( void ) 
{
	bool digit_seen[10] = {false} ;
	int digit ; 
	long n ; 

	printf("Enter a nuber: ") ; 
	scanf("%ld", &n) ; 

	while ( n > 0 ) 
	{
		digit = n % 10 ; 
		if (digit_seen[digit])
			break ; 
		digit_seen[digit] = true ; 
		n /= 10 ; 
	} 

	if ( n > 0 )
		printf("Repeated digit\n") ;

	else
		printf("No repeated digit\n") ; 

	for( int i = 0 ; i<10; i++ ) 
		printf("%d", digit_seen[i]) ; 


	printf("\n") ; 
	return 0 ; 



	return(0); 

}
