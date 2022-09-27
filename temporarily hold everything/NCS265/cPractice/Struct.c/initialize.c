#include <stdio.h>


struct parent
{
	int married, kids ;
	char name[10] ;
} ; 


int main(void) 
{
	struct parent sam = { 1 , 2, "Sam" } ; 

	if ( sam.married == 1 ) 
		printf("%s is married and has %d kids\n", sam.name, sam.kids ) ; 
	else
		printf("%s is not married and has %d kids\n", sam.name, sam.kids ) ; 

	
	struct parent hank = {.name = "Henry"} ; /* Designated initializers */ 

	printf("%d %d %s\n", hank.married, hank.age, hank.name) ; 

	return 0 ; 

} 
