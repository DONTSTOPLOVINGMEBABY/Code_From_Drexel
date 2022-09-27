#include <stdio.h>
#include <string.h> 

int main() 
{
	int a[10] = {100} ; 

	int b = sizeof(a) ; 

	printf("%d\nSize of the array is: %d\n", b, (int) (b / sizeof(a[0]))) ; /* Have to use int within print statement because sizeof produces an unsigned type and compares it against an int (which is a signed type). To fix error, we cast this to an int. Can be done in for loops as well */ 

	return( 0 ) ; 

} 

