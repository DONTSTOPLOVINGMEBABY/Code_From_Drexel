#include <stdio.h>

int main(void) 
{
	int seconds = 18010 ; 

	int minutes = seconds/60 ; 

	int hours = minutes / 60 ; 

	int secs = seconds % 60 ; 


	while ( minutes >= 60 ) 
	{
		hours += 1 ; 
		minutes -= 60 ; 
	} 


	printf("%d : %d : %d\n", hours, minutes, secs) ; 

	return( 0 ) ; 

} 
