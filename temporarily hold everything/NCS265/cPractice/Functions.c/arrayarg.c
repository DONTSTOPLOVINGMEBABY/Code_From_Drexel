#include <stdio.h> 

int sum_array(int a[], int n) ; //prototype 

int main()
{

int total ; 

total = sum_array((int []){ 1,2,3,4,5} , 5) ; // Compound literal - An unnamed array that's created "on the fly" by simply speicfying which elements it contains 

printf("Total is %d\n", total) ; 

return(0) ; 

}


int sum_array(int a[], int n)
{
	int i, sum = 0 ; 

	for (i = 0; i < n; i++) 
		sum += a[i] ; 

	return sum ;  

} 
