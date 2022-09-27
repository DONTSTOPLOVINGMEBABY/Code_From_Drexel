def division(n, b):
	if n < b: 
		return n

	return division(n-b, b) 

print(division(43, 2), "43 and 2")

print(division(13, 3), "13 and 3")

print(division(5, 2), "5 and 2")

print(division(6, 2), "12 and 2. Should be zero") 
