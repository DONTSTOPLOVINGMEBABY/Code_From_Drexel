#include <stdio.h> 

int main() 
{
	double array[2] = {1.232, 1.332} ; 
	double *k = array ; 

	for (int i = 0 ; i<2 ; i++) 
		printf("%lf\n", *(k + i )) ;


	printf("%d\n", 0/2) ; 

} 


