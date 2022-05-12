#lang racket

;; 1. Write (my-append L1 L2) that forms a new list by adding the elements of L2 to the end of L1.
(define my-append
  (λ(L1 L2)
    (cond ((= (length L2) 1) (cons (car L2) (cdr L2)))
          ((empty? L1) (cons (car L2) (my-append L1 (cdr L2))))
          (else (cons (car L1) (my-append (cdr L1) L2))))))
(my-append '() '(1 2))
(my-append '(3 5) '())
(my-append '(1 2 3) '())