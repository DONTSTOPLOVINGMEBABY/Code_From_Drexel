class LinkedList:
	
	def __init__(self):
		self.head = None 

	def __repr__(self):
		node = self.head 
		nodes = [] 
		while node is not None:
			nodes.append(node.data)
			node = node.next
		
		nodes.append("None")
		return " -> ".join(nodes) 



class Node:
	def __init__(self, data):
		self.data = data
		self.next = None 

	
	def __repr__(self):
		self.head = None
			



llist = LinkedList() 
print("Linked List initiated. Printing value of Linked List\n" + str(llist))  


first_node = Node("a") 
llist.head = first_node 
print(llist) 



second_node = Node("b") 
third_node = Node("c") 
first_node.next = second_node
second_node.next = third_node
print(llist) 

print("this freaking thing... am i right??") 


