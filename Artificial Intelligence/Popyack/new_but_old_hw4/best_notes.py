class Node:

    def __init__(self, value, link = None): 
        self.value = value 
        self.link = link 


class LinkedList:
    
    def __init__(self):
        self.firstNode = None 


    def insertAtBeginning(self, value):
        newNode = Node(value)

        if self.firstNode != None:
            newNode.link = self.firstNode
            self.firstNode = 
