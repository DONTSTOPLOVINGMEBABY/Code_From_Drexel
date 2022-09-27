#lang racket

#|
CS 270 Math Foundations of CS
Homework 6
Create By Professor Bruce Char, Professor Mark Boady, and Professor Jeremy Johnson

Submit in BBLearn.

Once you write a function, you may use it in later questions.

Important Rules:
1.) You may not use loop constructs like while/for/sum. If used, your answer will get a zero.
2.) If the instructions state something must be recursive, you will recieve a zero if it is not recursive.
    Recursive helper functions are allowed (the main function not being recursive).
3.) You may not use the set! command. If used, your answer will get a zero.
4.) Using If/Cond to explicitly pass tests instead of following the instructions
    will always result in a zero for that question.



  Peano arithmetic

    In words:  A number is either zero, or, recursively, the the symbol s cons-ed 
    to a number.

    Formally:  Number := null | (cons s [Number])
|#

(require racket/contract)
(require rackunit)
(require rackunit/text-ui)

#|

Peano arithmetic.

|#

;The zero element is the null list
;returns true if the list represents the number zero
;input-contract: (list? n)
;output-contract: (boolean? (zero? n))
(define (zero? n)
  (equal? n null))

;Checks if the input is a list representing a peano number
;input-contract: (list? n)
;output-contract: (boolean? (nat? n))
(define (nat? n)
  (cond
    [(zero? n) #t]
    [(cons? n) (and (equal? (first n) 's) (nat? (rest n)))]
    [else #f]))

;Increment a peano number by adding 1
;input-contract: (nat? n)
;output-contract: (nat? (succ n))
(define (succ n)
  (cons 's n))

;Decrement a peano number by subtracting 1
;input-contract: (nat? n)
;output-contract: (nat? (pred n))
(define (pred n)
  (if (zero? n) null (rest n)))

;Define a collection of common numbers
(define zero null)
(define one (succ zero))
(define two (succ one))
(define three (succ two))
(define four (succ three))
(define five (succ four))
(define six (succ five))
(define seven (succ six))
(define eight (succ seven))
(define nine (succ eight))
(define ten (succ nine))

; Addition of Peano numbers
; input-contract: (and (nat? m) (nat? n))
; output-contract: (nat? (plus m n))
(define (plus m n)
  (if (zero? m)
      n
      (succ (plus (pred m) n))))

; Multiplication of Peano numbers
; input-contract: (and (nat? m) (nat? n))
; output-contract: (nat? (mult m n))
(define (mult m n)
  (if (zero? m)
      m
      (plus n (mult (pred m) n))))

; Comparison of Peano numbers
; input-contract: (and (nat? m) (nat? n))
; output-contract: (boolean? (ltnat? m n)) and true when m < n
(define (ltnat? m n)
  (cond
    [(zero? n) #f]
    [(zero? m) #t]
    [else (ltnat? (pred m) (pred n))]))

;--------------- Question 1.  Implement subtraction of Peano numbers. --------------
;See specification below.

; Subtraction of Peano numbers
; input-contract: (and (nat? m) (nat? n))
; output-contract: (boolean? (sub m n))
; result is m-n if m >= n.
; otherwise return zero
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.
(define (sub m n)
  (if (zero? n) m
      (pred (sub m (pred n))))
)

;Test Bed
(display "Question 1 - Subtraction (15 points)\n")
(define-test-suite peano-subtract
  (check-equal? (sub ten ten) zero)
  (check-equal? (sub ten two) eight)
  (check-equal? (sub nine nine) zero)
  (check-equal? (sub nine one) eight)
  (check-equal? (sub eight six) two)
  (check-equal? (sub eight five) three)
  (check-equal? (sub seven one) six)
  (check-equal? (sub seven five) two)
  (check-equal? (sub six six) zero)
  (check-equal? (sub six two) four)
  (check-equal? (sub five three) two)
  (check-equal? (sub four two) two)
  (check-equal? (sub three two) one)
  (check-equal? (sub two one) one)
  (check-equal? (sub one zero) one)
)
(define q1_score (- 15 (run-tests peano-subtract 'verbose)))

;--------------- Question 2.  Implement Quotient of Peano numbers. --------------

; Division of Peano numbers
; input-contract: (and (nat? m) (nat? n) (not (zero? n)))
; output-contract: (nat? (ltnat? m n))
; Returns a Peano number whose value q is the quotient of m divided by n.
;  m = q*n + r with 0 <= r < n.
;Return 0 if n is equal to 0 (division is undefined)
;Return floor(m/n) otherwise
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.
(define (div m n)
  (if (ltnat? m n)
      '()
      (succ (div (sub m n) n))))

;Test Bed
(display "Question 2 - Division (15 points)\n")
(define-test-suite peano-div
  (check-equal? (div ten ten) one)
  (check-equal? (div ten two) five)
  (check-equal? (div nine three) three)
  (check-equal? (div nine one) nine)
  (check-equal? (div eight six) one)
  (check-equal? (div eight four) two)
  (check-equal? (div one seven) zero)
  (check-equal? (div seven five) one)
  (check-equal? (div six six) one)
  (check-equal? (div six two) three)
  (check-equal? (div five three) one)
  (check-equal? (div four two) two)
  (check-equal? (div three two) one)
  (check-equal? (div two one) two)
  (check-equal? (div one five) zero)
)
(define q2_score  (- 15 (run-tests peano-div 'verbose)))


;--------------- Question 3.  Implement Remainder of Peano numbers. --------------
; Remainder of Peano numbers
; input-contract: (and (nat? m) (nat? n) (not (zero? n)))
; output-contract: (nat? (rem m n))
; Returns a Peano number whose value r is the remainder of m divided by n.
;         m = q*n + r with 0 <= r < n.
;Return 0 when n = 0
;Return m%n otherwise
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.

(define (rem m n)
  (if (ltnat? m n) m
      (rem (sub m n) n)))

;Test Bed
(display "Question 3 - Remainder (15 points)\n")
(define-test-suite peano-rem
  (check-equal? (rem ten three) one)
  (check-equal? (rem ten two) zero)
  (check-equal? (rem nine three) zero)
  (check-equal? (rem nine one) zero)
  (check-equal? (rem eight five) three)
  (check-equal? (rem eight four) zero)
  (check-equal? (rem one seven) one)
  (check-equal? (rem seven five) two)
  (check-equal? (rem six six) zero)
  (check-equal? (rem six two) zero)
  (check-equal? (rem five three) two)
  (check-equal? (rem four two) zero)
  (check-equal? (rem three two) one)
  (check-equal? (rem two one) zero)
  (check-equal? (rem one five) one)
)
(define q3_score  (- 15 (run-tests peano-rem 'verbose)))

;--------------- Question 4.  Implement Not Equal of Peano numbers. --------------
; Not Equal of Peano numbers
; input-contract: (and (nat? m) (nat? n))
; output-contract: (boolean? (neq m n))
; Returns true when the numbers are not equal
;and false when they are equal
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.

(define (neq m n)
  (if (equal? (succ n) (succ m)) #f #t)
)

;Test Bed
(display "Question 4 - Not Equal (15 points)\n")
(define-test-suite peano-neq
  (check-equal? (neq ten ten) #f)
  (check-equal? (neq six six) #f)
  (check-equal? (neq five five) #f)
  (check-equal? (neq four four) #f)
  (check-equal? (neq three three) #f)
  (check-equal? (neq two two) #f)
  (check-equal? (neq one one) #f)
  (check-equal? (neq seven five) #t)
  (check-equal? (neq six nine) #t)
  (check-equal? (neq six two) #t)
  (check-equal? (neq five three) #t)
  (check-equal? (neq four two) #t)
  (check-equal? (neq three two) #t)
  (check-equal? (neq two one) #t)
  (check-equal? (neq one five) #t)
)
(define q4_score  (- 15 (run-tests peano-neq 'verbose)))

;--------------- Question 5.  Implement GCD of Peano numbers. --------------
#|
             Implement a function to compute the greatest common divisor
             of the Peano numbers m and n.  g = gcd(m,n) satisfies
             1)  g is a common divisor of m and n.
                 g divides m and g divides n.  I.E. the remainder when
                 dividing m and n by g is 0.
             2)  g is the greatest common divisor.
                 If e divides m and e divides n then e must divide g.

             The gcd(m,n) can be computed recursively.
             1)  gcd(m,0) = m
             2)  gcd(m,n) = gcd(n,remainder of m divided by n).
|#

; Greatest common divisor of Peano numbers
; input-contract: (and (nat? m) (nat? n)))
; output-contract: (nat? (gcd m n))
; return a Peano number equal to gcd(m,n).
; Note:  See algorithm in comments above
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.


(define (gcd m n)
      (if (equal? n '()) m
          (gcd n (rem m n))))


(display "Question 5 - GCD (20 points)\n")
(define-test-suite peano-gcd
  (check-equal? (gcd two ten) two)
  (check-equal? (gcd two four) two)
  (check-equal? (gcd three zero) three)
  (check-equal? (gcd three two) one)
  (check-equal? (gcd three three) three)
  (check-equal? (gcd three five) one)
  (check-equal? (gcd three six) three)
  (check-equal? (gcd three nine) three)
  (check-equal? (gcd three ten) one)
  (check-equal? (gcd four two) two)
  (check-equal? (gcd five ten) five)
  (check-equal? (gcd six one) one)
  (check-equal? (gcd six seven) one)
  (check-equal? (gcd seven six) one)
  (check-equal? (gcd eight two) two)
  (check-equal? (gcd eight four) four)
  (check-equal? (gcd eight eight) eight)
  (check-equal? (gcd nine one) one)
  (check-equal? (gcd nine ten) one)
  (check-equal? (gcd ten three) one)

)
(define q5_score  (- 20 (run-tests peano-gcd 'verbose)))

;--------------- Question 6.  Implement Mod Power of Peano numbers. --------------
#|
            The mod power is commonly used in cryptography.
            We want to compute (m^n) % B
            When we compute exponents, the number normally get very large.
            If we only need the remainder, we can take it at each stage
            This keeps our numbers smaller

            The algorithm is described below
            (m^n)%B = 1 if n==0
            (m^n)%B = (* m (m^(n-1)) %B otherwise
|#

; Mod Power of Peano numbers
; input-contract: (and (nat? m) (nat? n)))
; output-contract: (nat? (modpow m n B))
; return a Peano number equal to (m^n)%B.
; Note:  See algorithm in comments above
;||RULES|| You may not convert to or from traditional integers.
;||RULES|| You may not compute the length of a list for any reason.
;||RULES|| Your function must be recursive.

(define (modpow m n B)
  (if (null? n) (succ '())
      (rem (mult m (modpow m (pred n) B)) B)))



(display "Question 6 - Mod Power (20 points)\n")
(define-test-suite peano-modpow
  (check-equal? (modpow two zero three) one)
  (check-equal? (modpow two one three) two)
  (check-equal? (modpow two two three) one)
  (check-equal? (modpow two three three) two)
  (check-equal? (modpow three zero four) one)
  (check-equal? (modpow three one four) three)
  (check-equal? (modpow three two four) one)
  (check-equal? (modpow three three four) three)
  (check-equal? (modpow two zero four) one)
  (check-equal? (modpow two one four) two)
  (check-equal? (modpow two two four) zero)
  (check-equal? (modpow two three four) zero)
  (check-equal? (modpow three zero five) one)
  (check-equal? (modpow three one five) three)
  (check-equal? (modpow three two five) four)
  (check-equal? (modpow three three five) two)
  (check-equal? (modpow three four five) one)
  (check-equal? (modpow three five five) three)
  (check-equal? (modpow three four two) one)
  (check-equal? (modpow three five two) one)
)
(define q6_score  (- 20 (run-tests peano-modpow 'verbose)))

;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;;;;;;;;;;;;;;Grade Summary;;;;;;;;;;;;;;;;;;;;;;;
(display "------Grade Summary------\n")
(display "Q1 Scored: ")
(display q1_score)
(display "/15\n")
(display "Q2 Scored: ")
(display q2_score)
(display "/15\n")
(display "Q3 Scored: ")
(display q3_score)
(display "/15\n")
(display "Q4 Scored: ")
(display q4_score)
(display "/15\n")
(display "Q5 Scored: ")
(display q5_score)
(display "/20\n")
(display "Q6 Scored: ")
(display q6_score)
(display "/20\n")

(define grand_total (+ q1_score q2_score q3_score q4_score q5_score q6_score))
(display "\n")
(display "Total: ")
(display grand_total)
(display "/100\n")
