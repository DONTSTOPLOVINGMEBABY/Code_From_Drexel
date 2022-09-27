from turtle import position


arg_list = ['.', 'b', '.', '.', 'b', '.']

y = [['w', '.', 'b', '.', 'b', 'w'], ['.', 'w', '.', 'b', '.', 'w'], ['b', '.', 'w', '.', '.', 'w'], ['b', '.', '.', '.', '.', 'w'], ['.', '.', '.', 'b', 'w', '.'], ['b', 'b', 'b', '.', 'w', 'w']]

www_bb = [['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b']]

vertical_list = [['w', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'b', 'b', '.', 'w', 'w'], ['w', 'b', 'b', '.', 'w', 'w']]





for i in vertical_list:
    print(i)




## will need another function that calls vertical_straight for both tokens and finds some summation, where vertical straights for the current player positively impact their score and an opponent's vertical straight negatively impacts their score.  


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


def final_vertical(player_to_move, position_list): 

    eval = 0 

    if player_to_move == 'b':
        secondary = 'w'
    else:
        secondary = 'b'

    eval_add, player_diagonal_pairs = vertical_straight(position_list, player_to_move)
    eval_sub, secondary_diagonal_pairs = vertical_straight(position_list, secondary) 

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




print(vertical_straight(vertical_list, token='b'))
print(vertical_straight(vertical_list, token='w'))
print(final_vertical('b', vertical_list)) 