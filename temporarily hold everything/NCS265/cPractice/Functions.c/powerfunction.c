#include <stdio.h> 

double power( double x, double n ) ; 

int main() 
{
	double number, powers ;
	

	printf("Please enter a number and then a power ") ;
	scanf("%lf%lf", &number, &powers) ; 

	printf("The number %.2lf to the %.2lf power is: %.2lf\n", number, powers, power(number, powers)) ; 

	return( 0 ) ; 

}


double power( double x, double n ) 
{
	int i, result = 1 ; 

	for (i = 1; i<=n; i++) 
		result = result * x ; 

	return result ; 

} 
