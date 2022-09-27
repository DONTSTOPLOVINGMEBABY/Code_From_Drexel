#include <stdio.h>
#include <string.h> 
#include <math.h>


/* Henry Jacobs, Andrew Caramore, Curtis Holic */ 


int main ()


{
	double radius ;
	double height ;

	const double pi = acos(-1.0) ; 

	printf( "Radius of Cylinder " ) ;
	fscanf( stdin, "%lf", &radius) ;

	printf( "\nSize of Height: " ) ;
	fscanf( stdin, "%lf", &height ) ;

	printf( "\nVolume is equal to %lf\n\n", pi * height * radius * radius ) ;


	return( 0 ) ;	


}

