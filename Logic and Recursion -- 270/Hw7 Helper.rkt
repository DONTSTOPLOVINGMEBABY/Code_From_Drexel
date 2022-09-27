#lang racket


;Question 1a (10 points)
;Write a recursive function to compute
;the sum( 6*x^2 , x = 1..n) for a given n
;You must write a recursive function.
;If you use any iterative commands (for/loop/sum/etc you will receive a 0)

; Computes sum( 6*x^2 , x = 1..n)
; Input:  n an integer >= 1
; Output: an integer, the result of the summation


;for all integers n >= 1 -> (spec_sum n) = 2n^3+3n^2+n

(define (spec_sum n)
  
  (if (= n 0) 0
      
      (+ (* 6 (expt n 2)) (spec_sum (- n 1)))))

(spec_sum 3)


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


;(evenzeros '(0 0 0 0))

;(evenzeros '(1 0 0 0 0))

;(evenzeros '(1 0 0 0 0 0))


;(first L)==0 and (even (rest L)) -> odd
;(first L)!=0 and (even (rest L)) -> even
;(first L)==0 and not(even(rest L)) -> even
;(first L)!=0 and not(even(rest L)) -> odd

;(0 .........)
;(evenzeros (rest (0 ....))) = #t
;(evenzeros (rest (0 .....))) = #f


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
      (cons (first X )(cons (first X) (duplicate (rest X))))))

;(duplicate '(1 1 1 1)) 

;Question 4a (10pts)
;Write a recursive function (cut_end L) that removes the last element from the list

; Removes the last element in a list
; Input:  X non-empty a list
; Output: A new list with the last element removed

(define (cut_end L)
  (if (equal? (length L) 1) '()
      (cons (first L) (cut_end (rest L)))
))


;Question 5a (10pts)
;Write a recursive function (add_pairs L)
;that adds pairs of numbers.
;You may assume the length of L will always be even.

; Adds pairs of numbers
; Input:  L a list (the list must have even length)
; Output: A new list with pairs of elements added together.



(define (add_pairs L)
  (if (null? L) '()
      (cons (+ (first L) (first (rest L))) (add_pairs (rest (rest L))))))
      





;(check-equal? (add_pairs '()) '())
;(check-equal? (add_pairs '(1 2)) '(3))
;(check-equal? (add_pairs '(1 2 3 4)) '(3 7))
;(check-equal? (add_pairs '(2 2 2 2)) '(4 4))
  


