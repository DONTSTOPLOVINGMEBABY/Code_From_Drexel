

def fibonnaci(n): 

	

	if int(n) == 0 : 
		return 0



	if int(n) <= 1 :
		return 1 
	
	return fibonnaci(int(n)-1) + fibonnaci(int(n)-2)



for i in range(15):
	print("{}".format(i), fibonnaci(i))




