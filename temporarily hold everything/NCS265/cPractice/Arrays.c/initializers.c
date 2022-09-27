#include <stdio.h>
#include <string.h> 


int main() 

{
	int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} ; 


	int b[10] = {1, 2, 3 , 4, 5, 6} ; /* Values at initialization: {1,2,3,4,5,6,0,0,0,0} */ 


	int c[] = {1, 2, 3, 4, 5, 6, 7, 8} ; 


	int d[15] =  { [2] = 29, [9] = 7, [14] = 48 } ; /* Third element = 29, Tenth Element = 7, Fifteenth Element = 48, and all other values are equal to zero */


	int e[] = { [2] = 48 , [10] = 89, [25] = 100 } ; /* Same format as before where third element equals 48... and all other elements not listed are equal to zero. Array will have length 1 + longest element in the group (25 + 1  = Length of 26) */ 

	return( 0 ) ;

} 


	
