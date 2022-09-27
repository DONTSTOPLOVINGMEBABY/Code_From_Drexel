def hmj32_h(self, board):
	#---------------------------------------------------------------------------
	# This function will statically evaluate a 6x6 pentago board for the current player. 
	# 1 point is awarded for each piece that is lined up vertically, horizontally, and diagonally. 
	# 1 point is also deducted from the player's score for each piece that their opponent has lined up 
	# Vertically, Horizontally, and Diagonally. For instance, if the first 6x6 row looks like this:
    # "B B B . . .", then black would receive three points for having three pieces in a row horizontally. 
    # If the current player comes across a state where they have four in a row, an extra 100 points is awarded to signify
    # that the state is one move away from a winning state, and likewise 100 points is deducted if the opponent is in the 
    # same position. 
    # 
    # The player should choose the move with the HIGHEST heuristic value. 
	#---------------------------------------------------------------------------
				
		def vertical_straight(position_list, token):

			ctr = 0
			ctr2 = 0
			eval = 0
			vertical_pairs = [] 

			while (ctr < len(position_list)):
				
				carry_one = False
				local_eval = 0 

				for i in range(1,6):
					
					past = position_list[i-1][ctr2]
					present = position_list[i][ctr2]

					if (past == present and past == token):
						eval += 1
						local_eval += 1 
						carry_one = True 

				if carry_one:
					eval += 1
					local_eval += 1 

				vertical_pairs.append(local_eval)

				ctr += 1 
				ctr2 += 1 

			return eval, vertical_pairs



		def horizontal_straights(position_list, token):

			## Position List is the full 6-list list. 
			global horizontal_eval 
			horizontal_eval = 0 
			global horizontal_pairs 
			horizontal_pairs = []


			def evaluator(arg_list):

				eval = 0
				ctr = 1 

				global horizontal_pairs

				while (ctr != len(arg_list)):

					if arg_list[ctr - 1] == arg_list[ctr] and arg_list[ctr] == token:
						eval += 1 

					ctr += 1 

				if (eval >= 1):
					eval += 1
				horizontal_pairs.append(eval)
				return eval


			def if_token_exists_call_evaluator(arg_list):

				global horizontal_eval

				call_evaluator = False

				for i in arg_list:
					if i == token:
						call_evaluator = True
						break   

				if call_evaluator == True:
					horizontal_eval += evaluator(arg_list)
				else:
					horizontal_pairs.append(0)

			
			for i in position_list:
				if_token_exists_call_evaluator(i)

			return horizontal_eval, horizontal_pairs



		def get_diagonal_score(position_list, token):
			
			eval = 0
			diagonal_pairs = []  
			
			list_of_diagonals = [  
			[ position_list[0][1], position_list[1][2], position_list[2][3], position_list[3][4], position_list[4][5] ] , 
			[ position_list[0][0], position_list[1][1], position_list[2][2], position_list[3][3], position_list[4][4], position_list[5][5] ] ,  
			[ position_list[1][0], position_list[2][1], position_list[3][2], position_list[4][3], position_list[5][4] ] , 
			[ position_list[0][4], position_list[1][3], position_list[2][2], position_list[3][1], position_list[4][0] ] , 
			[ position_list[0][5], position_list[1][4], position_list[2][3], position_list[3][2], position_list[4][1], position_list[5][0] ], 
			[ position_list[1][5], position_list[2][4], position_list[3][3], position_list[4][2], position_list[5][1] ]   
			]


			for diagonal in list_of_diagonals:

				ctr = 1
				local_ctr = 0 
				while (ctr != len(diagonal)):

					if diagonal[ctr - 1] == diagonal[ctr] and diagonal[ctr] == token:
						eval += 1
						local_ctr += 1 
					

					ctr += 1

				if (local_ctr >= 1):
					eval += 1
					local_ctr += 1 

				diagonal_pairs.append(local_ctr)

			return eval, diagonal_pairs



		def final_call(player_to_move, position_list):
			
			eval = 0 

			if player_to_move == 'b':
				secondary = 'w'
			else:
				secondary = 'b'


			eval_add_horizontal, player_horizontal_pairs = horizontal_straights(position_list, player_to_move)
			eval_sub_horizontal, secondary_horizontal_pairs = horizontal_straights(position_list, secondary) 


			eval_add_diagonal, player_diagonal_pairs = get_diagonal_score(position_list, player_to_move)
			eval_sub_diagonal, secondary_diagonal_pairs = get_diagonal_score(position_list, secondary)

			eval_add_vertical, player_vertical_pairs = vertical_straight(position_list, player_to_move)
			eval_sub_vertical, secondary_vertical_pairs = vertical_straight(position_list, secondary) 
			

			eval += eval_add_horizontal + eval_add_diagonal + eval_add_vertical - eval_sub_horizontal - eval_sub_diagonal - eval_sub_vertical


			for element in player_horizontal_pairs:
				if element == 4:
					eval += 100

			for element in secondary_horizontal_pairs:
				if element == 4:
					eval -= 100

			for element in player_diagonal_pairs:
				if element == 4:
					eval += 100

			for element in secondary_diagonal_pairs:
				if element == 4:
					eval -= 100 

			for element in player_vertical_pairs:
				if element == 4:
					eval += 100 

			for element in secondary_vertical_pairs:
				if element == 4:
					eval -= 100 

			return eval 

  
		position_list = board.board
		
		print(position_list)
		
		eval = final_call(self.token, position_list)	

		return eval
