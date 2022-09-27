from collections import deque

class PEOPLE_POINTING:

    def __init__(self, person_pointing, pointed_at = None) : 

        self.person_pointing = person_pointing
        self.pointed_at = pointed_at 


    def __str__(self):
        return " --> {} --> {} ".format(self.person_pointing, self.pointed_at)

   
class PEOPLE():

    def __init__(self, person):

        self.__person = person

    
    def __str__(self):
        return str(self.__person)



list_of_people = [] 


grace = PEOPLE("Grace")
christian = PEOPLE("Christian")
ryan = PEOPLE("RYAN") 
george = PEOPLE("GEORGE")














class point():

    def __init__(self, you, point_at):
        
        self.you = you 
        
        self.point_at = point_at













