// A function which parses up non-negative number (base 10), writes the string into an array pointed to by answer 

void int2string( int n, char answer[] ) 
{
	int i = 0, append, cnt = 0 ;
	char temparray[n] ; 

	while (n != 0) {
		char c ; 
		append = n % 10 ;
		n /= 10 ; 
		c = (char) append + '0' ; 
		temparray[i] = c ; 
		i++ ; 
	}

	for ( i ; i >= 0 ; i-- ) 
	{
		*answer[cnt] = temparray[i] ;
		cnt++ ; 
	} 
}



