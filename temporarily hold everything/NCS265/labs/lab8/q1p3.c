#include <stdio.h> 
#include <string.h>
#include <stdlib.h> 
#define MAX 100 


typedef struct{
	char first[10] ;  
	char last[20] ; 
	int age ; 
} person ; 


void freePeople( person* a[], size_t n ) ; 


int main( void ) 
{
	
	size_t size =5 ; 
	person** team ; 

	team = (person**) malloc( size * sizeof( person* )) ;

	for( int i=0; i<size;++i )
		team[i] = NULL ; 

	team[0] = (person*) malloc( size * sizeof( person* )) ; 
	team[1] = (person*) malloc( size * sizeof( person* )) ; 
	team[2] = (person*) malloc( size * sizeof( person* )) ;



	team[0]->age = 20; strcpy( team[0]->last, "Jacobs"); strcpy( team[0]->first, "Henry") ; 

	team[1]->age = 20; strcpy( team[1]->last, "Larivee"); strcpy( team[1]->first, "Grace") ; 

	team[2]->age = 20; strcpy( team[2]->last, "Karp") ; strcpy( team[2]->first, "Binyamin") ; 

	freePeople( team, size ) ; 


	return( 0 ) ; 

}	


void freePeople( person* a[], size_t n ) 
{
	for( int i=0; i<n && a[i] != NULL; ++i ) 
	{
		free( a[i] ) ; 
		a[i] = NULL ; 
	}
	free( a ) ; 
} 

