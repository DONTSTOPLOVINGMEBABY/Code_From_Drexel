#!/usr/bin/env python3

from lexer import *

intStack = []
opStack = []

while get_expression():

    t = get_next_token()
    while t:
        if (str.isdigit( t[0] )):
            intStack.append(list(t))

        else:
            opStack.append(list(t))
            
        t = get_next_token()

    num1 = intStack.pop()
    num2 = intStack.pop()
    op = opStack.pop()

    if (len(num1) > 1):
        seperator = ''
        num1 = seperator.join(num1)
        print("pre: {} {} {}".format(op[0], num1, num2[0] ))
        print("in: {} {} {}".format(num1, op[0], num2[0]))
        print("post: {} {} {}".format(num1, num2[0], op[0]))
    
    elif (len(num2) > 1):
        seperator = ''
        num2 = seperator.join(num2)
        print("pre: {} {} {}".format(op[0], num1[0], num2 ))
        print("in: {} {} {}".format(num1[0], op[0], num2))
        print("post: {} {} {}".format(num1[0], num2, op[0]))
    
    else:
        print("pre: {} {} {}".format(op[0], num1, num2 ))
        print("in: {} {} {}".format(num1, op[0], num2))
        print("post: {} {} {}".format(num1, num2, op[0]))
        
    
    print(' ')

