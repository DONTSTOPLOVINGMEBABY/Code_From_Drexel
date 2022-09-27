from threading import local
from turtle import position

from numpy import diagonal


arg_list = ['.', 'b', '.', '.', 'b', '.']

y = [['w', '.', 'b', '.', 'b', 'w'], ['.', 'w', '.', 'b', '.', 'w'], ['b', '.', 'w', '.', '.', 'w'], ['b', '.', '.', '.', '.', 'w'], ['.', '.', '.', 'b', 'w', '.'], ['b', 'b', 'b', '.', 'w', 'w']]

www_bb = [['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b'], ['w', 'w', 'w', '.', 'b', 'b']]

vertical_list = [['w', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'w', 'w', '.', 'b', 'b'], ['b', 'b', 'b', '.', 'w', 'w'], ['b', 'b', 'b', '.', 'w', 'w']]


diagonal_list = [['w', 'b', 'w', 'b', '.', 'w'], ['b', 'w', 'b', 'w', '.', 'w'], ['b', 'b', 'w', '.', 'w', '.'], ['w', 'w', 'w', 'w', '.', 'b'], ['b', 'b', 'b', 'b', '.', 'w'], ['w', 'w', 'b', 'w', '.', 'b']]


right_ward_diagonal = [['H', 'A', 'w', 'b', '.', 'w'], ['L', 'E', 'P', 'w', '.', 'w'], ['b', 'A', 'N', 'P', 'w', '.'], ['w', 'w', 'R', 'R', 'L', 'b'], ['b', 'b', 'b', 'G', 'Y', 'E'], ['w', 'w', 'b', 'w', 'E', 'S']]

position_list = [['w', 'b', 'w', 'b', 'F', 'F'], ['b', 'w', 'b', 'A', 'R', 'D'], ['b', 'b', 'R', 'I', 'R', '.'], ['w', 'T', 'D', 'Y', '.', 'b'], ['S', 'A', 'E', 'b', '.', 'w'], ['Y', 'R', 'b', 'w', '.', 'b']]

chunks = [['w', '.', '.', '.', '.', 'w'], ['w', 'w', 'w', '.', 'w', '.'], ['.', 'w', 'w', 'w', '.', '.'], ['.', '.', 'b', 'w', 'w', '.'], ['b', 'b', 'b', 'w', 'w', 'w'], ['b', 'w', 'w', '.', 'w', 'w']]





'''
for i in diagonal_list:
    print(i)
'''

print()

for i in chunks:
    print(i)

print()




### I just have to read the diagonals straight accross and check for patterns... Should be the easiest. ### 

### ## Probably going to need a function that calls one for each player and returns a summation based on whose turn it is. Should be something like negative points if the opponent has a diagonal straight and positive points if you do 









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


def final_diagonal(player_to_move, position_list):
    eval = 0

    if player_to_move == 'b':
        secondary = 'w'
    else:
        secondary = 'b'


    eval_add, player_diagonal_pairs = get_diagonal_score(position_list, player_to_move)
    eval_sub, secondary_diagonal_pairs = get_diagonal_score(position_list, secondary)

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





#print(get_diagonal_score(diagonal_list, token='w'))
print(get_diagonal_score(chunks, token='w'))
print(get_diagonal_score(chunks, token='b'))


x = final_diagonal('w', chunks)
print(x)