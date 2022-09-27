from ast import AsyncFunctionDef
import random
import copy
import sys, getopt
import time
from collections import deque



def get_arg(index, default=None):
#============================================================================
# Returns command line arguments.
#============================================================================
	'''Returns the command-line argument, or the default if not provided'''
	return sys.argv[index] if len(sys.argv) > index else default

def getConfiguration():
#============================================================================
# Returns configuration read from command line.
#   python3 <this program>.py -c arg -m arg -v
#
# -c, --config:
#	Specifies initial state.
#	  If given as a string, can be either in terse or reader-friendly mode, 
#	    e.g., "WOWOBBBBRWRWYRYRGGGGYOYO" or "WOWO BBBB RWRW YRYR GGGG YOYO"
#	  If given as a non-negative integer, specifies the number of random
#	    legal moves to apply to the goal state to produce initial state.
#
# -m, --method:
#	Specifies solution method to use.
#	Choices are:
#	  "b","breadth"     : specifying BREADTH_FIRST
#	  "d","depth"       : specifying IT_DEPTH_FIRST (Iterative Deepening Depth-First)
#	  "a","best"        : specifying BEST_FIRST
#	  "i","idbacktrack" : specifying IT_BACKTRACK (Iterative Deepening Backtrack)
#	  "o","other"       : user preference
#	  n>=0               : specifying DEPTH_FIRST with MAX_DEPTH=n
#
# -v, --verbose:
#  Indicates VERBOSE mode for detailed algorithm tracing 
#
# Examples:
#
# > python3 Rubik_2x2x2.py -c 3
# initialState=YWYW RRBG BGOO WWYY OOBG BGRR 
# method=DEPTH_FIRST, with MAX_DEPTH=1
# Non-Verbose mode.
# 
# > python3 Rubik_2x2x2.py -c 3 -m b
# initialState=OOYY OWOW GGGG WWRR YRYR BBBB 
# method=BREADTH_FIRST
# Non-Verbose mode.
# 
# > python3 Rubik_2x2x2.py -c 3 -m a -v
# initialState=WOWO BBBB RWRW YRYR GGGG YOYO 
# method=BEST_FIRST
# Verbose mode.
# 
# > python3 Rubik_2x2x2.py -c 3 -m i
# initialState=WWWW GGOO OOBB YYYY BBRR RRGG 
# method=IT_BACKTRACK
# Non-Verbose mode.
# 
# > python3 Rubik_2x2x2.py --config="WOWO BBBB RWRW YRYR GGGG YOYO" --method=depth 
# initialState=WOWO BBBB RWRW YRYR GGGG YOYO 
# method=IT_DEPTH_FIRST
# Non-Verbose mode.
# 
# > python3 Rubik_2x2x2.py --config="WOWO BBBB RWRW YRYR GGGG YOYO" --method=7 --verbose
# initialState=WOWO BBBB RWRW YRYR GGGG YOYO 
# method=DEPTH_FIRST, with MAX_DEPTH=7
# Verbose mode.
# 
#============================================================================
	METHOD = { }
	METHOD.update(dict.fromkeys(["b","breadth"], "BREADTH_FIRST"))
	METHOD.update(dict.fromkeys(["d","depth"  ], "IT_DEPTH_FIRST"))
	METHOD.update(dict.fromkeys(["a","best"   ], "BEST_FIRST"))
	METHOD.update(dict.fromkeys(["i","idbacktrack"], "IT_BACKTRACK"))
	METHOD.update(dict.fromkeys(["o","other"], "OTHER"))

	method = "DEPTH_FIRST"   # default method
	MAX_DEPTH = 1            # default maximum depth
	VERBOSE = False
	commandLineErrors = False
			  
	goalState = Cube()  # by default, Cube() is the goal state
	
	opts, args = getopt.getopt(sys.argv[1:],"c:m:v",["config=","method=","verbose"])
	for opt, arg in opts:
		if opt in ("-c", "--config"):
			#==============================================================
			# initialState will either be the given string, or
			# an integer specifying a random state n moves away from
			# the goal state
			#==============================================================
			initialState = arg
			if len(arg) < len(goalState.tiles): 
				#==============================================================
				# If the argument is not a string sufficiently long to be an
				# initial state, it is assumed to be a non-negative integer.
				#==============================================================
				NUM_STEPS = int(arg)
				initialState = goalState.shuffle(NUM_STEPS)
			else:
				initialState = Cube(arg)
			
		elif opt in ("-m", "--method"):
			#==============================================================
			# Solution method will either be
			#  BREADTH_FIRST, IT_DEPTH_FIRST, BEST_FIRST, IT_DEEP_BACKTRACK, 
			# or an integer, specifying DEPTH_FIRST (i.e., not Iterative 
			# Depth-First Search), with a fixed depth of that value.
			#==============================================================
			if arg in METHOD.keys():
				method = METHOD[arg]
			else:
				MAX_DEPTH = int(arg)  
				
		elif opt in ("-v", "--verbose"):
			VERBOSE = True
			
		else:
			print("Unknown option, " + opt + " " +  str(arg) )
			commandLineErrors = True
			
	if commandLineErrors:
		 sys.exit()
		 
	return initialState, method, MAX_DEPTH, VERBOSE



#--------------------------------------------------------------------------------


#============================================================================
# List of possible moves
# https://ruwix.com/online-puzzle-simulators/2x2x2-pocket-cube-simulator.php
#
# Each move permutes the tiles in the current state to produce the new state
#============================================================================

RULES = {
	"U" : [ 2,  0,  3,  1,   20, 21,  6,  7,    4,  5, 10, 11, 
	       12, 13, 14, 15,    8,  9, 18, 19,   16, 17, 22, 23],
	"U'": [ 1,  3,  0,  2,    8,  9,  6,  7,   16, 17, 10, 11, 
	       12, 13, 14, 15,   20, 21, 18, 19,    4,  5, 22, 23],
	"R":  [ 0,  9,  2, 11,    6,  4,  7,  5,    8, 13, 10, 15, 
	       12, 22, 14, 20,   16, 17, 18, 19,    3, 21,  1, 23],
	"R'": [ 0, 22,  2, 20,    5,  7,  4,  6,    8,  1, 10,  3, 
	       12, 9, 14, 11,    16, 17, 18, 19,   15, 21, 13, 23],
	"F":  [ 0,  1, 19, 17,    2,  5,  3,  7,   10,  8, 11,  9, 
	        6,  4, 14, 15,   16, 12, 18, 13,   20, 21, 22, 23],
	"F'": [ 0,  1,  4,  6,   13,  5, 12,  7,    9, 11,  8, 10, 
	       17, 19, 14, 15,   16,  3, 18,  2,   20, 21, 22, 23],
	"D":  [ 0,  1,  2,  3,    4,  5, 10, 11,    8,  9, 18, 19, 
	       14, 12, 15, 13,   16, 17, 22, 23,   20, 21,  6,  7],
	"D'": [ 0,  1,  2,  3,    4,  5, 22, 23,    8,  9,  6,  7, 
	       13, 15, 12, 14,   16, 17, 10, 11,   20, 21, 18, 19],
	"L":  [23,  1, 21,  3,    4,  5,  6,  7,    0,  9,  2, 11, 
	        8, 13, 10, 15,   18, 16, 19, 17,   20, 14, 22, 12],
	"L'": [ 8,  1, 10,  3,    4,  5,  6,  7,   12,  9, 14, 11, 
	       23, 13, 21, 15,   17, 19, 16, 18,   20,  2, 22,  0],
	"B":  [ 5,  7,  2,  3,    4, 15,  6, 14,    8,  9, 10, 11, 
	       12, 13, 16, 18,    1, 17,  0, 19,   22, 20, 23, 21],
	"B'": [18, 16,  2,  3,    4,  0,  6,  1,    8,  9, 10, 11, 
	       12, 13,  7,  5,   14, 17, 15, 19,   21, 23, 20, 22]
}


'''
sticker indices:

        0  1
        2  3
16 17   8  9   4  5  20 21
18 19  10 11   6  7  22 23
       12 13
       14 15

face colors:

    0
  4 2 1 5
    3

rules:
[ U , U', R , R', F , F', D , D', L , L', B , B']
'''

#--------------------------------------------------------------------------------

class Cube:


	def __init__(self, config="WWWW RRRR GGGG YYYY OOOO BBBB"):
			
		#============================================================================
		# This code ensures that tiles is a string without spaces in it, and
		# string is a more readable version with spaces in it, as in the default
		# argument.  The user may initialize Cube with a string in either form. 
		#============================================================================
		self.tiles = config.replace(" ","")
		#============================================================================
		# separate tiles into chunks of size 4 and insert a space between them
		#============================================================================
		chunks = [self.tiles[i:i+4] + " " for i in range(0, len(self.tiles), 4)]
		self.config = "".join(chunks)

		self.depth = 0
		self.rule = ""
		self.parent = None
		self.children = []
		self.joined_string = str(self.config).replace(" ", "")

	def __str__(self):
		#============================================================================
		# Shows cube in "readable" string format.
		#============================================================================
		return self.config

		
	def __eq__(self,state):
		return (self.tiles == state.tiles) or (self.config == state.config)

	
	def toGrid(self):
		#============================================================================
		# produces a string portraying the cube in flattened display form, i.e.,
		#
		#	   RW       
		#	   GG       
		#	BR WO YO GY 
		#	WW OO YG RR 
		#	   BB       
		#	   BY       
		#============================================================================

		def part(face,portion):
			#============================================================================
			# This routine converts the string corresponding to a single face to a 
			# 2x2 grid
			#    face is in [0..5] if it exists, -1 if not
			#    portion is either TOP (=0) or BOTTOM (=1)
			# Example:
			# If state.config is "RWGG YOYG WOOO BBBY BRWW GYRR". 
			#   part(0,TOP) is GW , part(0,BOTTOM) is WR, ...
			#   part(5,TOP) is BR , part(5,BOTTOM) is BB
			#============================================================================
		
			result = "   "
			if face >=0 :	
				offset = 4*face + 2*portion
				result = self.tiles[offset] + self.tiles[offset+1] + " "
			return result
			
		TOP    = 0
		BOTTOM = 1
		
		str = ""
		for row in [TOP,BOTTOM]:
			str += part(-1,row) + part(0,row) + \
			      part(-1,row) + part(-1,row) + "\n"
			
		for row in [TOP,BOTTOM]:
			str += part(4,row) + part(2,row) + \
			      part(1,row) + part(5,row) + "\n"
		
		for row in [TOP,BOTTOM]:
			str += part(-1,row) + part(3,row) + \
			      part(-1,row) + part(-1,row) + "\n"
			
		return str


	def applicableRules(self):
		return list( RULES.keys() )


	def applyRule(self, rule):
		shift = RULES[rule]
		string1 = "" 
		for i in shift:
			string1 += self.joined_string[i]

		return Cube(string1) 

	def shuffle(self, n):
		rule_list = [ "U" , "U'", "R" , "R'", "F" , "F'", "D" , "D'", "L" , "L'", "B" , "B'"]

		new_string = self.config
		for element in range(n):
			random_number = random.randint(0, len(rule_list) - 1)
			argument = rule_list[random_number]
			new_string = self.applyRule(argument)
			

		return Cube(str(new_string))


	def goal(self, check_state):
		one = str(self)
		one = one.replace(" ", "")

		chunks = self.config.split(' ')
		other_chunk = check_state.config.split(' ')

		diff = set(chunks).difference(set(other_chunk))

		return len(diff) == 0
		

def a_star_hurestic(state):
	
	## If a piece is not in the right place, it will calculate the distance from the piece's current location
	## to where it should be in the string. The dictionary starting_positions is used to reference where each letter should start
	## in the goal string. Everytime a letter is out of place, we will increment return_counter by the distance from the location in  
	## the goal string. The larger the number, the further it is from the goal. Nodes with the smallest distance should be chosen first.  

	goal_string = "GGGGYYYYOOOOBBBBWWWWRRRR"
	state_string = state.joined_string
 
	ctr = 0 
	return_ctr = 0 

	starting_positions = { "G" : 0, "Y" : 4, "O" : 8, "B" : 12, "W" : 16, "R" : 20 } 
	starting_positions2 = copy.deepcopy(starting_positions)
	
	for i in state_string:

		if (goal_string[ctr] == i):
			ctr += 1 
			continue

		return_ctr += abs(starting_positions2[i] - ctr)
		ctr += 1 
		starting_positions2[i] = starting_positions2[i] + 1 

	print(return_ctr)

	return return_ctr

def depth_fs(initialState):
	pass


def best_fs(initialState):
	pass


def breadth_fs(initialState):

	ctr = 0 

	open = deque()
	open.append(initialState)
	closed = deque() 

	while (len(open) != 0):

		ctr += 1 

		s = open.popleft()
		closed.append(s)
		if (s.goal(GOALSTATE)):
			print("Reached the goal: ", s)
			break

		rules = s.applicableRules() 
		
		for iteration in rules:
			s_prime = s.applyRule(iteration)
			
			if s_prime not in open or s_prime not in closed:
				s_prime.parent = s
				s_prime.depth = s.depth + 1
				open.append(s_prime)

			elif s_prime in open:
				compare = open.index(s_prime)
				less = min(s.depth, open[compare].parent.depth)
				
				print(s.depth, open[compare].parent.depth)
				print("less", less)

				
				if (less == s.depth):
					s_prime.parent = s
				else:
					s_prime.parent = open[compare].parent				
				
				s_prime.depth = s_prime.parent.depth + 1 
				
			
			elif s_prime in closed:
				
				compare = closed.index(s_prime)
				less = min(s.depth, closed[compare].parent.depth)

				if (less == s.depth):
					s_prime.parent = s
				else:
					s_prime.parent = closed[compare].parent	
				s_prime.depth = s_prime.parent.depth + 1 

	return 0 
				
	

global GOALSTATE  
GOALSTATE = Cube("GGGG YYYY OOOO BBBB WWWW RRRR")


#--------------------------------------------------------------------------------
#  MAIN PROGRAM
#--------------------------------------------------------------------------------

if __name__ == '__main__':
	
	#============================================================================
	# Read input from command line:
	#   python3 <this program>.py -c arg -m arg -v
	# where
	#   -c provides an initial state or an integer n specifying a number of random 
	#      rules to apply to the goal state.
	#   -m indicates the method to use to solve the problem 
	#   -v indicates VERBOSE mode for detailed algorithm tracing
	#
	# See definition of getConfiguration() above for further details, examples.
	#============================================================================

	initialState, method, MAX_DEPTH, VERBOSE = getConfiguration()

	two = breadth_fs(initialState)
	
	print(two)
	










'''
	print(two)
	print(initialState)

	print(initialState.goal(GOALSTATE))
	
	print(rules)
	cp = copy.deepcopy(initialState.applyRule(rules[0]))
	print(cp)
	print(cp.applyRule(rules[1]))
	
list1 = deque()
	list2 = deque() 

	rules = initialState.applicableRules()

	list1.append(initialState)
	list1.append(initialState.applyRule(rules[0]))
	list1.append(initialState)

	
	if (list1[0]) == (list1[2]):
		print("nice")

'''
	
'''
	print("initialState=" + str(initialState))
	print("A-Star Output for InitialState: ", a_star_hurestic(initialState))

	print(initialState.goal(GOALSTATE))
	print(initialState.applicableRules())
	rules = initialState.applicableRules()	
	state1 = initialState.applyRule(rules[0])
	print(state1)
	state1 = initialState.applyRule(rules[1])
	print(state1)


#============================================================================
	# Test case: This state is one move from a goal.  
	# Applying the "R" rule should solve the puzzle.
	#============================================================================
	state = Cube("GRGR YYYY OGOG BOBO WWWW BRBR")
	print(state.toGrid())
	
	newState = state.applyRule("R")
	
	print(newState.toGrid())
	

	if newState.goal(GOALSTATE):
		print("SOLVED!")
	else:
		print("NOT SOLVED.")


'''
