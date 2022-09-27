/********************************************************************************
 * main-arr.c -- test driver for array-based stack
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

#include <stdio.h>

#include "stack.h"


int main()
{
	stack* ben = mkStack() ;

	if( ! isEmpty( ben ))
		fputs( "Newly init'd stack is not empty.\n", stderr ) ;

	push( ben, 13 ) ;

	if( isEmpty( ben ))
		fputs( "Just inserted, but stack is empty.\n", stderr ) ;

	push( ben, 12 ) ;

	push( ben, 5 ) ;

	return 0 ;
}
