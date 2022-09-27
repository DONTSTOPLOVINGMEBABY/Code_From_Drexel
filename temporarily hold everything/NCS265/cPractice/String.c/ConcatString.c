#include <string.h>


int main() { 
	char name[500] ;
	strcpy( name, /* Only 2 args to this function */
		"Rumpelstilzchen"
		" "
		"Smith"
		) ; 
	printf( "Here is the string: %s\n", name ) ;  

	return (0) ; 
}

