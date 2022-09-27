#include <stdio.h>

int main(void) 
{
	int array[5][5] = {
	{1,2,3,4,5} ,
	{6,7,8,9,10} , 
	{11,12,13,14,15} , 
	{16,17,18,19,20} ,
	{21,22,23,24,25} 
	} ; 

	int arrays[6][6] = {
		{1,2,3,4,5,6}, 
		{7,8,9,10,11,12},
		{13,14,15,16,17,18},
		{19,20,21,22,23,24}, 
		{25,26,27,28,29,30}, 
		{31,32,33,34,35,36}
	} ;


	for( int i = 0 ; i < 5 ; i++ ) 
	{
		printf("\n") ; 
		for( int k = 0 ; k < 5 ; k++ ) 
		{
			printf("%d ", array[i][k]) ; 
		}
	}

	printf("\n") ; 

	for(int i = 0; i < 6 ; i++)
	{
		printf("\n") ;
		for(int k = 0 ; k<6 ; k++ )
		{
			printf("%d ", array[i][k]) ; 
		} 
	}


	printf("\n\n") ; 

	return(0) ; 
}
