number = 997 
new = []
queen = True

for i in range(2,10):
	new.append(number % i)

for i in new:
	if (new[i] == 0):
		queen = True 
	else: 
		queen = False



if (queen == False):
	print("prime")
else:
	print("not prime")
	
	

