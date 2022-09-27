


def function( i, n):
	
	while ( (i*i) <= n): 
		
		if ( (n % i) == 0) : 
			return False
		
		i += 1
	

	return True



''' 

print("3",function( 2, 3))
print(function(2, 5))
print(function(2, 8))
print(function(2,10))


''' 


for n in range(3,15):
	print(n, function(2, n))
