#include <stdio.h>
#define N 10 

void max_min(int a[], int n, int *max, int *min) ;

int main(void)
{
	int b[N], i, big, small ; 

	printf("Enter %d numbers: ", N) ; 
	for (i = 0; i < N; i++) 
		scanf("%d", &b[i]) ; 

	max_min(b, N, &big, &small) ; 

	printf("Largest: %d\n", big) ; 
	printf("Smallest: %d\n", small) ; 

	return(0) ; 
}

void max_min(int a[], int n, int *max, int *min) 
{
	int i;
	int *k = a ;


	*max = *min = *(k + 0) ;
   for (i = 1; i < n; i++)
   {
      if ( *(k + i) > *max)
         *max = *(k + i) ;
      else if ( *(k + i)  < *min)
         *min = *(k + i) ; 
		}
}

