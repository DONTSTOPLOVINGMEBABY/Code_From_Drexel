/* Function returns the heap instances pointed to by to an array to the heap. 
** Function checks every position for null-pointer to avoid memory leak ****/ 

void freePeople( person* a[], size_t n )
{
	for( int i=0; i<n && a[i] != NULL; ++i ) 
	{
		free( a[i] ) ; 
		a[i] = NULL ; 
	}
	free( a ) ; 
} 
