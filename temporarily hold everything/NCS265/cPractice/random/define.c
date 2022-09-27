#include <stdio.h>
#include <string.h> 
#define THE_VARIABLE 21



int main(void) 
{
	int user_age ; 
	int day, month, year ; // To be used to find 



	printf( "Hey User! What's your age? " ) ; 
	scanf( "%d", &user_age) ; 

	if ( user_age < 21 ) 
	{
		if ( THE_VARIABLE - user_age != 1 )
		{
			printf( "Henry is %d years older than you.\n", THE_VARIABLE - user_age ) ; 
		}
		else 
		{	
			printf( "Henry is 1 year older than you.\n") ; 
		} 
		
	}


	else if ( user_age > 21 ) 
	{	
		if ( user_age - THE_VARIABLE != 1 ) 
		{ 	
			printf( "Henry is %d years younger than you.\n", user_age - THE_VARIABLE ) ; 
		}  
		else
		{ 
			printf("Henry is 1 year younger than you.\n") ; 
		}
	}
	
	else 
	{
		printf( "You and Henry are the same age!!\n" ) ; 
	}

	return( 0 ) ; 


} 
