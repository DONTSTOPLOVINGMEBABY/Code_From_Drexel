#lang racket


; Recursive call comes before or after cons. Before cons requires passing two values to the function where one value is the null list



;Question 1
;Convert an Integer to a List of true/false values.
;If we want to convert the integer 9 to a list of t/f values
;we start by finding out its remainder and quotient when divided by 2.
;(remainder 9 2) = 1
;(quotient 9 2) = 4
;This tells us the least significant bit is a 1
;We will represent 1 as #t, so the list is currently (#t)
;Next, we repeat the proccess with the quotient 4
;(remainder 4 2) = 0
;(quotient 4 2) = 2
;Zero is false, so we add this to the list (#f #t)
;Repeat with the quotient 2
;(remainder 2 2) = 0
;(quotient 2 2) = 1
;Zero is false, the list becomes (#f #f #t)
;(remainder 1 2) = 1
;(quotient 1 2) = 0
;One is true, the list because (#t #f #f #t)
;The quotient was zero meaning we can stop.

;Implement the following function
;Since we want to line up with standard binary 2^0 being the last value,
;It is easiest to make L a parameter and use a helper function.
;Note: 0 is not supported by this function.
;We will deal with it in the next part.


(define (int_to_bool n)
  (int_to_bool_h n '())
)



;NOTE: You MAY NOT use reverse to solve this problem.
(define (int_to_bool_h n L)
  (if (equal? n 0)
      L
      (if (equal? (remainder n 2) 1) (int_to_bool_h (quotient n 2) (cons #t L)) (int_to_bool_h (quotient n 2) (cons #f L)))
))




;(int_to_bool 6 null)
;(cons #f (int_to_bool 3 null))
;(int_to_bool 3 (cons #f null))


;Question 2
;Only significant binary digits are stored by the above function.
;In reality, we would want every number to have the same bit length.
;Write a function to pad #f onto the front of the list.
(define (pad num_bits bit_list)
  (if (equal? (length bit_list) num_bits)
      bit_list
      (pad num_bits (cons #f bit_list)))
      
)

;Question 3
;Generate a Truth Table
;Given a number of variables n
;generate a truth table will all variable settings.
;The truth table should have rows with values starting at
;2^n-1 and ending at 0.
;For example, the truth tables for n=2 is
;( (#t #t) (#t #f) (#f #t) (#f #f) )
;Notice: A "Table" is a list of lists
;As integers this is (3 2 1 0)
;The number of bits is n.

;Define the below function

(define (tt_inputs n)
  (tt_inputs_h n (- (expt 2 n) 1))
)

(define (tt_inputs_h bits row_val)
  (if (equal? row_val -1)
      '()
      (cons (pad bits (int_to_bool row_val)) (tt_inputs_h bits (- row_val 1)))
    
))




(define (implies_example boolean_vars)
  (let (;Start of name list
        (a (list-ref boolean_vars 0));Pairs (name value)
        (b (list-ref boolean_vars 1))
      );End of name list
    (or (not a) b)
 );end of let
)

#|

(implies_example '(#t #t))
(implies_example '(#t #f))
(implies_example '(#f #t))
(implies_example '(#f #f))

|#


(define (example_expr1 bool_vars)
  (not (implies_example bool_vars))
)

#|
(example_expr1 '(#t #t))
(example_expr1 '(#t #f))
(example_expr1 '(#f #t))
(example_expr1 '(#f #f))
|#




(define (example_expr2 bool_vars)
  (if (equal? (first bool_vars) (first (rest bool_vars))) #t #f)
)

#|
(example_expr2 '(#t #t))
(example_expr2 '(#t #f))
(example_expr2 '(#f #t))
(example_expr2 '(#f #f))
|#

;c.) Example Function 3
;implement (a and (not b) and c)

(define (example_expr3 bool_vars)
  (if (equal? (first bool_vars) #t) (if (equal? (not (first (rest bool_vars))) #t) (if (equal? (first (rest (rest bool_vars))) #t) #t #f) #f) #f)
)


;(first '(1 2 3))
;(first (rest '(1 2 3)))
;(first (rest (rest '(1 2 3))))


;Question 5
;Write a function that takes
;fun - a function that takes a list of boolean values and returns a boolean
;tt - a truth table (list of lists of T/F values)
;And returns a list of T/F values with results
;For example if fun computes (not a)
;and tt = ( (#t) (#f) )
;Then the return of
;(evaluate_tt fun tt) should be (#f #t)
(define (evaluate_tt fun tt)
  (if (equal? (length tt) 0)
      null
      (cons (fun (first tt)) (evaluate_tt fun (rest tt)))
      
))


(evaluate_tt example_expr1 '( (#t #t) (#t #f) (#f #t) (#f #f)))




#|
;Test your function
(define-test-suite test_sat_solve
  (check-equal? (sat_solve implies_example 2) '(3 1 0))
  (check-equal? (sat_solve example_expr1 2) '(2))
  (check-equal? (sat_solve example_expr2 2) '(3 0))
  (check-equal? (sat_solve example_expr3 3) '(5))
  (check-equal? (sat_solve (lambda (X) (and (first X) (second X))) 2) '(3))
  (check-equal? (sat_solve (lambda (X) (or (first X) (second X))) 2) '(3 2 1))


|#











;Question 6
;Write a function that converts a list of T/F values
;back to an integer
;This function is the inverse of Q1
;The list is reversed for you in this function
(define (bool_to_int values)
  (bool_to_int_h (reverse values) 0)
)
;Implement this helper function
;values - the list of #t/#f false
;exp - the current power of 2 you are on
(define (bool_to_int_h values exp)
  (if (null? values)
      0
      (+ (if (equal? (first values) #f) 0 (expt 2 exp)) (bool_to_int_h (rest values) (+ exp 1))))
)




;Question 7
;Write a function that takes a function and the number of variables it has
;and determines which inputs make the function return true
;Display the inputs that make the function return true as integers
;For example (or a b) is true when '(#t #t) '(#t #f) '(#f #t)
;so the answer would be '(3 2 1) it is true for any of those integers
;in binary
;Hint: Look up the filter command in the Racket documentation
(define (sat_solve func n)
  (if (equal? n 0)
      null
      (cons (bool_to_int func) (sat_solve func (- n 1)))
))


(example_expr1 '(#t #t))

(sat_solve example_expr1 '(#t #t))







