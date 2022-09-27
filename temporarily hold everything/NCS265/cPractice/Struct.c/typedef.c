#include <stdio.h> 
#include <string.h> 


typedef struct
{
	int age ;
	char name[20] ; 

} person ; 

int main( void )
{
	person h ;

	h.age = 20 ; strcpy(h.name, "Henry") ; 

	printf("%s is %d years old", h.name, h.age ) ; 
	
	return( 0 ) ;

} 


