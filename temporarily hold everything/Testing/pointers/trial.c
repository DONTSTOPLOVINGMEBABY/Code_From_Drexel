#include <stdio.h>
void main()
{
	int kids = 4;
	int *point = NULL ;
	printf("\nThe Smiths have %d children.", kids) ;
	point = &kids ;
	*point = 6 ;
	printf("\nThe Larks have %d children.", kids) ;
}
