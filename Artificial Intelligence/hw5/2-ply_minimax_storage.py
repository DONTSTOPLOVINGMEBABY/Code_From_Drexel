	def miniMax(self, board, min, depth, maxDepth):
	#---------------------------------------------------------------------------
	# Use MiniMax algorithm to determine best move for player to make for given
	# board.  Return the chosen move and the value of applying the heuristic to
	# the board.
	# To examine each of player's moves and evaluate them with no lookahead,
	# maxDepth should be set to 1.  To examine each of the opponent's moves,
	#  set maxDepth=2, etc.
	# Increase depth by 1 on each recursive call to miniMax.
	# min is the minimum value seen thus far by
	#
	# If a win is detected, the value returned should be INFINITY-depth.
	# This rates 'one move wins' higher than 'two move wins,' etc.  This ensures
	# that Player moves toward a win, rather than simply toward the assurance of
	# a win.
	#
	# Student code needed here.
	# Alpha-Beta pruning is recommended for Extra Credit.
	# Argument list for this function may be altered as needed.
	#
	# successive calls to MiniMax should swap the self and opponent arguments.
	#---------------------------------------------------------------------------

	#---------------------------------------------------------------------------
	# This code just picks a random move, and needs to be replaced.
	#---------------------------------------------------------------------------
		
		assurances_max = []
		assurances_min = [] 

		if self.token == 'b':
			other_token = 'w'
		else:
			other_token = 'b'
		
		moveList = board.getMoves()  # find all legal moves
		
		##minimax 2 move lookahead
		
		max = 0 - (self.INFINITY + 1)		

		for each_my_move in moveList:
			nextState = copy.deepcopy(board.board)
			nextState = board.applyMove(each_my_move, self.token)

			if self.win(nextState):
				return each_my_move, self.INFINITY

			min = self.INFINITY + 1 

			for each_their_move in nextState.getMoves():
				newState = copy.deepcopy(nextState)
				newState = nextState.applyMove(each_their_move, other_token) 

				if self.hmj32_h(newState) < min:
					min = self.hmj32_h(newState)
					assurances_min.append(min)

	
			if min > max:
				max = min 
				move = each_my_move
				assurances_max.append(max)
				print(max, move)
				print("liking the way you move")


		'''move = moveList[1]
		newboard = copy.deepcopy(board.board)
		newboard = board.applyMove(move, self.token)

		value = self.hmj32_h(newboard)'''

		'''

		print("what is going on")

		print(move)
		print(max)
		print("Assurances Max", assurances_max)
		print("Assurances Min", assurances_min)

		'''


		return move, max         # return move and backed-up value
