#include <stdio.h>
#include <string.h>



int main(void)
{

	char hank[20] ; 

	printf("Enter something to store into this array of 20 characters. Anything over twenty will overload the array, so don't fucking do that\n") ; 

	scanf(&hank, "%s") ; 

	printf("\n%s", hank) ; 

	
	return 0 ; 

} 



