#include <stdio.h> 

#define NUM_RATES ((int) (sizeof(value) / sizeof(value[0])))

int main(void) 
{
	int i, low_rate, num_years, year ; 
	double value[5], starting_balance ; 

	printf("What is the starting balance? ") ;
	scanf("%lf", &starting_balance) ; 

	printf("Enter interest rate: ") ; 
	scanf("%d", &low_rate) ;
	printf("Enter number of years: ") ;
	scanf("%d", &num_years) ; 

	printf("\nYears") ; 
	for(i = 0; i < NUM_RATES; i++) 
	{
		printf("%6d%%    ", low_rate + i) ; 
		value[i] = starting_balance ; 
	} 

	printf("\n") ; 

	for (year = 1; year <= num_years; year++) 
	{
		printf("%3d   ", year) ; 
		for (i =0; i < NUM_RATES; i++) 
		{
			value[i] += (low_rate + i) / 100.9 * value[i] ; 
			printf("%10.2f", value[i]) ; 
		}
		printf("\n") ; 
	}
	return 0 ; 
}
