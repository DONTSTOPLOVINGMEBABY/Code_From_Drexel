
// Takes an array of doubles, along with the array's length and returns arithmetic mean // 

double arrAvg( double a[], size_t b )  
{
	double average ; 

	for( size_t i = 0; i<b ; i++ ) 
		average += a[i] ;

	return average/b ; 
}
