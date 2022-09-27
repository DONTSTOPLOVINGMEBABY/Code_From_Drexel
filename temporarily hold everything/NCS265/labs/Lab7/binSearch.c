//Takes an array of integers, along with the number of elements in array (n), and an integer that is searched for in array. If found, it returns the index of the target element, if not, it returns number of elements in array. 

int binSearch( int array[], size_t n, int target) 
{

	int midValue, lowest = 0, highest = n - 1 ; 
	
	if (target > array[highest])

		return n ; 

	while (lowest <= highest) 
		{
			midValue = (lowest + highest / 2 ) ; 
			
			if (target < array[midValue])
				highest = midValue + 1 ; 
			else if (target > array[midValue])
				lowest = midValue - 1 ; 
			else
				return midValue ; 
		}

		return n ; 
}
