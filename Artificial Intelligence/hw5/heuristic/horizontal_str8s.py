from turtle import position


arg_list = ['.', 'b', '.', '.', 'b', '.']
y = [['w', '.', 'b', '.', 'b', 'w'], ['.', 'w', '.', 'b', '.', 'w'], ['b', '.', 'w', '.', '.', 'w'], ['b', '.', '.', '.', '.', 'w'], ['.', '.', '.', 'b', 'w', '.'], ['b', 'b', 'b', '.', 'w', 'w']]

#www_bb = [['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b']]

www_bb = [['w', 'w', 'w', '.', '.', '.'], ['w', 'w', 'w', '.', '.', '.'], ['.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.']]




## Probably going to need a function that calls one for each player and returns a summation based on whose turn it is. Should be something like negative
## points if the opponent has a horizontal straight and positive points if you do 


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


def final_horizontal(player_to_move, position_list): 

    eval = 0 

    if player_to_move == 'b':
        secondary = 'w'
    else:
        secondary = 'b'

    eval_add, player_diagonal_pairs = horizontal_straights(position_list, player_to_move)
    eval_sub, secondary_diagonal_pairs = horizontal_straights(position_list, secondary) 

    eval += eval_add - eval_sub

    ## Reward player for strong positions of four in a row or more

    for element in player_diagonal_pairs:
        if element == 4:
            eval += 10
    
    ## Punish player for strong positions held by opponent 

    for element in secondary_diagonal_pairs:
        if element == 4:
            eval -= 10

    return eval




print(horizontal_straights(www_bb, 'w'))