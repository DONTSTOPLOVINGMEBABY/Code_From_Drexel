/**************************************************************************************************
 * Author - Henry Jacobs																								  *
 * School - Drexel University																							  *
 * Class - CS265 																											  *
 *	Professor - Kurt Schmidt																							  *
 * 																															  *
 * Last modified - November 19, 2020																				  *
 * Compiler - gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0														  * 
 * Operating System - 5.4.0-52-generic x86_64 GNU/Linux														  *
 * 																															  * 
 * Purpose - A program that verifies messages based on a particular protocol via file or stdin.   *
 **************************************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* prototypes */ 

int aldo( int character, char *string ) ;

int bar( int character, char *string ) ;

int calma( int character, char *string ) ; 

int dol( int character, char *string ) ; 

int main( int argc, char *argv[] ) 
{
	int boolean ; /* boolean is the variable where all return values from functions are stored (0=Fail, 1=OK) */ 
	FILE *fp = NULL ; 
	char *buff = NULL ;  
	size_t len = 0 ;  
	
	if(argc > 1) /* checks if file was provided, if not defaults to stdin */ 
	{
		fp = fopen(argv[1], "r") ; 
		
		if (fp == NULL) 
		{
			printf("Unable to read file. Exiting...\n") ;
			return(0) ; 
		}
	}
	else
		fp = stdin ; 

	while( getline( &buff, &len, fp ) != -1 ) /* reads line by line until EOF or until user signals end of input if using stdin */ 
	{
		buff[ strlen(buff)-1 ] = '\0' ;
		int firstChar = buff[0] ; /* stores first character of the line read */ 
 
		if (firstChar == 'A') /* various tests send the line to the right function for further testing or fails it */ 
			boolean = aldo(firstChar, buff) ;
		else if(firstChar == 'B')
			boolean = bar(firstChar, buff) ; 
		else if(firstChar == 'C') 
			boolean = calma(firstChar, buff) ;
		else if(firstChar == 'D')
			boolean = dol(firstChar, buff) ; 
		else
			boolean = 0 ; 
	
		if (boolean == 0)
			printf("%s FAIL\n", buff) ;
		else
			printf("%s OK\n", buff) ; 
	}

	free( buff ) ; 	/* free pointers */ 
	free( fp ) ; 	

	return( 0 ) ; 
} 
/* Function aldo checks messages that start with an A and are followed by a string of decimal digits (at least one) */ 

int aldo( int character, char *string )
{
	size_t length = strlen(string) ; 
	
	if (string[1] == 'F') /* ensures F is not second character */ 
		return 0 ; 	 

	for(int i = 1 ; i<length; i++) /* rest of aldo protocol */ 
	{
		if (string[i] >= '0' && string[i] <= '9') 
			continue ; 
		else if (string[i] == 'F') 
			return(1) ; 
		else
			return(0) ;
	}

	return( 0 ) ;
}
/* Function bar checks messages that start with a B followed by arbitrary number of strings HG (including none), seperated by X */

int bar( int character, char *string ) 
{
	size_t length = strlen(string) ;

	if (length == 1) /* tests if first character is B */ 
		return(1) ; 
	
	for (int i = 1; i<length; i++) /* rest of bar protocol */ 
	{
		if (string[i] == 'X' && i % 3 == 0) 
			continue ; 
		else if (string[i] == 'H' && i % 3 == 1) /* H, G, and X follow a specific pattern where their element numbers each retain a different unique value when modded by 3 */
			continue ; 
		else if (string[i] == 'G' && i % 3 == 2)
			if (i == length - 1)
				return(1);
			else
				continue ; 
		else
			return(0) ;
	}
	
	return(0) ; 

}
/* Function calma checks messages that start with C, followed by a string of R and T, where the number of Ts are even */ 

int calma( int character, char *string )
{
	size_t length = strlen(string) ; 
	int cnt = 0 ; 

	if (length == 1) /* tests if first character is C */  
		return(1) ; 
	
	for (int i = 1 ; i<=length ; i++) /* rest of calma protocol */ 
	{
		if (string[i] == 'R')
			continue ; 
		else if (string[i] == 'T')
			cnt++ ; 
		else if (i == length && cnt % 2 == 0) 
			return(1) ;
		else
			return (0) ;			
	}
	return(0) ; 
} 
/* Function dol checks messaages that start at a D and are followed by 2 decimal digits, then an aldo or calma */ 

int dol( int character, char *string ) 
{
	size_t length = strlen(string) ; 

	for (int i = 1; i < 3; i++) /* checks for 2 decimal digits after D */
	{
		if (!(string[i] >= '0' && string[i] <= '9'))
			return(0) ; 
	}

	if (string[3] == 'A') /* checks fourth character to see if it meets aldo's protocol */ 
	{
		/* aldo protocol */ 
		if (string[4] == 'F')
			return(0) ; 
		
		for (int i = 4 ; i<length; i++)
		{
			if (string[i] >= '0' && string[i] <= '9')
				continue ; 
			else if (string[i] == 'F')
				return(1) ; 
			else
				return(0) ; 
		}
		return(0) ; 
	}
	else if (string[3] == 'C') /* checks fourth character to see if it meets calma's protocol */
	{
		/* calma protocol */ 
		int cnt = 0 ; 

		if (length == 4)
			return(1) ; 

		for (int i = 4 ; i<=length; i++)
		{
			if (string[i] == 'R')
				continue ; 
			else if (string[i] == 'T')
				cnt++ ; 
			else if (i == length && cnt % 2 == 0)
				return(1) ; 
			else
				return(0) ; 
		}
		return(0) ;
	}
	else /* returns false if no conditions are met and fails dol protocol*/ 
		return(0) ; 
		
	return(0) ; 
}
