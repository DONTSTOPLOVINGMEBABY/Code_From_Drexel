#include <stdio.h>

int partition( int *v, int n )
{
	int i, last =0 ;
	swap( v,0,rand() % n );

	for ( i=1; i < n; i++ )
		if(v[i]<v[0])
			swap(v, ++last, i) ;
	swap(v, 0, last) ;

	return last ;

}

int main(void) ;
{
	partition(84, 37)
}

