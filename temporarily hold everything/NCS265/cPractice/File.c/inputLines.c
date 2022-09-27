#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main( int argc, char **argv )
{
	FILE* fp = NULL ;
	char* buff = NULL ;
	size_t len = 0 ;

	if( argc > 1 ) 
	{
		fp = fopen( argv[1], "r" ) ;

		if( fp == NULL )
		{
			perror( "Can not open input file for reading.\n" ) ;
			exit( 1 ) ;
		}
	}
	else
		fp = stdin ;

		/* read manpage for getline.  it allocates and reallocates, as needed 
		 * You free  */
	while( getline( &buff, &len, fp ) != -1 )
	{
		buff[ strlen(buff)-1 ] = '\0' ;  /* Overwrite the newline */
		printf( "%lu chars at %p (len %lu): %s\n", strlen(buff), buff, len, buff ) ;
	}

	free( buff ) ;  /* No memory leaks! */

	buff = NULL ;  /* pedantic */
	len = 0 ;
	
	return( 0 ) ;
}
