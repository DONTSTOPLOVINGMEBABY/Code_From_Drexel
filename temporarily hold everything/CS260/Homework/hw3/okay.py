import sys

def fibonnaci(n):
    if int(n) <= 2:
        return 1
    return fibonnaci(int(n)-1) + fibonnaci(int(n)-2)


for i in range(11):	
	print("{} {}".format(fibonnaci(i),i))







