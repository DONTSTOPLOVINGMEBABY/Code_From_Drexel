//Takes an array of doubles and calculates the max, min, and mean. 
void arrStats( double array[], size_t len, double *max, double *min, double *mean) 
{
	int i ; 
	double *k = array ;


	*max = *min = *(k + 0) ;
	for (i = 1; i < len; i++)
	{
		if ( *(k + i) > *max) 
			*max = *(k + i) ;
		else if ( *(k + i)  < *min) 
			*min = *(k + i) ; 
	}
	
	for ( size_t i = 0 ; i < len ; i++ ) 
		*mean += *(k + i) ; 

	*mean /= len ; 
 
}
