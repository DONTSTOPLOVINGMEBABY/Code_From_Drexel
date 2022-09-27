#include <stdio.h> 

double decompose(double x, long *int_part, double *frac_part) ;

int main()
{
	double anVariable, d;
	long i ; 

	anVariable = decompose(3.14159, &i, &d) ; 

	printf("%lf\n", anVariable) ; 

	return( 0 ) ; 


}


double decompose(double x, long *int_part, double *frac_part)
{
	*int_part = (long) x ;
	return *frac_part = x - *int_part;

}

