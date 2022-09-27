#lang racket


(define (countZeros nip)
  (if (null? nip) '()
      (if (list? (first nip))
           (append (countZeros (first nip)) (countZeros (rest nip)))
                (length (cons (first nip) (countZeros (rest nip))))))) 


(equal? (countZeros '(0)) 1)
(equal? (countZeros '(0)) 1)
(equal? (countZeros '()) 0 )
(equal? (countZeros '(0 0 0)) 3 )
(equal? (countZeros '(( 0 0 ) 0)) 3 )
(equal? (countZeros '((( 0 ))( 0 )(((( 0 )))))) 3 )
(equal? (countZeros '(( 0 )(( 0 0 )) ((( 0 0 0 ))) 0 )) 7 )
(equal? (countZeros '(0 (( 0 ) 0 0 ) 0 () ( 0 0 ))) 7 )










