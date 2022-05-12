;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname predicates) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (my-zero? x) -> boolean
;            x  :  real
(define my-zero?
  (λ(x)
    (= 0 x)))
 
;; (divisor? n d) -> boolean
;             n  :  integer
;             d  :  non-zero integer
(define divisor?
  (λ(n d)
    (= 0 (remainder n d))))

;; Unit tests
;(check-expect (divisor? 10 5) true)

;; (my-positive? n) -> boolean
;                n  :  real
(define my-positive?
  (λ(n)
    (> n 0)))

;; (my-negative n) -> boolean
;               n  :  real
(define my-negative?
  (λ(n)
    (< n 0)))

;; (increasing? a b c)  -> boolean
;;        a : real
;         b : real
;         c : real
; (increasing? a b c)   -> evaluates to true only if a < b < c.
(define increasing?
  (λ(a b c)
    (< a b c)))

;; Unit tests
;;(check-expect (increasing? 1 2 3) true)
;;(check-expect (increasing? 3 2 1) false)
;;(check-expect (increasing? -1 0 0) false)



;;(my-even? n) -> boolean
;           n  :  integer
(define my-even?
  (λ(n)
    (divisor? n 2)))

;(check-expect (my-even? 2) #true)

;;(my-odd? n) -> boolean
;          n  :  integer
(define my-odd?
  (λ(n)
    (not (my-even? n))))

(and #f #t)

;;(between? n a b)  -> boolean
;               n : real
;               a : real
;               b : real
(define between?
  (lambda (n a b)
    (or (and (< n a) (> n b)) (and (> n a) (< n b)))))

;; Unit tests
;(check-expect (between? 2 1 5) true)
;(check-expect (between? 3 3 5) false)
;(check-expect (between? 5 3 5) false)
;(check-expect (between? 0 1 11) false)
;(check-expect (between? 0 -10 10) true)
;(check-expect (between? 0 10 -10) true)

;;(xor a b) -> boolean
;        a  :  boolean
;        b  :  boolean
(define xor
  (λ(a b)
    (and (not (and a b)) (or a b))))

;; Unit tests
(check-expect (xor true true)  false)
(check-expect (xor true false) true)
(check-expect (xor false true) true)
(check-expect (xor false false) false)