#lang racket

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



; Q1 

(define (sub m n)
  (if (zero? n) m
      (pred (sub m (pred n))))
)

; Q2

(define (div m n)
  (if (ltnat? m n)
      '()
      (succ (div (sub m n) n))))


; Q3 


(define (rem m n)
  (if (ltnat? m n) m
      (rem (sub m n) n)))


; Q4


(define (neq m n)
  (if (equal? (succ n) (succ m)) #f #t)
)


; Q5


(define (gcd m n)
      (if (equal? n '()) m
          (gcd n (rem m n))))

(gcd '(s) '(s s s))
(gcd '() '(s s s))


; Q6 


(define (modpow m n B)
  (if (null? n) (succ '())
      (rem (mult m (modpow m (pred n) B)) B)))



(modpow '(s s s s s) '(s s) '(s s)) 



