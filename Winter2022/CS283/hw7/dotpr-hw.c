#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#define NUMTHRDS 4
#define VECLEN 100000
pthread_t callThd[NUMTHRDS];
double *array_a;
double *array_b;
double big_sum;
int veclen;
void *dotprod(void *arg)
{
	int i;
	int forthdata = (int *)arg;
	int start;
	int end;
	start = forthdata*VECLEN;
	end = start+VECLEN;
	double* x = array_a;
	double* y = array_b;
	int mysum = 0;
	for (i=start; i<end ; i++)
	{
	mysum += (x[i] * y[i]);
	}
	return (void *)mysum;
}
int main (int argc, char *argv[])
{
	long i;
	double *a, *b;
	void *status;
	a = (double*) malloc (NUMTHRDS*VECLEN*sizeof(double));
	b = (double*) malloc (NUMTHRDS*VECLEN*sizeof(double));
	for (i=0; i<VECLEN*NUMTHRDS; i++)
	{
	a[i]=1;
	b[i]=a[i];
	}
	veclen = VECLEN;
	array_a = a;
	array_b = b;
	big_sum = 0;
	for(i=0;i<NUMTHRDS;i++)
	{
		pthread_create(&callThd[i], NULL, dotprod, (void*) i); 
	}
	for (i = 0; i < NUMTHRDS; i++){ 
        pthread_join(callThd[i], &status);
		big_sum += (int)status ;
	}
	printf ("Sum = %f \n", big_sum);
	free (a);
	free (b);
}
