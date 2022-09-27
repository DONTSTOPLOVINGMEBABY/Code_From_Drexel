

x = int(input("Enter a fucking number => "))


import math


counter = 0 

while (x > 0):
	print(x%10)
	counter += x % 10 
	x = math.floor(x/10) 
	

print(counter) 


