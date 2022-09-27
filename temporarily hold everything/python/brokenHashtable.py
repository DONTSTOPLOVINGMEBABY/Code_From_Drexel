hashtable = [] 



class ferrari():
	def __init__(self, first, second, third):
		self.__first = first
		self.__second = second
		self.__third = third



	def __str__(self): 
		return "{} {} {}".format(ferrari.self__first, ferrari.self__second, ferrari.self__third) 


for count in range(0,95):
	x = ferrari('488 GTB', '2017', 'Blue') 
	hashtable.append([x]) 

print(hashtable) 


'''

for count in range(0,10) : 
	char = "string" 
	key = ferrari("488 GTB", "2017", "Blue")
	index = hash(key)
	hashtable[index].append( (key, str(count + 1)) )


for item in hashTable:
	if len(item) != 0: 
		key = item[0][0].getValue()
		when = item[0][1]
		print(key, "was entered", when)

print()
for item in hashTable:
	print(item)



''' 
