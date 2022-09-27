#lang racket

(define (allEven L)
  (if (null? L)
      #t
      (and
       (equal? (remainder (first L) 2 ))
       (allEven (rest L))
      )
     )
 )




;1 

(define (noti e)
  (if (e) #f #t))


  
;2



(define (andi e1 e2)
  (if (if e1 #t #f) (if e2 #t #f) #f))



;3

(define (ori e1 e2)
  

  (if e1 #t (if e2 #t #f))
)


;4

(define (xori e1 e2)

  (if e1 (if e2 #f #t) (if e2 #t #f))
)


;5



(define (implies e1 e2)
  (if e1 (if e2 #t #f) #t))


;6

; output:  (boolean? (iffi e1 e2)) true if e1 and e2 are both true of
;           both false



(define (iffi e1 e2)
  (if e1 (if e2 #t #f) (if e2 #f #t)))


#|
(iffi #t #t)
(iffi #t #f)
(iffi #f #t)
(iffi #f #f)

|# 


;Question 7.
; Use foldr to implement (andlist L).
; andlist takes a list and ANDs all the elements in the list.
; You only use foldr, andi, #t, #f, and input arguments.



(define (andList L)

  (foldr andi #t L)

)

;Question 8
; Use foldr to implement (orlist L).
; andlist takes a list and ORs all the elements in the list.
; You only use foldr, ori, #t, #f, and input arguments.

(define (orList L)
  
  (foldr ori #f L)

)

;(orList '(#t #t #t #t #t))
;(orList '(#t #t #t #f #t))
;(orList '(#f #f #f #f #f))
;(orList '(#f))


  

;Question 9
; Write a recursive function all_q to check if a list of symbols
; contains all q characters.
; Don't forget the base case and the necessary recursion.
; You may use any previously written function.

;Hint: You can use equal? on symbols
;(equal? 'q 'b) returns #f
;(equal? 'b 'b) returns #t

; Check if a list contains all q characters
; Input:  L is a list of symbols (a,b,c,...,z).
; Output: a boolean value which is true when there
;          does not exist any non-q elements in the list.
; The empty list should return true.
;If the list has no elements, then if has no non-q elements.






(define (all_q L)
  (if (null? L) #t
      (if (equal? (first L) 'q)
          (all_q (rest L)) #f)))


      
       
;Question 10
;Solve question 9 again. This time you may not write a recursive function.
;Solve the problem using map/foldr/foldl/lambda instead of recursion.
;You may use andlist/orlist defined above.
;Do not write helper functions for this question. Use Lambda instead.




(define (all_q_v2 L)
  (if (null? L) #t
      (if (andList (map (lambda (output) (equal? output 'q)) L)) #t #f)))




; have to turn the list to true or false first and then you can
; use foldr to iterate over


;Question 11
; Write a recursive function at_least_one_q to check if a list of symbols
; contains at least one q symbol.
; Don't forget the base case and the necessary recursion. 
; You may use any previously written function.

; Check if a list contains at least one q
; Input:  L is a list of symbols (a,b,c,...z).
; Output: a boolean value which is true when at least one of the elements
;          in L is equal to q and false otherwise.
; An empty list should return false. Think about why this is a good base case.


(define (at_least_one_q L)
  (if (null? L) #f
      (if (equal? (first L) 'q)
          #t (at_least_one_q (rest L)))))



(define (at_least_one_q_v2 L)
  (if (null? L) #f
      (if (orList (map (lambda (output) (equal? output 'q)) L)) #t #f)))


;Question 13
; Write a recursive function exactly_one_q to check if a list of symbols
; contains exactly one q symbol.
; Don't forget the base case and the necessary recursion.
; You may use any previously written function.

;Hint: The answer to question 11 is helpful to use here.

; Check if a list contains exactly one q
; Input:  L is a list of symbols (a,b,c,...,z).
; Output: a boolean value which is true when exactly one of the elements
;          in L is equal to q and false otherwise.
; The empty list should return false.




;Question 15.
;Solve question 14 again. This time you may not write a recursive function.
;Solve the problem using map/foldr/foldl/lambda instead of recursion.
;Do not write helper functions for this question. Use Lambda instead.

; Check if a list contains an odd number of q symbols
; Input:  L is a list of symbols (a,b,c,...,z).
; Output: a boolean value which is true when an odd number of the elements
;          in L is equal to q and false otherwise.
; 0 is even, so the Null list should return false




;(at_least_one_q_v2 '(q q q q q q q q))
;(at_least_one_q_v2 '(q q q q q s q q))
;(at_least_one_q_v2 '(s s s s s s s s))


(define (odd_amt_q_v2 L)
  (if (null? L) #f
      (equal? (remainder (foldr + 0 (map (lambda (x) (if (equal? x 'q) 1 0)) L)) 2) 1))) 

(odd_amt_q_v2 '(q q q q q f))



