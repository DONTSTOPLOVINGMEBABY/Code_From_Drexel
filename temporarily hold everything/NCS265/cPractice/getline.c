#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
	char *buff = NULL ;
	size_t len = 0 , i = 0 , read ;

	printf( "Enter a line (blank to quit) => " ) ;
	while( (read=getline(&buff, &len, stdin)) > 1 ) 
	{
		// overwrite the newline

		buff[read-1] = '\0' ;
		printf( "%3ld: |%s|\n", ++i, buff ) ;
		printf( "Enter a line (blank to quit) => " ) ;
	}


	char delete[10] ; printf("Type your name") ; 
	scanf("%s", delete) ; 

	free( buff ) ; 
	return 0 ;
}
