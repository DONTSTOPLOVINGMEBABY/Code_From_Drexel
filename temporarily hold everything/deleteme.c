#include <stdio.h>
#include <string.h> 
#include <stdlib.h> 


int main() 
{	
	char *buff = NULL ;

	int month, day, year ; 

	size_t len ; 

	printf("\n\nHello, welcome to a c-program that finds how many days you have been alive (given that you are still alive).\nThis program requires that you put in your birthday.") ; 


	printf("Please enter the month you were born expressed as an integer (for example January would be 1 and December would be 12)\nEnter month => ") ;

	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &month ) ;


	printf("\n\nPlease enter the day you were born expressed as an integer (for example January 01 would be 1 and December 22 would be 22\nEnter day =>  ") ;


	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &day ) ; 

	printf("\n\nAlright, now it is time to enter the year that you were born. Please enter the full year (for example, if you were born in 1998 please enter 1998. If you were born in 2020, please enter 2020.) I have to admit, I would be surprised if you were born in 2020 because this was made in 2020. That kid must have been a computer genius!\nEnter year => ") ; 

	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &year ) ; 

	printf("\nThis program does nothing... yet\n") ;

	free( buff ) ; 

	return( 0 ) ; 
} 



// Henry was here talking to Josh 
