;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname digits) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(ones-digit n) -> integer
;            n  :  integer
(define ones-digit
  (λ (n)
    (abs (remainder n 10))))

;; Unit tests
;(check-expect (ones-digit 235) 5)
;(check-expect (ones-digit -34) 4)



;(remove-ones-digit n) -> integer
;                   n  :  integer
(define remove-ones-digit
  (λ (n)
    (quotient n 10)))

;; Unit tests
;(check-expect  (remove-ones-digit 234)   23)
;(check-expect  (remove-ones-digit   5)    0)
;(check-expect  (remove-ones-digit -5421)  -542)



;(tens-digit n) -> integer
;            n  :  integer
(define tens-digit
  (λ (n)
    (ones-digit (remove-ones-digit n))))

;; Unit tests
;(check-expect (tens-digit 235) 3)
;(check-expect (tens-digit 12345) 4)
;(check-expect (tens-digit 5) 0)



;(hundreds-digit n) -> integer
;                n  :  integer
(define hundreds-digit
  (λ (n)
    (ones-digit (remove-ones-digit (remove-ones-digit n)))))

;; Unit tests
;(check-expect (hundreds-digit 235) 2)
;(check-expect (hundreds-digit 12345) 3)
;(check-expect (hundreds-digit 5) 0)



;(sum-digits n) -> integer
;            n  :  integer
; n must be between 1000 and -1000, exclusive
(define sum-digits
  (λ (n)
    (+ (ones-digit n) (tens-digit n) (hundreds-digit n))))

;; Unit tests
;(check-expect (sum-digits 3) 3)
;(check-expect (sum-digits 25) 7)
;(check-expect (sum-digits 235) 10)
;(check-expect (sum-digits -345) 12)



;(reverse-digits n) -> integer
;                n  :  integer
(define reverse-digits
  (λ (n)
    (+ (* (ones-digit n) 100) (* (tens-digit n) 10) (hundreds-digit n))))

;; Unit tests
;(check-expect (reverse-digits 235) 532)
;(check-expect (reverse-digits 105) 501)
;(check-expect (reverse-digits 200) 2)