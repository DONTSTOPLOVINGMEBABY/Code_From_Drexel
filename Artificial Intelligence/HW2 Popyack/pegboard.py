#--------------------------------------------------------------------------------
# Pegboard Problem
# JL Popyack, March 2022
#
# This is a skeleton program for a production system that defines a Pegboard
# Problem for potential solution by a search strategy.  The program accepts 
# command-line inputs for the number of rows and columns, which define a
# rectangular area in which the problem is to be solved:
#
#    python3 pegboard_base.py BOARD_ROWS BOARD_COLS
#
#  sets the size of the grid, e.g.,  
#
#    python3 pegboard_base.py 4 4
# 
# This program contains partial definitions of State and Rule classes, which need
# to be completed.  To demonstrate that the classes work properly, the student 
# should implement a "flailing" strategy that begins with the problem in an 
# initial state and continues applying applicable moves until there are none
# remaining.  It is not necessary to try to solve the problem with an intelligent
# search strategy for this assignment.
#--------------------------------------------------------------------------------

from subprocess import call
import sys, getopt
from typing import Counter
import copy
from numpy import generic, number, where

#============================================================================
# get_arg() returns command line arguments.
#============================================================================
def get_arg(index, default=1):
	'''Returns the command-line argument, or the default if not provided'''
	return sys.argv[index] if len(sys.argv) > index else default


import random

#-----------------------------------------------------------------
# These provide some LISP-like functionality.
#-----------------------------------------------------------------

def first(list):
    return list[0]

def rest(list):
    return list[1:]

def member(x,L):
	return x in L

#-----------------------------------------------------------------
# Global variables, set at startup
#-----------------------------------------------------------------
	BOARD_ROWS = 4 
	BOARD_COLS = 4
	
## These are some functions I wrote to help myself out ## 

def current_matrix(splitz):

	first_list = [] 
	return_list = [] 

	splitz = str(splitz)
	splitz = splitz.split(' ')

	for i in splitz:
		for elements in i:
			first_list.append(elements)
		return_list.append(first_list)
		first_list = [] 
	
	return return_list


def binList_and_binNumber(number):
    binary_list = bin(number)
    binary_list = binary_list[2:]
    binary_number = binary_list
    binary_list = list(binary_list)
    return binary_list, binary_number


#--------------------------------------------------------------------------------
class State:

	#----------------------------------------------------------------------------
	# State: 
	#----------------------------------------------------------------------------
	# The state of the problem is a positive number whose binary representation
	# consists of a 1 for each peg.  The pegs are numbered from the right, i.e., 
	#     FEDC BA98 7654 3210
	# corresponding to the grid 
	#     F E D C 
	#     B A 9 8
	#     7 6 5 4
	#     3 2 1 0
	# for a problem with 4 rows and 4 columns, so that the number 
	#     1011 0010 1011 1111  (with decimal value 45759) 
	# represents this configuration:
	#     X . X X 
	#     . . X .
	#     X . X X
	#     X X X X 
	#----------------------------------------------------------------------------
	# uses global constants BOARD_ROWS, BOARD_COLS, GOAL_STATE
	#----------------------------------------------------------------------------

	
	def __init__(self, number):
	#-----------------------------------------------------------------
	# Creates a state with the given numeric value.
	#-----------------------------------------------------------------
	
		self.ROWS = BOARD_ROWS
		self.COLS = BOARD_COLS
		self.numeric = number
		
		
	def __str__ (self):
	#-----------------------------------------------------------------
	# returns a string containing the partially filled in grid 
	# corresponding to state.
	#-----------------------------------------------------------------    
		
		outstr = ""
		instr = "" 
		ctr = -1 

		instr = "" + str(bin(self.numeric))
		instr = instr[2:]	

		for i in instr:
			ctr += 1 
			if (ctr % 4) == 0:
				outstr += " " + i
				continue
			outstr += i 

		return outstr[1:]



	def applicableRules(self):
	#-----------------------------------------------------------------
	# Find all applicable rules for a given state.
	# Note that the set of all possible rules can be determined from
	# the number of rows and columns, and this function can check the 
	# precondition for each rule with the given state.  
	#-----------------------------------------------------------------

		generic_rule_list = [[1, 2, 3], [2, 3, 4], [5, 6, 7], [6, 7, 8], [9, 10, 11], [10, 11, 12], [13, 14, 15], [14, 15, 16], [1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12], [5, 9, 13], [6, 10, 14], [7, 11, 15], [8, 12, 16], [1, 6, 11], [2, 7, 12], [6, 11, 16], [5, 10, 15], [3, 6, 9], [4, 7, 10], [7, 10, 13], [8, 11, 14]]

		translated_rules = [] 

		length = bin(self.numeric)
		length = length[2:] 
		length2 = list(length)
	
	
		for i in generic_rule_list:
			temp = []
			for q in i:
				temp.append(length2[q-1])
			translated_rules.append(temp)
		
	

		#print(translated_rules)

		valid_rules = [] 
		local_ctr = 0 

		for i in translated_rules:
			rule = Rule(i)
			check = rule.precondition(self.numeric)
			if check == True:
				valid_rules.append(generic_rule_list[local_ctr])
			local_ctr += 1 


		return valid_rules
			
	def forHenry(self):
		return self.numeric


	def goal(self):
	#-----------------------------------------------------------------
	# Returns True if state equals a given GOAL_STATE, e.g., the state 
	# with exactly 1 peg, in position 9.
	#-----------------------------------------------------------------
		return self.numeric == GOAL_STATE.numeric



#--------------------------------------------------------------------------------
class Rule:

	#----------------------------------------------------------------------------
	# Rule: 
	#----------------------------------------------------------------------------
	# A rule r can be characterized by the attributes (jumper, goner, newpos), 
	# which respectively refer to the position of a peg that is about to jump 
	# (jumper), the position of the peg it jumps over (goner), and the new 
	# position of the jumper (newpos).
	# 
	# The rule is defined by the following action and preconditions:
	#   Action:Â change values in state s of jumper position to 0, 
	#           goner position to 0, and newpos position to 1.
	#   Precondition: values of jumper, goner, newpos positions are respectively   
	#                 1, 1, and 0.
	#----------------------------------------------------------------------------


	def __init__(self, moveVector):
		self.moveVector = moveVector
		self.jumper = moveVector[0]
		self.goner  = moveVector[1]
		self.newpos = moveVector[2]


	def __eq__(self, r):
		return (self.moveVector == r.moveVector)
		
		
	def __str__(self):
	#-----------------------------------------------------------------
	# returns a string describing the rule to be applied
	#-----------------------------------------------------------------
		
		description = "The peg in slot {} jumps over the peg in slot {} and lands in slot {}".format(str(self.jumper), str(self.goner), str(self.newpos))

		return description


	def applyRule(self,state):
	#-----------------------------------------------------------------
	# Returns a new state formed by applying rule to state.
	#-----------------------------------------------------------------
		newState = state

		print(state)

		list1, number1 = binList_and_binNumber(state)   	
	
		
		ctr = 0
		for i in list1:
			list1[ctr] = int(i)							
			ctr += 1									###### Take list of strings and convert to int 


		numerical_jump = 2 ** (16 - self.jumper) 
		numerical_goner = 2 ** (16 - self.goner)   
		numerical_newpos = 2 ** (16 - self.newpos)  


		if (list1[self.jumper - 1] == 1):
			newState += numerical_newpos - numerical_jump - numerical_goner
			
		else:
			newState += numerical_jump - numerical_goner - numerical_newpos
		

		return State(newState)


	def precondition(self,state):
	#-----------------------------------------------------------------
	# Returns True if the given Rule may be applied to state.
	# One way to do this is to make use of the binary representation,
	# and Python binary operators.
	#-----------------------------------------------------------------

		#print(self.jumper, self.goner, self.newpos)

		if (self.jumper == '1' and self.goner == '1' and self.newpos == '0'):
			return True
		elif (self.jumper == '0' and self.goner == '1' and self.newpos == '1'):
			return True
	
		return False


#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
#  MAIN PROGRAM
#--------------------------------------------------------------------------------

if __name__ == "__main__":
#--------------------------------------------------------------------------------
#    python3 pegboard_base.py BOARD_ROWS BOARD_COLS
#
#  	 sets the size of the grid, e.g., 
#    python3 pegboard_base.py 4 4
#--------------------------------------------------------------------------------

	BOARD_ROWS = int(get_arg(1))
	BOARD_COLS = int(get_arg(2))
		
	#-----------------------------------------------------------------
	# Create numeric peg values peg[i] = 2^i, for each peg position in 
	# the board.  If a state contains a peg in position i, the value of 
	# peg[i] is added to the empty state.
	#-----------------------------------------------------------------
	peg = []
	
	pegValue = 1
	FULL_BOARD = 0
	
	for i in range(BOARD_ROWS*BOARD_COLS):
		peg.append(pegValue)
		FULL_BOARD += pegValue
		pegValue += pegValue
# 		print("peg[%d] = %d" %(i,peg[i]))
		
#-----------------------------------------------------------------
# 	# TESTING:
#-----------------------------------------------------------------
	print("\nFULL_BOARD = %d" %FULL_BOARD)

	GOAL_STATE = peg[9]
	print("\nGOAL_STATE = %s" %GOAL_STATE)
	GOAL_STATE = State(GOAL_STATE)
	print(GOAL_STATE.goal())
	initialState = FULL_BOARD - ( peg[6]+peg[8]+peg[10]+peg[11]+peg[14] )
	
	'''

	print("\ninitialState = %s" %initialState)
	once_more = copy.deepcopy(initialState)
	initialState = State(initialState)
	print("First initial", initialState)
	print(initialState.forHenry())
	print(initialState.goal())
	call_it_random = initialState.applicableRules()[6]
	print("here") 		## please delete me 
	temp1 = Rule(call_it_random)
	new_state = temp1.applyRule(once_more)
	print(new_state)

	'''

	


	##### FLAIL WILDLY! #####

	random.seed()

	initialState = State(initialState)

	print(initialState)

	state = initialState

	print("Attempting to solve the pegboard problem, using a \n" +
		"'Flailing Wildly' strategy.")

	count = -1 
	stuck = False
	while (not state.goal()) and (not stuck):
		count += 1 
		print("\n[%d] ================\n     state: %s" %(count,state))
		rules = state.applicableRules()
		print("     There are %d applicable rules:" %(len(rules)) )

		for i in range(len(rules)):
			print("     %d: -- %s" %(i,rules[i]))

		if len(rules) == 0:
			stuck = True
		
		else:
			r = random.randint(0, len(rules) - 1)
			name_me = Rule(rules[r])
			state = name_me.applyRule(state)
			print("     Applying rule[%d]: %s" %(r,state))


		if stuck:
			print("Stopped with state: %s" %state)
		else:
			print("\nGoal Reached\n\n")

		




