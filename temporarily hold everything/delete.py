import os 


print("here is this... no fork yet")


x = os.fork()

if (x == 0):
	print("this is it... this is really something") 

y = 0 

for i in range(1000):
	y += 1
	print(y)


print("just forked")
print(os.getpid())
