#include <stdio.h>

typedef struct sNode sNode ;

struct sNode{
   int data ;
   sNode *next ;
} ;

   // removes first occurence of t from list L
   // upon success return beginning of new list
   // else, return NULL
sNode* remove( sNode *L, int t )
{
   sNode *p = L , *q = NULL ;

	if (!(p->next))
		return NULL ; 

   while( p!=NULL )
   {
      if( p->data == t )
         break ;
      q = p ;
      p = p->next ;
   }

   if( p == NULL ) return NULL ;
	


	q->next = p->next ;

	free(p) ;
	p = NULL ; 
		
	return L ; 


   // TODO:  unhook that element
}


int main()
{
   sNode *L = NULL ;  // some list
   sNote *t = NULL ;

	sNode *L = (sNode*) malloc( sizeof (sNode)) ; 
	L->data = 12 ;
	L->next = NULL ; 

	sNode *t = (sNode*) malloc( sizeof( sNode )) ; 
	t->data = 13 ; 
	t->next = L ; 
	L = t ;


	t = remove( L, 13 ) ; 

	while( t-> next != NULL ) 
	{
		printf("%d\n", t->data) ; 
	}

   return 0 ;
}
