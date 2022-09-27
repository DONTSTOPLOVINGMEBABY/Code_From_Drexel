#include <stdio.h>
#include <stdlib.h>

typedef struct sNode sNode ;

struct sNode
{
	sNode *next ;
	int data ;
} ;

void print( sNode *p, FILE *fp ) 
{
	fprintf( fp, "<" ) ;
	while( p != NULL ) 
	{
		fprintf( fp, " %d", p->data ) ;
	 	p = p->next ;
		}
	fprintf( fp, ">" ) ;
}

int length( sNode *p )
{
	int i = 0 ; 
   while(p != NULL) 
   { 
		i += 1 ;
		p=p->next ; 
	}
	
	printf("%d\n", i) ;

	return(i) ; 
}

int sum( sNode *p ) 
{
	sNode* q = p ;

	int sum = 0 ;
	while(q!= NULL) ;
	{
		sum += q->data ;  
		q=q->next ;

	}
	printf("%d", sum) ;
	return(sum) ;

}


void addk( sNode *p, int k )
{
	sNode* q = p ;

	while(q != NULL) 
	{
		q->data += k ;
		q=q->next ;
	}
}







int main( int argc, char *argv[] ) 
{
	sNode *p = NULL, 
		*t = NULL ;

	p = (sNode*) malloc( sizeof( sNode )) ;
	p->data = 13 ; p->next = NULL ;

	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 12 ; t->next = p ; p = t ;

	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 5 ;  t->next = p ; p = t ;

	print( p, stdout ) ;
	printf( "\n" ) ;
 	 
	length(p) ; 
	
	sum(p) ; 

	return( 0 ) ;
}  


