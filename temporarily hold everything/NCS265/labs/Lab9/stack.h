/********************************************************************************
 * stack.h -- interface for stack functions (built over an array)
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

#ifndef __KS_STACK2_H_
#define __KS_STACK2_H_

typedef struct stack_arr stack ;

typedef int ELEM ;


		/**********************************************************************************
		*  NOTES:
		*  - Stack is elements in indices [0, size-1]
		*  - High index is top of stack
		**********************************************************************************/

		// The recommended way to get a new stack
		// stackFree() should be called when finished
	stack* mkStack() ;

		// return true of stack is empty
	_Bool isEmpty( const stack *s ) ;

		// resizes the stack's heap array to new_size
		// (copying old contents over, and freeing the old array)
	void stackResize( stack *s, size_t new_size ) ;

		// Inserts i on top of stack
		// Stack must have space
	void push( stack *s, ELEM i ) ;

		// Removes item, returns it
		// Stack can't be empty
	ELEM pop( stack *s ) ;

		// Peeks at the top element, returns it
		// No side effects
		// Stack can't be empty
	ELEM top( const stack *s ) ;

		// Decommissions the stack, returns all memory to the heap
		// Consider stack pointer invalid after call
	void stackFree( stack *s ) ;


#endif // __KS_STACK2_H_
