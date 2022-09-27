from collections import deque


def fifo(): 

    ## You either have to append and popleft or appendleft and pop for FIFO 

    first_in = deque()

    first_in.append("first")
    first_in.append("second")
    first_in.append("third")
    first_in.append("fourth")

    print(first_in, len(first_in))


    for i in range(len(first_in)):
        print(first_in.popleft())



def lifo(): 

    ## You either have to append and pop or appendleft and popleft for lifo ... I guess with deque the double negative = LIFO and the singular = FIFO 

    last_in = deque()

    last_in.append("first")
    last_in.append("second")
    last_in.append("third")
    last_in.append("fourth")

    print(last_in, len(last_in))

    for i in range(len(last_in)):
        print(last_in.pop())



fifo()

print("\n\ngive me a break\n\n")

lifo()


####################################################################################################################################
####################################################################################################################################









'''

class something_awesome:

    def __init__(self):
        self.__first_attribute = "Henry Jacobs" 
        self.__his_age = 22
        self.__hair_color = "Brown Brothers Harriman" 



    def __str__(self):
        return "{}, {}, {}".format(self.__first_attribute, self.__his_age, self.__hair_color)
    




here_it_is = something_awesome()
print(here_it_is)

once = deque() 
once.append(here_it_is)
print(once)


''' 