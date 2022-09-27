#include <string.h> 
#include <stdio.h>
#include <stdlib.h> 
#define YEAR 2021


int findyear( int y ) ; 

int main() 
{
	char *buff = NULL ; 
	size_t len = 0 ; 
	int age, birthyear ; 

	printf( "Please enter your age => " ) ; 
	
	getline( &buff, &len, stdin ) ; 
	sscanf( buff, "%d", &age ) ; 

	birthyear = findyear( age ) ; 

	printf( "You were likely born in the year %d, but then again it could have been in %d\n", birthyear, birthyear - 1 ) ; 

	return( 0 ) ; 

}


int findyear( int y ) 
{
	int year = YEAR - y ;

	return( year ) ; 
} 
