import sys 


def reverse(string1):
	lisp = [] 
	for i in string1:
		lisp.append(i)
	
	important = len(lisp) - 1 

	print("Your string => {}".format(string1)) 

	print("The reverse ->", end =' ') 

	while(len(lisp) != 0):
		print(lisp[important], end='')
		important -= 1
		lisp.pop() 

	print() 



if (len(sys.argv) != 1):
	reverse(sys.argv[1])
else:
	x = input("Please enter a string ") 
	reverse(x)


