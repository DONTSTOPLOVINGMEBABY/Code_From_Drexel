import os 

w = 2 

x = os.fork()
w += 1 
print(w)
y = os.fork()
w += 1
print(w)
z = os.fork()
w += 1 
print(w) 
tt = os.fork() 
w += 1 
print(w)






quit() 
