#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int find( char *key, int *p_ans ) 
{
	sNode* sym;
	int h = hash(name) ;

	for( sym=symtab[h] ; sym != NULL; sym=sym->next)
		if( strcmp( name, sym->name ) == 0 ) 
			return(1, sym) ;
		else
			return(0) ;

}


