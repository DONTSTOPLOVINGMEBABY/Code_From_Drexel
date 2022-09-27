#include <stdio.h>
#include <stdlib.h> 

int main(void) 
{
	int i = 5, 
		 j = 12 ; 

	int *p = NULL ; 

	p = &i ; // modifying pointer // 
	*p = 23 ;  // modifying thing pointed to // 

	printf("*p is %d\n", *p) ; 
	printf("i is now %d\n", i) ; 

	p = &j ;
	printf("*p is now %d\n", *p) ; 

	return( 0 ) ; 
} 

/* 

*p = 23 changes the object being pointed to 

p = &j changing the pointer p 

*/ 

