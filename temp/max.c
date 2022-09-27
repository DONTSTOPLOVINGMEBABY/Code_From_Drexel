#include <stdio.h> 


int max(int *a, int n) ; 


int main(void){
	

	int array[10] ; 

	for (int i = 0 ; i < 10 ; i++)
		array[i] = i ; 



	

	
	for (int i = 0 ; i < 10 ; i++)
		printf("%d\n", array[i]) ; 
	
 

	int k = max(array, 10)  ;

	printf("%d is the value of k\n", k) ; 


} 

int max(int *a, int n)
{

	int first = a[0] ; 

	for (int i = 0; i < n; i++){
			
		printf("%d ", a[i] ) ; 


		if(a[i] > first){
			first = a[i] ;  } 
		}


	printf("\n") ; 

	return first ; 

} 


