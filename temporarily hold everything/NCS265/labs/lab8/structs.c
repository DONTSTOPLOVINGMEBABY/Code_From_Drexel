/* Takes a number of seconds as an argument and returns the time of day in a 24 hour format as a struct */ 


struct time 
{
	int min;
	int hr; 
	int sec ; 
} ; 


struct time sec2hms( int secs ) 
{	
	int minutes = secs / 60 ;

	int hours = minutes / 60 ; 

	int seconds = secs % 60 ;

	while( minutes >= 60 ) 
	{
		hours += 1 ; 
		minutes -= 60 ; 
	} 

	struct time t1 = {hours, minutes, seconds} ; 

	return t1 ;  
	
} ;


int main(void) 
{
	return ( 0 ) ; 

} 
