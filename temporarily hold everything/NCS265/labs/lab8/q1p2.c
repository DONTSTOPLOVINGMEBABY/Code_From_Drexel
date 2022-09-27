#include <stdio.h> 


typedef struct
{
	char first[10] ;
	char last[20] ; 
	int age ;
} person ; 



int main(int argc, char **argv) 
{
	
	FILE *fin = stdin ; 

	person* team[100] = { NULL } ; 

	

	char *buff = NULL ;
	size_t len ;
	size_t cnt = 0 ; 

	while( getline( &buff, &len, fin ) > 1 ) 
		{
			continue ;
		} 

	return( 0 ) ;

} 
