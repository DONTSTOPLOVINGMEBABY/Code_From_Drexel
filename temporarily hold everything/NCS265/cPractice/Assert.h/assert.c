#include <stdio.h> 
#include <assert.h>

int main()
{
	int i = 5 ; 

	assert( i>9 ) ; 

	fputs( "We are after the assert stmt\n", stderr) ; 

	return 0 ;
}
