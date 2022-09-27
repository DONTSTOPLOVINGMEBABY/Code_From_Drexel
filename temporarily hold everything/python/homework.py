import sys


def DecimaltoBinary(num) : 

	if (num >= 1): 
		DecimaltoBinary(num // 2)
	
	print(num % 2 , end="")

	print()


''' 

if (len(sys.argv) > 1):
	print("more than two argument")
	
	DecimaltoBinary(int(sys.argv[1]))

	quit() 	

''' 


x = int(input("Please enter a number to be converted to binary")) 
DecimaltoBinary(x)
