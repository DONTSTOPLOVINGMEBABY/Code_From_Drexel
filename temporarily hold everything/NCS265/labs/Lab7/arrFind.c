//Takes an array of integers and seaarches for a target integer within that array. First one found is returned as a pointer. If none are found, function returns NULL. 
int arrFind (int array[], size_t len, int target)
{
	int *pointer, *k = array ;

	for (size_t i = 0 ; i < len ; i++ ) 
		if ( *(k + i) == target)
		{
			pointer = &*(k + i) ;
			return *pointer ; 
		} 


	*pointer = NULL ; 
	return (*pointer) ;
} 
