#include <stdio.h>




int main(void)
{
	char hank[10] = "Henry" ;

	for(int i = 0; i < sizeof(hank); i++)
		printf("%c", hank[i]) ;
	
	return 0 ; 
}

