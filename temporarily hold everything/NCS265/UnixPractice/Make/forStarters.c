#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 


typedef struct itemNode itemNode ; 

struct itemNode {
	char idd[16] ; 
	unsigned short qty ; 
	char desc[31] ; 
	itemNode *next ;
} ; 


int main( int argc, char *argv[] ) 
{
	FILE *fp = NULL ; 
	char *buff = NULL, *token ; 
	size_t len = 0 ;
	char delimiter[2] = ":" ; 


	fp = fopen(argv[1], "r") ; 


	while( getline( &buff, &len, fp ) != -1 ) 
	{	
		buff[ strlen(buff) -1 ] = '\0' ;
		token = strtok(buff, ":") ; 
		
		while( token != NULL ) {
			printf("%s ", token) ; 
			token = strtok(NULL, ":") ; 
		}
		
		printf("\n") ; 



	}
	
	fclose(fp) ; 

	return(0) ; 
} 
