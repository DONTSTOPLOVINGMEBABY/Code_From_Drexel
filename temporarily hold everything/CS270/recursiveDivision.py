
def divide(x, n):
	
	if (x < n):
		return 0

	return 1 + divide(x-n, n)



print(divide(10, 2))
