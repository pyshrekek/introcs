;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sugar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (sign x ) -> integer
;      x : real
(define sign
  (λ(x)
    (cond ((> x 0) 1)
          ((= x 0) 0)
          ((< x 0) -1))))
;;Unit tests
;(check-expect (sign 34)  1)
;(check-expect (sign  0)   0)
;(check-expect (sign -2) -1)



(define new-if
  (λ(a b c)
    (cond (a b)
          (else c))))
;;Unit tests
;(check-expect (new-if (even? 3) 1 2) 2)
;(check-expect (new-if (odd? 3) 1 2) 1)

#|
Why does (new-if (even? 3) (/ 3 0) 2) results in a division by zero error,
but (if (even? 3) (/ 3 0) 2) does not?

(new-if) has to evaluate (/ 3 0) before it evaluates anything else,
but (if) only has to evaluate the false condition, since it skips directly to it, and
doesn't touch the true condition at all|#



; (xor a b) -> boolean
;    a : boolean
;    b : boolean
(define xor 
     (λ(a b)
     	 (and (or a b)
	      (not (and a b)))))



; (divisor? n d) -> boolean
;    n : integer
;    d : integer.   Assume d is not zero.
(define divisor?
  (λ(n d)
    (zero? (remainder n d))))



;; (leap-year? year) -> boolean
;       year : integer
(define leap-year?
  (λ(year)
    (or (divisor? year 400)
        (xor (divisor? year 4)
             (divisor? year 100)))))


;; (days-in-month m y) -> integer
;         m     : integer   Assume 1 <= m <= 12.
;         y     : integer
(define days-in-month
  (λ(m y)
    (cond ((and (leap-year? y) (= m 2))
           29)
          ((= m 2)
           28)
          ((or (and (divisor? m 2) (<= m 7))
              (and (not (divisor? m 2)) (>= m 8)))
           30)
;          ((or (and (not (divisor? m 2)) (<= m 7))
;             (and (divisor? m 2) (>= m 8)))
;           31)
          (else
           31))))

          
;;Unit tests
(check-expect  (days-in-month 2 2016)  29)
(check-expect  (days-in-month 2 2100)  28)
(check-expect  (days-in-month 6 2000)  30)
(check-expect  (days-in-month 7 2016)  31)