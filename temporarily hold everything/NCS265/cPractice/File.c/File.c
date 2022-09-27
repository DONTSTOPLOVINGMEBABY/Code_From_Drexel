#include <stdio.h>
#include <stdlib.h> 

int main( int argc, char **argv) 
{
	FILE *fp = NULL ; 

	fp = fopen( argv[1], "r") ; 

	if (fp == NULL) 
		printf("There's no file bro\n") ; 

	fclose(fp) ; 

	return( 0 ) ;
}
