#include <stdio.h> 

int main(void) 
{
	int i = 12, *p ; 

	p = &i ; 

	printf("%d\n", *p) ; 

	*p = 1200 ; 

	printf("Now *p equals %d and i also equals %d\n", *p, i) ; 

	return(0);
}

