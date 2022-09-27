#include <stdio.h> 

int main(void) 
{
	double a[11] = {0,1,2,3,4,5,6,7,8,9,10}, *p, *q, i ; 

	p = &a[2] ; 

	q = p + 3 ; 

	printf("pointer p equals %lf and pointer q (which is equal to p + 3) equals %lf\n", *p, *q) ; 

	p += 6 ;

	printf("pointer p now equals %lf as the operation ( p += 6 ) was just carried out\n", *p) ; 


	i = p - q ;

	printf("i set equal to p - q and is equal to %lf. The element of q is subtracted from the element of p\n", i ) ; 

	return( 0 ) ; 

} 
