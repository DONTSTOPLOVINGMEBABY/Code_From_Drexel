#include <stdio.h> 

long fact(long n ) ; //prototype

int powers(int, int) ; 

int main(void)
{

	long factorial ; 

	int number = 3, power = 4 ; 


	printf("Enter any integer n to find its factorial ") ; 
	scanf("%ld", &factorial) ; 

	printf("%ld factorial is %ld\n", factorial, fact(factorial)) ; 


	printf("Three to the Fourth Power = %d\n", powers(number, power)) ; 

	return(0) ; 

}


long fact(long n) 
{
	if (n<=1)
		return 1 ; 
	else return n * fact (n - 1) ; 
}


int powers(int x, int n) 
{
	if (n == 0 ) 
		return 1;
	else
		return x * powers(x,n - 1) ; 
} 
