#lang racket

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


#| 


;Test Bed
(display "Question 1 String Sequence (5 points)\n")
(define-test-suite test_stringSequence
  (check-equal? (stringSequence -2) "")
  (check-equal? (stringSequence 0) "0 ")
  (check-equal? (stringSequence 1) "1 0 ")
  (check-equal? (stringSequence 5) "5 4 3 2 1 0 ")
  (check-equal? (stringSequence 10) "10 9 8 7 6 5 4 3 2 1 0 ")
)

|#

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


#|


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

|#

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
  
   


; (string-append (number->string (+ 3 (nodeIsRed x)) " " (number->string (+ 3 (nodeIsGreen x))) " " (number->string (+ 3 (nodeIsBlue x))) " 0\n")) #f ))  
     

;(hasColor 0) 
;(hasColor 1)      
;(hasColor 2)
;(hasColor 3)
;(hasColor 4) 


#|

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

|#

;Question 5 

(define (atMostOneColor n)
  (string-append "-" (number->string (nodeIsRed n)) " -" (number->string (nodeIsGreen n)) " 0\n-"
                 (number->string (nodeIsRed n)) " -" (number->string (nodeIsBlue n)) " 0\n-"
                 (number->string (nodeIsGreen n)) " -" (number->string (nodeIsBlue n)) " 0\n" ))
#|      
      
(atMostOneColor 0)
(atMostOneColor 1)
(atMostOneColor 2)

|# 

;Question 5 

(define (nodeProperties x)
  (string-append (hasColor x) (atMostOneColor x))
)


;Question 6

(define (allNodes x y)
  (if (< y x) ""
          (string-append (nodeProperties x) (allNodes (+ x 1) y))
))




;Question 7

(define (edgeColors e)
      (string-append "-" (number->string(nodeIsRed (first e))) " -" (number->string (nodeIsRed (first (rest e))))
                     " 0\n-" (number->string(nodeIsGreen (first e))) " -" (number->string (nodeIsGreen (first (rest e))))
                     " 0\n-" (number->string(nodeIsBlue (first e))) " -" (number->string (nodeIsBlue (first (rest e)))) " 0\n"))
                   

; (edgeColors '(0 1))



;Question 8

(define (allEdges edgeList)
  (if (null? edgeList) ""
      (string-append (edgeColors (first edgeList)) (allEdges (rest edgeList)))
      
))
 
(allEdges '((0 1)))
(allEdges '((0 1) (1 2)))


;Question 9 


(first '(3 ((0 1) (1 2) (2 0))))

(define (threeColorGraph G) 
      (string-append (allNodes 0 (- (first G) 1)) (allEdges (first (rest G)))))


(threeColorGraph '(3 ((0 1) (1 2) (2 0))))




#| 
                      
(define AnswerG1 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n")
(define AnswerG2 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n13 14 15 0\n-13 -14 0\n-13 -15 0\n-14 -15 0\n16 17 18 0\n-16 -17 0\n-16 -18 0\n-17 -18 0\n19 20 21 0\n-19 -20 0\n-19 -21 0\n-20 -21 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n-7 -10 0\n-8 -11 0\n-9 -12 0\n-7 -13 0\n-8 -14 0\n-9 -15 0\n-10 -13 0\n-11 -14 0\n-12 -15 0\n-7 -16 0\n-8 -17 0\n-9 -18 0\n-7 -19 0\n-8 -20 0\n-9 -21 0\n-16 -19 0\n-17 -20 0\n-18 -21 0\n")
(define AnswerG3 "1 2 3 0\n-1 -2 0\n-1 -3 0\n-2 -3 0\n4 5 6 0\n-4 -5 0\n-4 -6 0\n-5 -6 0\n7 8 9 0\n-7 -8 0\n-7 -9 0\n-8 -9 0\n10 11 12 0\n-10 -11 0\n-10 -12 0\n-11 -12 0\n13 14 15 0\n-13 -14 0\n-13 -15 0\n-14 -15 0\n16 17 18 0\n-16 -17 0\n-16 -18 0\n-17 -18 0\n19 20 21 0\n-19 -20 0\n-19 -21 0\n-20 -21 0\n22 23 24 0\n-22 -23 0\n-22 -24 0\n-23 -24 0\n25 26 27 0\n-25 -26 0\n-25 -27 0\n-26 -27 0\n28 29 30 0\n-28 -29 0\n-28 -30 0\n-29 -30 0\n-1 -4 0\n-2 -5 0\n-3 -6 0\n-4 -7 0\n-5 -8 0\n-6 -9 0\n-7 -1 0\n-8 -2 0\n-9 -3 0\n-7 -10 0\n-8 -11 0\n-9 -12 0\n-7 -13 0\n-8 -14 0\n-9 -15 0\n-10 -13 0\n-11 -14 0\n-12 -15 0\n-7 -16 0\n-8 -17 0\n-9 -18 0\n-7 -19 0\n-8 -20 0\n-9 -21 0\n-16 -19 0\n-17 -20 0\n-18 -21 0\n-13 -22 0\n-14 -23 0\n-15 -24 0\n-16 -25 0\n-17 -26 0\n-18 -27 0\n-22 -25 0\n-23 -26 0\n-24 -27 0\n-22 -28 0\n-23 -29 0\n-24 -30 0\n-25 -28 0\n-26 -29 0\n-27 -30 0\n-28 -7 0\n-29 -8 0\n-30 -9 0\n-28 -4 0\n-29 -5 0\n-30 -6 0\n")

|# 



