/********************************************************************************
 * stack-arr.h -- interface for stack functions (built over a linked list)
 *
 * Kurt Schmidt
 * NOV 2020
 *
 * gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0, on
 * GNU/Linux 4.15.0-117-generic x86_64
 *
 * EDITOR:  tabstop=2, cols=120
 *
 ********************************************************************************/

#ifndef __KS_STACK_H_
#define __KS_STACK_H_


typedef struct sNode sNode ;
typedef struct stack_ll stack ;

typedef int ELEM ;

struct sNode
{
	ELEM data ;
	sNode* next ;
} ;

struct stack_ll
{
	sNode* head ;
} ;


		/**********************************************************************************
		*  NOTES:
		*  - Stack is elements in indices [0, size-1]
		*  - High index is top of stack
		**********************************************************************************/

		// Initialises a new stack
		// Must be called before using
	void init( stack* s ) ;

		// return true of stack is empty
	_Bool isEmpty( const stack* s ) ;

		// Inserts i on top of stack
		// Stack must have space
	void push( stack* s, ELEM i ) ;

		// Removes item, returns it
		// Stack can't be empty
	ELEM pop( stack* s ) ;


#endif // __KS_STACK_H_
