#!/usr/bin/python3

import math

def f( n ) :

	return 3*n**(2.7) + n**2 + 12*n*math.log(n) + 67

for n in range( 100, 1001, 100 ) :
	print( f'{n:5d}  {f(n):14.2f}' )

blah=12
echo "blah is $blah"
