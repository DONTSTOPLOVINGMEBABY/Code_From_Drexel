#include <stdio.h> 
#include <string.h> 


// works, but not with double longs. Need to figure out how they work so you can 
// use larger numbers on this thing. The python one of the same name in this
// library does the same thing, but obviously in Python. 



/* 

int function( int n ) 
{

	int ctr  = 0 ; 

	while ( n > 0) 
	{	  
		ctr = ctr + (n % 10) ; 
		printf("%d\n", n % 10) ; 
		n = (n / 10) ; 
	} 

	return ctr ; 
} 



int main(void) 
{

	printf("%d\n", function(88233)) ;  

	return 0 ; 

} 

*/ 
