#lang racket
(require rackunit)
(require rackunit/text-ui)

;CS 270
;Homework 7
;Professor B. Char, M. Boady,  J. Johnson, and G. Long

;Important Rules:
;1.) You may not use loop constructs like while/for/sum. If used, your answer will get a zero.
;2.) If the instructions state something must be recursive, you will recieve a zero if it is not recursive.
;    Recursive helper functions are allowed (the main function not being recursive).
;3.) You may not use the set! command. If used, your answer will get a zero.
;4.) Using If/Cond to explicitly pass tests instead of following the instructions
;    will always result in a zero for that question.

;Each of the below questions has two parts.
;First, you will be asked to write a Racket function to solve a problem.
;Secondly, you will be asked to prove by induction that your
;Racket code has some property.


;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;Question 1a (10 points)
;Write a recursive function to compute
;the sum( 6*x^2 , x = 1..n) for a given n
;You must write a recursive function.
;If you use any iterative commands (for/loop/sum/etc you will receive a 0)

; Computes sum( 6*x^2 , x = 1..n)
; Input:  n an integer >= 1
; Output: an integer, the result of the summation
(define (spec_sum n)
  
  (if (= n 0) 0  
      (+ (* 6 (expt n 2)) (spec_sum (- n 1)))))

;Test Bed
(display "Question 1a spec_sum Tests (5 points)\n")
(define-test-suite test_spec_sum
  (check-equal? (spec_sum 1) 6)
  (check-equal? (spec_sum 2) 30)
  (check-equal? (spec_sum 3) 84)
  (check-equal? (spec_sum 4) 180)
  (check-equal? (spec_sum 5) 330)
  (check-equal? (spec_sum 6) 546)
  (check-equal? (spec_sum 7) 840)
  (check-equal? (spec_sum 8) 1224)
  (check-equal? (spec_sum 9) 1710)
  (check-equal? (spec_sum 10) 2310)
)
(define q1a_score (- 10 (run-tests test_spec_sum 'verbose)))

;Question 1b (10 points)
;Prove by induction that
;for all integers n >= 1 -> (spec_sum n) = 2n^3+3n^2+n

;Give your proof below in comments

#|

Base Case

1. (spec_sum 0) ; Premise

2. (if (= 0 0) 0 (+ (* 6 (expt n 2)) (spec_sum (- n 1))))  ; Apply Definition of spec_sum

3. (if #t 0 (+ (* 6 (expt n 2)) (spec_sum (- n 1))))  ; Evaluate Equals

4. 0  ; Evaluate if

The return value is 0 since the value passed to the function was 0.


Inductive Hypothesis

Let us assume that there exists a set of lists we call Q.
Lists in the set Q will contain any amount of elements greater than or equal to 1 inclusive.
For every list L in this function Q, the function (spec_sum n) will return sum of 6*n^2 where n is
all of the elements in L.


Inductive Case

We will show that under the IH we will have (spec_sum n) = 2n^3+3n^2+n

1. (spec_sum (+ n 1))  ; Premise

2. (if (= (+ n 1) 0) 0 (+ (* 6 (expt (+ n 1) 2)) (spec_sum (- (+ n 1) 1))))  ; Apply Definition of spec_sum

3. (if #f 0 (+ (* 6 (expt (+ n 1) 2)) (spec_sum (- (+ n 1) 1)))  ; Evaluate Equals

4. (+ (* 6 (expt (+ n 1) 2)) (spec_sum (- (+ n 1) 1)))  ; Evaluate if

5. (+ (* 6 (expt (+ n 1) 2)) (spec_sum ( n ))  ; algebraic simplification 

6. (* 6 (expt (+ n 1) 2)) + (2n^3 + 3n^2 + n))  ; By IH

7. 6(n+1)^2 + (2n^3 + 3n^2 + n))    ; Algebraic Simplification

8. 6(n^2 + 2n + 1) + (2n^3 + 3n^2 + n))  ; Algebraic Simplification

9. 6n^2 + 12n + 6 + (2n^3 + 3n^2 + n)) ; Algebraic Simplification

10. 2(n+1)^3 + 3(n+1)^2 + n  ; By IH 


|#


;Question 2 (10 points)
; Write a recursive function evenzeros to check if a list of integers
; contains an even number of zeros.
; Don't forget the base case and the necessary recursion. 

; Check if a list contains an even number of zeros
; Input:  L is a list of integers.
; Output: a boolean value which is true when an even number of the elements
;          in L is equal to zero and false otherwise.
; 0 is even, so the Null list should return true

(define (evenzeros X)
  (if (null? X) #t
      (if (equal? (first X) 0) (not (evenzeros (rest X)))
          (evenzeros (rest X)))))

;Test Bed
(display "Question 2a evenzeros Tests (10 points)\n")
(define-test-suite test_even_zeros
  (check-equal? (evenzeros '()) #t)
  (check-equal? (evenzeros '(1)) #t)
  (check-equal? (evenzeros '(0)) #f)
  (check-equal? (evenzeros '(0 0)) #t)
  (check-equal? (evenzeros '(7 0)) #f)
  (check-equal? (evenzeros '(1 -2)) #t)
  (check-equal? (evenzeros '(0 0 1)) #t)
  (check-equal? (evenzeros '(4 0 1)) #f)
  (check-equal? (evenzeros '(1 0 8)) #f)
  (check-equal? (evenzeros '(0 11 0 -9)) #t)
)
(define q2a_score (- 10 (run-tests test_even_zeros 'verbose)))
;Question 2b (10 points)
;Prove by induction, algebra, and equational reasoning that
;If L contains an even number of zeros then (equal? (evenzeros L) #t)
;If L contains an odd number of zeros then (equal? (evenzeros L) #f)
;Hint:
;Assume two different list E with an even number and O with an odd number
;You need 4 cases (cons 0 E), (cons x E), (cons 0 O), (cons x O)
;Where, x!=0, E is a list with an even number of zeros and O is a list
;with an odd number of zeros.

#|

Base Case

1. (evenzeros 0) ; Premise 

2. (if (equal? (first 0) 0) (not (evenzeros (rest X))) (evenzeros (rest X))))  ; Apply Definition of Evenzeros

3. (if #t 0 (not (evenzeros (rest X))) (evenzeros (rest X)))  ; Evaluate equal?

4. 0  ; Evaluate if


Inductive Hypothesis

Let us assume that there exists a set of lists we call Q.
Lists in this set Q will have anywhere from 0 to K elements inclusive.
For every list L in this Q, If L contains an even number of zeros then (equal? (evenzeros L) #t)
and If L contains an odd number of zeros then (equal? (evenzeros L) #f)


Inductive Case #1

If L contains an even number of zeros then (equal? (evenzeros L) #t)

1. (evenzeros (cons 0 E))  ; Premise

2. (if (null? (cons 0 E)) #t (if (equal? (first (cons 0 E)) 0) (not (evenzeros (rest (cons 0 E)))) (evenzeros (rest (cons 0 E)))))) ; Apply Definition of evenzeros

3. (if #f #t (if (equal? (first (cons 0 E)) 0) (not (evenzeros (rest (cons 0 E)))) (evenzeros (rest (cons 0 E)))))  ; Evaluate null?

4. (if (equal? (first (cons 0 E)) 0) (not (evenzeros (rest (cons 0 E)))) (evenzeros (rest (cons 0 E)))))  ; Evaluate if

5. (if #t (not (evenzeros (rest (cons 0 E)))) (evenzeros (rest (cons 0 E)))))  ; Evaluate Equal?

6. (not (evenzeros (rest (cons 0 E))))  ; Evaluate if

7. (not (evenzeros E)) ; Evaluate Rest

8. (not #t) ; By IH

9. #f  ; Evaluate not

The function evaluates to false since we passed a list with an even number of zeros and added 1 more zero, which made
it odd and shows that our IH holds


Inductive Case #2

If L contains an even number of zeros then (equal? (evenzeros L) #t) ; x!=0 
 
1. (evenzeros (cons x E)) ; Premise 

2. (if (null? (cons x E)) #t (if (equal? (first (cons x E)) 0) (not (evenzeros (rest (cons x E)))) (evenzeros (rest (cons x E))))))  ; Apply Definition of evenzeros

3. (if #f #t (if (equal? (first (cons x E)) 0) (not (evenzeros (rest (cons x E)))) (evenzeros (rest (cons x E))))))  ; Evaluate null?

4. (if (equal? (first (cons x E)) 0) (not (evenzeros (rest (cons x E)))) (evenzeros (rest (cons x E))))))  ; Evaluate if 

5. (if #f (not (evenzeros (rest (cons x E)))) (evenzeros (rest (cons x E))))))  ; Evaluate equal? 

6. (evenzeros (rest (cons x E)))  ; Evaluate if

7. (evenzeros E)) ; Evaluate rest

8. #t  ; By IH


Inductive Case #3

If L contains an odd number of zeros then (equal? (evenzeros L) #f) 

1. (evenzeros (cons 0 O)) ; Premise

2. (if (null? (cons 0 O)) #t (if (equal? (first (cons 0 O)) 0) (not (evenzeros (rest (cons 0 O)))) (evenzeros (rest (cons 0 O))))))  ; Apply Definition of evenzeros

3. (if #f #t (if (equal? (first (cons 0 O)) 0) (not (evenzeros (rest (cons 0 O)))) (evenzeros (rest (cons 0 O))))))  ; Evaluate null?

4. (if (equal? (first (cons 0 O)) 0) (not (evenzeros (rest (cons 0 O)))) (evenzeros (rest (cons 0 O))))))  ; Evaluate if

5. (if #t (not (evenzeros (rest (cons 0 O)))) (evenzeros (rest (cons 0 O))))))  ; Evaluate equal? 

6. (not (evenzeros (rest (cons 0 O)))) ; Evaluate if

7. (not (evenzeros O)) ; Evaluate rest

8. (not #f) ; By IH

9. #t  ; Evaluate not

The function evaluates to true, first showing that a list with an odd number of zeros is
false and that an odd list with an added zero is true.


Inductive Case #4

If L contains an odd number of zeros then (equal? (evenzeros L) #f)

1. (evenzeros (cons x O)) ; Premise

2. (if (null? (cons x O)) #t (if (equal? (first (cons x O)) 0) (not (evenzeros (rest (cons x O)))) (evenzeros (rest (cons x O))))))  ; Apply Definition of evenzeros

3. (if #f #t (if (equal? (first (cons x O)) 0) (not (evenzeros (rest (cons x O)))) (evenzeros (rest (cons x O))))))  ; Evaluate null?

4. (if (equal? (first (cons x O)) 0) (not (evenzeros (rest (cons x O)))) (evenzeros (rest (cons x O))))))  ; Evaluate if

5. (if #f (not (evenzeros (rest (cons x O)))) (evenzeros (rest (cons x O))))))  ; Evaluate equal?

6. (evenzeros (rest (cons x O)))))) ; Evaluate if

7. (evenzeros O) ; Evaluate rest

8. #f ; By IH

The function evaluates to false, showing that a list with an odd number of zeros
will evaluate to false. 


|# 


;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;Q3a (10 Points)
;Write a recursive function duplicate that takes every element in a list
;and makes a second copy of the item.
;For example if we started with (1 2 3)
;then the duplicated list would be (1 1 2 2 3 3)


; Duplicates Elements in a list
; Input:  X a list
; Output: A new list with two copies of even value in X

(define (duplicate X)
  (if (null? X) '()
      (cons (first X )(cons (first X) (duplicate (rest X)))))
)

(display "Question 3a duplicate Tests (10 points)\n")
(define-test-suite test_duplicate
  (check-equal? (duplicate '()) '())
  (check-equal? (duplicate '(1)) '(1 1))
  (check-equal? (duplicate '(1 2)) '(1 1 2 2))
  (check-equal? (duplicate '(4 6)) '(4 4 6 6))
  (check-equal? (duplicate '((1) (2 3))) '((1) (1) (2 3) (2 3)))
  (check-equal? (duplicate '(4 5 6)) '(4 4 5 5 6 6))
  (check-equal? (duplicate '(7 8 9 10)) '(7 7 8 8 9 9 10 10))
  (check-equal? (duplicate '(1 2 3 4 5)) '(1 1 2 2 3 3 4 4 5 5))
  (check-equal? (duplicate '(9 9 9)) '(9 9 9 9 9 9))
  (check-equal? (duplicate '(1 4 5 6 4 3 4 5))
                '(1 1 4 4 5 5 6 6 4 4 3 3 4 4 5 5))
)
(define q3a_score (- 10 (run-tests test_duplicate 'verbose)))

;Q3b (10 Points)
;Prove By Induction
;(length (duplicate L)) = 2x where x is the length of list L
;You may use the following properties of length
;Length Property 1: (length '()) = 0 
;Length Property 2: If a is an object and B is a list
;(length (cons a B)) = (+ 1 (length B))
;You may Justify lines by saying [By Length Property 1]
;Hint: An equals can be used both ways.


#|

Base Case

1. (duplicate '())  ; Premise 

2. (if (null? '()) '() (cons (first X )(cons (first X) (duplicate (rest X))))) ; Apply Definition of Duplicate

3. (if #t '() (cons (first X )(cons (first X) (duplicate (rest X))))) ; Evaluate null?

4. '()  ; Evaluate if

The return value is the null list since double of a list with length zero is zero or the null list. 


Inductive Case

Let us assume that there exists a set of lists we call Q.
Lists in the set Q will have anywhere from 1 to K elements.
For every list L in this Q, we have (length (duplicate L)) = 2x, where x
is the number of elements in the List L.


Inductive Hypothesis

We will show that the under the IH, we will have (length (duplicate L)) = 2x.

1. (length (duplicate (cons a L))  ; Premise

2. (length (if (null? (cons a L)) '() (cons (first (cons a L) )(cons (first (cons a L)) (duplicate (rest (cons a L))))))) ; Apply Definition of Duplicate

3. (length (if #f '() (cons (first (cons a L) )(cons (first (cons a L)) (duplicate (rest (cons a L)))))))  ; Evaluate null?

4. (length (cons (first (cons a L)) (cons (first (cons a L)) (duplicate (rest (cons a L)))))) ; Evaluate if

5. (length (cons (first (cons a L)) (cons a) (duplicate (rest (cons a L)))))) ; Evaluate first

6. (length (cons (cons a) (cons a) (duplicate (rest (cons a L))))) ; Evalaute first

7. (length (cons (cons a) (cons a) (duplicate L))) ; Evaluate Rest

9. (length (cons 2a (length (duplicate L)))) ; Algebraic Simplification of cons

10. (+ 2 (length (duplicate L))) ; Length Property Two

11. (2 + (length (dulicate L))) ; Alegbraic Simplification of Plus

12. 2 + 2x  ; By IH


We have shown that under the IH, duplicate L becomes 2x + 2,
where x is the number of elements in the list L. 

|#



;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;Question 4a (10pts)
;Write a recursive function (cut_end L) that removes the last element from the list

; Removes the last element in a list
; Input:  X non-empty a list
; Output: A new list with the last element removed
(define (cut_end L)
  (if (<= (length L) 1) '()
      (cons (first L) (cut_end (rest L)))
))

(display "Question 4a cut_end Tests (10 points)\n")
(define-test-suite test_cut_end
  (check-equal? (cut_end '(1)) '())
  (check-equal? (cut_end '(1 2)) '(1))
  (check-equal? (cut_end '(3 4 5)) '(3 4))
  (check-equal? (cut_end '( (1) (2) (3) )) '( (1) (2) ))
  (check-equal? (cut_end '((1 2 3 4))) '())
  (check-equal? (cut_end '((1 2) (3 4))) '((1 2)))
  (check-equal? (cut_end '(9 9 8)) '(9 9))
  (check-equal? (cut_end '(AND A B)) '(AND A))
  (check-equal? (cut_end '(NOT X)) '(NOT))
)
(define q4a_score (- 10 (run-tests test_cut_end 'verbose)))


;Question 4b
;Prove by Induction that (length (cut_end L)) = x-1, where x is the output of (length L)
;for all L where (length L) >= 1
;You may use the properties of length from Question 3

#|

Base Case

1. (cut_end '())  ; Premise

2. (if (<= (length '()) 1) '() (cons (first '()) (cut_end (rest'()))))  ; Apply Definition of cut_end

3. (if #t '() (cons (first '()) (cut_end (rest '()))))  ; Evaluate equal?

4. '()  ; Evaluate if 


Inductive Hypothesis

Let us assume that there exists a set of lits we call Q.
Lists in the set Q will have anywhere from 1 to K elements inclusive.
For every list L in this Q, we have (length (cut_end L)) = x-1.


1. (length (cut_end (cons a L)))

2. (length (if (<= (length (cons a L) 1)) '() (cons (first (cons a L)) (cut_end (rest (cons a L))))) ; Apply Definition of cut_end 

3. (length (if #f '() (cons (first (cons a L)) (cut_end (rest (cons a L))))) ; Evaluate <=

4. (length (cons (first (cons a L)) (cut_end (rest (cons a L)))))) ; Evaluate if

5. (length (cons a (cut_end (rest (cons a L)))))  ; Evaluate first

6. (length (cons a (cut_end L))))  ; Evaluate rest

7. (+ 1 (length (cut_end L)) ; Length Property 1

8. (+ 1 (- x 1))  ; By IH

9. (1 + x - 1) ; Algebraic Simplification

10. x  ; Combine Like Terms 

We have shown that for any list of Length L, the length will be x-1.
Our final line ends with just x, but our IH holds, since the argument
Passed was (cons a L), adding one to the length and cancelling out like
terms. 



|#

;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;Question 5a (10pts)
;Write a recursive function (add_pairs L)
;that adds pairs of numbers.
;You may assume the length of L will always be even.

; Adds pairs of numbers
; Input:  L a list (the list must have even length)
; Output: A new list with pairs of elements added together.
(define (add_pairs L)
  (if (null? L) '()
      (cons (+ (first L) (first (rest L)))
            (add_pairs (rest (rest L))))))

(display "Question 5a add_pairs Tests (10 points)\n")
(define-test-suite test_add_pairs
  (check-equal? (add_pairs '()) '())
  (check-equal? (add_pairs '(1 2)) '(3))
  (check-equal? (add_pairs '(1 2 3 4)) '(3 7))
  (check-equal? (add_pairs '(2 2 2 2)) '(4 4))
  (check-equal? (add_pairs '(0 -1 -2 3)) '(-1 1))
  (check-equal? (add_pairs '(1 1 1 1)) '(2 2))
  (check-equal? (add_pairs '(1 2 3 4 5 6 7 8)) '(3 7 11 15))
  (check-equal? (add_pairs '(9 9 9 9 9 9)) '(18 18 18))
  (check-equal? (add_pairs '(7 3 4 6 5 5)) '(10 10 10))
  (check-equal? (add_pairs '(-9 9 -8 8)) '(0 0))
  
)
(define q5a_score (- 10 (run-tests test_add_pairs 'verbose)))

;Question 5b
;Prove by Induction that (length (add_pairs L)) = 1/2*(length L)
;for all L where (even? (length L)) and (length L) >= 0
;You may use the properties of length from Question 3

#|

Base Case

1. (add_pairs '()) ; Premise

2. (if (null? '()) '() (cons (+ (first '()) (first (rest '()))) (add_pairs (rest (rest '()))))) ; Apply Definition of add_pairs

3. (if #t '() (cons (+ (first '()) (first (rest '()))) (add_pairs (rest (rest '()))))) ; Evaluate null?

4. '()  ; Evaluate if


Inductive Hypothesis

Let us assume that there exists a set of lists we call Q.
Lists in the set Q will have anywhere from 0 to K elements inclusive.
For all L in this Q, (length (add_pairs L)) = 1/2*(length L), where
(even? (length L)) and (length L) >= 0.


Inductive Hypothesis


1. (add_pairs (cons a (cons a L))) ; Premise

2. (if (null? (cons a (cons a L))) '() (cons (+ (first (cons a (cons a L))) (first (rest (cons a (cons a L))))) (add_pairs (rest (rest (cons a (cons a L))))))) ; Apply Definition of add_pairs

3. (if #f '() (cons (+ (first (cons a (cons a L))) (first (rest (cons a (cons a L))))) (add_pairs (rest (rest (cons a (cons a L))))))) ; Evaluate null?

4. (cons (+ (first (cons a (cons a L))) (first (rest (cons a (cons a L))))) (add_pairs (rest (rest (cons a (cons a L)))))))  ; Evaluate if

5. 




|#




;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;;;;;;;;;;;;;;Grade Summary;;;;;;;;;;;;;;;;;;;;;;;
(display "------Grade Summary------\n")
(display "Q1a Scored: ")
(display q1a_score)
(display "/10\n")
(display "Q1b Scored: ?/10 (Graded by TA)\n")
(display "Q2a Scored: ")
(display q2a_score)
(display "/10\n")
(display "Q2b Scored: ?/10 (Graded by TA)\n")
(display "Q3a Scored: ")
(display q3a_score)
(display "/10\n")
(display "Q3b Scored: ?/10 (Graded by TA)\n")
(display "Q4a Scored: ")
(display q4a_score)
(display "/10\n")
(display "Q4b Scored: ?/10 (Graded by TA)\n")
(display "Q5a Scored: ")
(display q5a_score)
(display "/10\n")
(display "Q5b Scored: ?/10 (Graded by TA)\n")


(define grand_total (+ q1a_score q2a_score q3a_score q4a_score q5a_score))
(display "\n")
(display "Total: ")
(display grand_total)
(display "/100\n")