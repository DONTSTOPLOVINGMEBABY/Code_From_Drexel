#lang racket
(require rackunit)
(require rackunit/text-ui)
#|
CS270
Mark Boady 2021
Three Color Problem

;Important Rules:
;1.) You may not use loop constructs like while/for/sum. If used, your answer will get a zero.
;2.) If the instructions state something must be recursive, you will recieve a zero if it is not recursive.
;    Recursive helper functions are allowed (the main function not being recursive).
;3.) You may not use the set! command. If used, your answer will get a zero.
;4.) Using If/Cond to explicitly pass tests instead of following the instructions
;    will always result in a zero for that question.

|#

;Big Picture: Given a Graph make the dimacs
;to determine the 3-color of the graph


;---------------------------------------------------------------------
;----------------------------Question 1-------------------------------
;---------------------------------------------------------------------

;In this homework, you will be generating and returning strings.
;These questions are designed to get you used to generating strings in Racket.

;There are two commands you will need for these questions

;(number->string n) takes a number and converts it to a string
;Example: (number->string -7) returns "-7"

;(string-append a b c ...) takes multiple strings and merges them
;into one new string
;Example: (string-append "orange" " " "cat") returns "orange cat"

;The null string is just "" (string-append "" "cat") returns "cat"

; Write a recursive function string_sequence that generates
; a string counting down from n to 0

; Generate a string counting down from n to 0
; Input: n an integer
; Output: The empty string if n < 0
; A string with integers from n to 0 listed backwards otherwise
; put a space after every number, including the last one
(define (stringSequence n)
  (if (< n 0) ""
      (string-append (number->string n) " " (stringSequence (- n 1))) 
))

;Test Bed
(display "Question 1 String Sequence (5 points)\n")
(define-test-suite test_stringSequence
  (check-equal? (stringSequence -2) "")
  (check-equal? (stringSequence 0) "0 ")
  (check-equal? (stringSequence 1) "1 0 ")
  (check-equal? (stringSequence 5) "5 4 3 2 1 0 ")
  (check-equal? (stringSequence 10) "10 9 8 7 6 5 4 3 2 1 0 ")
)
(define q1_score (- 5 (run-tests test_stringSequence 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 2 --------------------------------
;---------------------------------------------------------------------

;In a graph, no node can be given two colors.
;Every node needs to have avariable representing it's color.
;For example, if there are three nodes, then node three can either be
;red, green, or blue.
;It cannot be both red and blue. A node can only have one color.

;DiMACS does not understand text like "node 1 is red"
;We need to make a number to represent each possible statement.

;We have exactly three colors, so we can come up with a pattern.
;(Node ID)*3+1 = The Node is Red
;(Node ID)*3+2 = The Node is Green
;(Node ID)*3+3 = The Node is Blue

;Remember 0 cannot be used in DiMACs
;If we have three nodes (0,1,2) then the variables we need are
;1: Node 0 is Red
;2: Node 0 is Green
;3: Node 0 is Blue
;4: Node 1 is Red
;5: Node 1 is Green
;6: Node 1 is Blue
;7: Node 2 is Red
;8: Node 2 is Green
;9: Node 2 is Blue

;Implement three functions to generate these names.

;Node x is Red
;Input: integer x >= 0
;Output: The DiMACS variable number for "Node x is Red"
(define (nodeIsRed x)
  (+ 1 (* x 3))
)

;Node x is Green
;Input: integer x >= 0
;Output: The DiMACS variable number for "Node x is Green"
(define (nodeIsGreen x)
   (+ 2 (* x 3))
)

;Node x is Blue
;Input: integer x >= 0
;Output: The DiMACS variable number for "Node x is Blue"
(define (nodeIsBlue x)
  (+ 3 (* x 3)))

;Test Bed
(display "Question 2 Create Variable Numbers (9 points)\n")
(define-test-suite test_variableNumbers
  (check-equal? (nodeIsRed 0) 1)
  (check-equal? (nodeIsGreen 0) 2)
  (check-equal? (nodeIsBlue 0) 3)
  (check-equal? (nodeIsRed 1) 4)
  (check-equal? (nodeIsGreen 1) 5)
  (check-equal? (nodeIsBlue 1) 6)
  (check-equal? (nodeIsRed 2) 7)
  (check-equal? (nodeIsGreen 2) 8)
  (check-equal? (nodeIsBlue 2) 9)
)
(define q2_score (- 9 (run-tests test_variableNumbers 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 3 --------------------------------
;---------------------------------------------------------------------

;A node must be at least one color.
;Node 1 must be either red or blue or green
;It has to be assigned a color.

;If we had three nodes the DiMACS would be
;1 2 3 0 [Node 0 has a color]
;4 5 6 0 [Node 1 has a color]
;7 8 9 0 [Node 2 has a color]

;hasColor returns the DiMACS string that says node x
;has a color
;Input: integer x >= 0
;Output: A string representing the dimacs for
;"Node x must be either red or blue or green"
;Reminder: Every DiMACs line MUST end with a "0\n"
(define (hasColor x)
      (string-append (number->string (nodeIsRed x)) " " (number->string (nodeIsGreen x)) " " (number->string (nodeIsBlue x)) " 0\n"))

;Test Bed
(display "Question 3 Node Has a Color (6 points) \n")
(define-test-suite test_hasColor
  (check-equal? (hasColor 0) "1 2 3 0\n")
  (check-equal? (hasColor 1) "4 5 6 0\n")
  (check-equal? (hasColor 2) "7 8 9 0\n")
  (check-equal? (hasColor 3) "10 11 12 0\n")
  (check-equal? (hasColor 4) "13 14 15 0\n")
  (check-equal? (hasColor 5) "16 17 18 0\n")
)
(define q3_score (- 6 (run-tests test_hasColor 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 4 --------------------------------
;---------------------------------------------------------------------

;A node cannot have two colors.
;The previous lines only checked that at least one color was true.
;We also need to say that AT MOST one color is true.

;We can use 3 or statements to cover this.
;not (Node x is Red) OR not (Node x is Green)
;not (Node x is Red) OR not (Node x is Blue)
;not (Node x is Green) OR not (Node x is Blue)

;If a node is set to two colors, one of these statements will be false.

;In DiMACs to say "Node 0 is at most one color" we would write.
; -1 -2 0 [Red or Green]
; -1 -3 0 [Red or Blue]
; -2 -3 0 [Blue or Green]
;Remember in DiMACs negation means not.

;atMostOneColor returns the DiMACS to check that node x
;does not have two colors.
;Input: integer x >= 0
;Output: DiMACs representing the node having at most 1 color
(define (atMostOneColor n)
  (string-append "-" (number->string (nodeIsRed n)) " -" (number->string (nodeIsGreen n)) " 0\n-"
                 (number->string (nodeIsRed n)) " -" (number->string (nodeIsBlue n)) " 0\n-"
                 (number->string (nodeIsGreen n)) " -" (number->string (nodeIsBlue n)) " 0\n" ))

;Test Bed
(display "Question 4 Node Has At Most 1 Color (10 points) \n")
(define-test-suite test_atMostOneColor
  (check-equal? (atMostOneColor 0) "-1 -2 0\n-1 -3 0\n-2 -3 0\n")
  (check-equal? (atMostOneColor 1) "-4 -5 0\n-4 -6 0\n-5 -6 0\n")
  (check-equal? (atMostOneColor 2) "-7 -8 0\n-7 -9 0\n-8 -9 0\n")
  (check-equal? (atMostOneColor 3) "-10 -11 0\n-10 -12 0\n-11 -12 0\n")
  (check-equal? (atMostOneColor 4) "-13 -14 0\n-13 -15 0\n-14 -15 0\n")
  (check-equal? (atMostOneColor 5) "-16 -17 0\n-16 -18 0\n-17 -18 0\n")
  (check-equal? (atMostOneColor 6) "-19 -20 0\n-19 -21 0\n-20 -21 0\n")
  (check-equal? (atMostOneColor 7) "-22 -23 0\n-22 -24 0\n-23 -24 0\n")
  (check-equal? (atMostOneColor 8) "-25 -26 0\n-25 -27 0\n-26 -27 0\n")
  (check-equal? (atMostOneColor 9) "-28 -29 0\n-28 -30 0\n-29 -30 0\n")
)
(define q4_score (- 10 (run-tests test_atMostOneColor 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 5 --------------------------------
;---------------------------------------------------------------------

;We put together all the tools we build above.
;Give the full DiMACS to make sure Node x has exactly 1 color

;For node 1 we would make
;4 5 6 0 [Has a color]
;-4 -5 0 [Not red and green at once]
;-4 -6 0 [Not red and blue at once]
;-5 -6 0 [not green and blue at once]

;nodeProperties gives all the DiMACs
;to make sure node x has exactly one of the three colors
;Input: Integer x >= 0
;Ouput: The DiMACs for node x has exactly one of the three colors
(define (nodeProperties x)
  (string-append (hasColor x) (atMostOneColor x))
)

;Test Bed
(display "Question 5 All Node Properties (10 points) \n")
(define-test-suite test_nodeProperties
  (check-equal? (nodeProperties 0) "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n")
  (check-equal? (nodeProperties 1) "4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n")
  (check-equal? (nodeProperties 2) "7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n")
  (check-equal? (nodeProperties 3) "10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n")
  (check-equal? (nodeProperties 4) "13 14 15 0\n-13 -14 0\n-13 -15 0\n-14 -15 0\n")
  (check-equal? (nodeProperties 5) "16 17 18 0\n-16 -17 0\n-16 -18 0\n-17 -18 0\n")
  (check-equal? (nodeProperties 6) "19 20 21 0\n-19 -20 0\n-19 -21 0\n-20 -21 0\n")
  (check-equal? (nodeProperties 7) "22 23 24 0\n-22 -23 0\n-22 -24 0\n-23 -24 0\n")
  (check-equal? (nodeProperties 8) "25 26 27 0\n-25 -26 0\n-25 -27 0\n-26 -27 0\n")
  (check-equal? (nodeProperties 9) "28 29 30 0\n-28 -29 0\n-28 -30 0\n-29 -30 0\n")
)
(define q5_score (- 10 (run-tests test_nodeProperties 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 6 --------------------------------
;---------------------------------------------------------------------

;If we have 3 nodes, we just need to do the above repeatedly.
;Generate the DiMACs for all the nodes.

;For example, if we have 3 nodes, the dimacs is
;1 2 3 0
;-1 -2 0
;-1 -3 0
;-2 -3 0
;4 5 6 0
;-4 -5 0
;-4 -6 0
;-5 -6 0
;7 8 9 0
;-7 -8 0
;-7 -9 0
;-8 -9 0

;allNodes x y generates the DiMACs for Nodes from x to y
;(allNodes 0 0) - just node 0
;(allNodes 1 3) - handles node 1, node 2, node 3
;Input: two integer x>=0, y>=0
;Output: "" if y < x
;otherwise full dimacs for node properties of nodes x to y
(define (allNodes x y)
  (if (< y x) ""
          (string-append (nodeProperties x) (allNodes (+ x 1) y))
))
;Test Bed
(display "Question 6 All Nodes Properties (10 points) \n")
(define-test-suite test_allNodes
  (check-equal? (allNodes 0 0) "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n")
  (check-equal? (allNodes 1 1) "4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n")
  (check-equal? (allNodes 2 2) "7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n")
  (check-equal? (allNodes 0 1) "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n")
  (check-equal? (allNodes 1 2) "4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n")
  (check-equal? (allNodes 3 3) "10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n")
  (check-equal? (allNodes 2 3) "7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n")
  (check-equal? (allNodes 1 3) "4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n")
  (check-equal? (allNodes 0 2) "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n")
  (check-equal? (allNodes 0 3) "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n")
)
(define q6_score (- 10 (run-tests test_allNodes 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 7 --------------------------------
;---------------------------------------------------------------------

;If all the nodes where disconnected, this problem would be very easy.
;What makes the 3-Color Problem hard it that edges connect nodes.
;If two nodes are connected, then they cannot be the same color.
;This is where the need to a SAT solver or another approach comes in.

;Given an edge as a list with two numbers (1 2)
;We cannot give node 1 and node 2 the same color.
;We need to add the following to the DiMACs.
;not (Node 1 is red) or not (Node 2 is red)
;not (Node 1 is green) or not (Node 2 is green)
;not (Node 1 is blue) or not (Node 2 is blue)

;In Dimacs this would be
;-4 -7 0 [Both cannot be red]
;-5 -8 0 [Both cannot be green]
;-6 -9 0 [Both cannot be blue]

;edgeColors takes a list of two elements
;it returns the DiMACs that they cannot be the same color
;Input: a list with exactly two integers (x y) such that x>=0 and y>=0
(define (edgeColors e)
      (string-append "-" (number->string(nodeIsRed (first e))) " -" (number->string (nodeIsRed (first (rest e))))
                     " 0\n-" (number->string(nodeIsGreen (first e))) " -" (number->string (nodeIsGreen (first (rest e))))
                     " 0\n-" (number->string(nodeIsBlue (first e))) " -" (number->string (nodeIsBlue (first (rest e)))) " 0\n"))
;Test Bed
(display "Question 7 A Single Edge Property (10 points) \n")
(define-test-suite test_edgeColors
  (check-equal? (edgeColors '(0 1)) "-1 -4 0\n-2 -5 0\n-3 -6 0\n")
  (check-equal? (edgeColors '(1 0)) "-4 -1 0\n-5 -2 0\n-6 -3 0\n")
  (check-equal? (edgeColors '(1 2)) "-4 -7 0\n-5 -8 0\n-6 -9 0\n")
  (check-equal? (edgeColors '(2 1)) "-7 -4 0\n-8 -5 0\n-9 -6 0\n")
  (check-equal? (edgeColors '(0 2)) "-1 -7 0\n-2 -8 0\n-3 -9 0\n")
  (check-equal? (edgeColors '(2 0)) "-7 -1 0\n-8 -2 0\n-9 -3 0\n")
  (check-equal? (edgeColors '(0 3)) "-1 -10 0\n-2 -11 0\n-3 -12 0\n")
  (check-equal? (edgeColors '(3 0)) "-10 -1 0\n-11 -2 0\n-12 -3 0\n")
  (check-equal? (edgeColors '(1 3)) "-4 -10 0\n-5 -11 0\n-6 -12 0\n")
  (check-equal? (edgeColors '(3 2)) "-10 -7 0\n-11 -8 0\n-12 -9 0\n")
)
(define q7_score (- 10 (run-tests test_edgeColors 'verbose)))

;---------------------------------------------------------------------
;--------------------------Question 8 --------------------------------
;---------------------------------------------------------------------

;We won't have just one edge.
;Given a list of edges, makes DiMACs rules for them all.

;For example edges '((1 2) (0 1))
;would make
;-4 -7 0 [1 and 2 aren't both red]
;-5 -8 0 [1 and 2 aren't both green]
;-6 -9 0 [1 and 2 aren't both blue]
;-1 -4 0 [0 and 1 aren't both red]
;-2 -5 0 [0 and 1 aren't both green]
;-3 -6 0 [0 and 1 aren't both blue]

;allEdges takes a list of edges and generates DiMACs for them all
;Input: A list of edges (x y) x>=0 and y>=0
;Output: DiMACs for all edges in one string
(define (allEdges edgeList)
  (if (null? edgeList) ""
      (string-append (edgeColors (first edgeList)) (allEdges (rest edgeList)))
      
))
;Test Bed
(display "Question 8 DiMACs a list of edges (15 points) \n")
(define-test-suite test_allEdges
  (check-equal? (allEdges '((0 1))) "-1 -4 0\n-2 -5 0\n-3 -6 0\n")
  (check-equal? (allEdges '((0 1) (1 2))) "-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n")
  (check-equal? (allEdges '((2 1) (1 2))) "-7 -4 0\n-8 -5 0\n-9 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n")
  (check-equal? (allEdges '((0 1) (2 3))) "-1 -4 0\n-2 -5 0\n-3 -6 0\n-7 -10 0\n-8 -11 0\n-9 -12 0\n")
  (check-equal? (allEdges '((2 3) (5 6))) "-7 -10 0\n-8 -11 0\n-9 -12 0\n-16 -19 0\n-17 -20 0\n-18 -21 0\n")
 
)
(define q8_score (- 15 (* 3 (run-tests test_allEdges 'verbose))))

;---------------------------------------------------------------------
;--------------------------Question 9 --------------------------------
;---------------------------------------------------------------------

;We want to find the three coloring of a graph.
;Given a graph as input, give the full DiMACs for the expression

;A graph is a list with two items
;The first is the number of nodes
;If the number of nodes is 6, that means the nodes have names 0,1,2,3,4,5
;The second element is a list of edges.

;Example Graph:
;(3 ((0 1) (1 2) (2 0)))
;The graph has three nodes
;There is an edge from node 0 to node 1
;There is an edge from node 1 to node 2
;There is an edge from node 2 to node 0

;Use everything you have built before to return one string
;with the full DiMACs for the graph.
(define (threeColorGraph G) 
      (string-append (allNodes 0 (- (first G) 1)) (allEdges (first (rest G))))
)


;These examples are very long. We use constant to define them
(define Graph1 '(3 ((0 1) (1 2) (2 0))) )
(define Graph2 '(7
                 (
                  (0 1) (1 2) (2 0)
                  (2 3) (2 4) (3 4)
                  (2 5) (2 6) (5 6)
                 )) )
(define Graph3 '(10
                 (
                  (0 1) (1 2) (2 0)
                  (2 3) (2 4) (3 4)
                  (2 5) (2 6) (5 6)
                  (4 7) (5 8)
                  (7 8) (7 9) (8 9)
                  (9 2) (9 1)
                 )) )
;Answer for testing
(define AnswerG1 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n")
(define AnswerG2 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n13 14 15 0\n-13 -14 0\n-13 -15 0\n-14 -15 0\n16 17 18 0\n-16 -17 0\n-16 -18 0\n-17 -18 0\n19 20 21 0\n-19 -20 0\n-19 -21 0\n-20 -21 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n-7 -10 0\n-8 -11 0\n-9 -12 0\n-7 -13 0\n-8 -14 0\n-9 -15 0\n-10 -13 0\n-11 -14 0\n-12 -15 0\n-7 -16 0\n-8 -17 0\n-9 -18 0\n-7 -19 0\n-8 -20 0\n-9 -21 0\n-16 -19 0\n-17 -20 0\n-18 -21 0\n")
(define AnswerG3 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n13 14 15 0\n-13 -14 0\n-13 -15 0\n-14 -15 0\n16 17 18 0\n-16 -17 0\n-16 -18 0\n-17 -18 0\n19 20 21 0\n-19 -20 0\n-19 -21 0\n-20 -21 0\n22 23 24 0\n-22 -23 0\n-22 -24 0\n-23 -24 0\n25 26 27 0\n-25 -26 0\n-25 -27 0\n-26 -27 0\n28 29 30 0\n-28 -29 0\n-28 -30 0\n-29 -30 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n-7 -10 0\n-8 -11 0\n-9 -12 0\n-7 -13 0\n-8 -14 0\n-9 -15 0\n-10 -13 0\n-11 -14 0\n-12 -15 0\n-7 -16 0\n-8 -17 0\n-9 -18 0\n-7 -19 0\n-8 -20 0\n-9 -21 0\n-16 -19 0\n-17 -20 0\n-18 -21 0\n-13 -22 0\n-14 -23 0\n-15 -24 0\n-16 -25 0\n-17 -26 0\n-18 -27 0\n-22 -25 0\n-23 -26 0\n-24 -27 0\n-22 -28 0\n-23 -29 0\n-24 -30 0\n-25 -28 0\n-26 -29 0\n-27 -30 0\n-28 -7 0\n-29 -8 0\n-30 -9 0\n-28 -4 0\n-29 -5 0\n-30 -6 0\n")

;Test Bed
(display "Question 9 Three Color Problem (15 points) \n")
(define-test-suite test_threeColorGraph
  (check-equal? (threeColorGraph Graph1) AnswerG1)
  (check-equal? (threeColorGraph Graph2) AnswerG2)
  (check-equal? (threeColorGraph Graph3) AnswerG3)
)
(define q9_score (- 15 (* 5 (run-tests test_threeColorGraph 'verbose))))

;---------------------------------------------------------------------
;--------------------------Question 10 -------------------------------
;---------------------------------------------------------------------

;Save DiMACS to File for a Graph
;input-contract: Graph G and  (string? fname)
;output-contract: no result, writes file as side effect
(define (saveToFile G fname)
  (with-output-to-file
    fname ;File to save into
    ;Text to Write to File
    (lambda () (display (threeColorGraph G)))
    ;Overwrite File if it exists
    #:exists 'replace
  )
)

;Uncomment the below lines to save your results to a file.
;(saveToFile Graph1 "graph1_dimacs.txt")
;(saveToFile Graph2 "graph2_dimacs.txt")
;(saveToFile Graph3 "graph3_dimacs.txt")

;Put the code you generate into https://msoos.github.io/cryptominisat_web/
;Answer the following questions in the comments
;What is the result for Graph 1 from minisat? (2pts)
;v 1 -2 -3 -4 5 -6 -7 -8 9 0
;What is the result for Graph 2 from minisat? (4pts)
;v -1 2 -3 -4 -5 6 7 -8 -9 -10 11 -12 -13 -14 15 -16 17 -18 -19 -20 21 0
;What is the result for Graph 3 from minisat? (4pts)
;v -1 2 -3 4 -5 -6 -7 -8 9 10 -11 -12 -13 14 -15 16 -17 -18 -19 20 -21 22 -23 -24 25 -26 27 -28 29 -30 0

(define q10_score 0);Hand Graded

;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;;;;;;;;;;;;;;Grade Summary;;;;;;;;;;;;;;;;;;;;;;;
(display "------Grade Summary------\n")
(display "Q1 Scored: ")
(display q1_score)
(display "/5\n")
(display "Q2 Scored: ")
(display q2_score)
(display "/9\n")
(display "Q3 Scored: ")
(display q3_score)
(display "/10\n")
(display "Q4 Scored: ")
(display q4_score)
(display "/10\n")
(display "Q5 Scored: ")
(display q5_score)
(display "/10\n")
(display "Q6 Scored: ")
(display q6_score)
(display "/10\n")
(display "Q7 Scored: ")
(display q7_score)
(display "/10\n")
(display "Q8 Scored: ")
(display q8_score)
(display "/15\n")
(display "Q9 Scored: ")
(display q9_score)
(display "/15\n")
(display "Q10 Scored: ")
(display q10_score)
(display "/10\n")


(define grand_total (+ q1_score q2_score q3_score q4_score q5_score q6_score q7_score q8_score q9_score q10_score))
(display "\n")
(display "Total: ")
(display grand_total)
(display "/100\n")