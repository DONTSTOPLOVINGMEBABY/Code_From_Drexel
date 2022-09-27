#include <stdio.h> 
#include <stdlib.h>


typedef struct sNode sNode ;

size_t listLength( const sNode *L ) ; 


struct sNode
{
	int data ;
	sNode* next ; 
} ;



int main( void ) 
{
	sNode *l = NULL, 
			*t = NULL ; 

	l = (sNode*) malloc( sizeof( sNode )) ;
	l->data = 13 ; l->next = NULL ;

	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 12 ; t->next = l ; l = t ;

	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 5 ; t->next = l ; l = t ;

	
	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 12 ; t->next = l; l = t ; 

	t = (sNode*) malloc( sizeof( sNode )) ;
	t->data = 8853 ; t->next = l ; l = t ; 

	printf( "\n" ) ;

	size_t something = listLength( l ) ; 

	l = listRev( l ) ; 

	while( l != NULL) 
	{
		printf("%d ", l->data) ; 
		l = l->next ; 
	} 


	return( 0 ) ; 
} 

size_t listLength(const sNode *L) 
{
	size_t i = 0 ; 
	while(L!= NULL) 
	{
		i++ ;
		L=L->next;
	}
	return(i) ; 
}

/* A function that reverses a linked list in place using three  **
** pointers. The first pointer is passed to the function as an  **
** argument (L) and represents the current node of the loop		 **
** body. L will always lag behind nextNode for the majority of  **
** the loop body, as it is used to update the other pointers.   **
** It is updated at the end of the loop, so that it is current  **
** before it checks the loop conditional and begins the next    **
** iteration. Once the loop is completed, previousNode and      ** 
** nextNode return to NULL, and all that has changed is that    **
** L's next pointer now points in the opposite order.           */

sNode* listRev( sNode *L )
{

   struct sNode *previousNode = NULL, 
                *nextNode = NULL ;

   while( L != NULL )
   {
      nextNode = L->next ; // We first set nextNode ahead of our current node (L) so that it is always pointing to the next node in the list and can be used to update our current node at the end of the loop body before the next iteration. 

      L->next = previousNode ; // Redirects L's next pointer from pointing to the node ahead to pointing to the previous node in the list, reversing the order. Instead of next pointing to the node in front, it now points to the node behind it. 

      previousNode = L ; // The current node now becomes the previous node. 
      L = nextNode ; // The current node is now updated to the next node. 
   }
   L = previousNode ; // Since L was our current node and is now NULL, we now point L to the new head of our list, which was the trailing pointer. 

   return( L ) ;
}
