#include <string.h>
#include <stdio.h>
#include <stdlib.h>


int main()
{
	int k, i, sum = 0 ;

	printf("How many elements would like the array to be? " ) ; 
	scanf("%d", &k) ; 


	int array[k] ; 

	printf("Please enter %d integers to be added to the array ", k) ;

	for(i=0; i<k; i++) 
		scanf("%d", &array[i]) ;

	printf("Here are the elements you entered: ") ; 
	for(i=0; i<k; i++) 
		printf("%d ", array[i]) ; 


	for(i=0; i<k ; i++) 
		sum += array[i] ; 
	

	printf("... And here is the sum %d\n", sum) ; 

}
