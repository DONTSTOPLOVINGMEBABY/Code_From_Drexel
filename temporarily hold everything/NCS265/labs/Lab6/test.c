#include <string.h> 
#include <stdio.h> 
#include <stdlib.h> 

int main() 
{
	char *buff = NULL ;  
	size_t len ; 
	int count, i, z ; 

	printf("Enter integer: ") ; 
	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &count ) ; 

	for (i=1;i<=count;i++)
	{
		for (z=1;z<=i;z++)
		{
			printf("\n") ;
		}
		printf("*") ; 
	} 

	free( buff ) ; 


	return 0 ; 
}


