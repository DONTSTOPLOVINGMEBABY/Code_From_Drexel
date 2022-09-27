import random


listOfVariables = [] 

listOfCombinations = [] 

intermitent1 = [] 

intermitent2 = [] 






print("Type your variables one at a time, pressing enter after you have entered one. For example, if you want to see the output for variables A and B, input 'A' return 'B' return")

while True:
	
	variable = str(input("Enter your variable => "))

	if variable == '' : 
		break 
	
	listOfVariables.append(variable.strip())



numFTs = len(listOfVariables) 

for i in range(len(listOfVariables)): 
	listOfCombinations.append('T')
	listOfCombinations.append('F') 


counter = len(listOfCombinations) * len(listOfCombinations) 


print(counter)



#while (len(listOfCombinations) <= (len(listOfCombinations) *  len(listOfCombinations))):
	
#	while True:
#		pass




	
