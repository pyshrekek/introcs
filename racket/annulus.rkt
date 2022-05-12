;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname annulus) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define my-pi 3.14)

;; (distance a b) -> nonnegative-real
;              a : real
;              b : real
(define distance
  (λ(x y)
    (abs (- x y))))

;; unit tests
;(check-expect (distance -1 11) 12)

;; (circle-area r) -> real
;                r : real
(define circle-area
  (λ(r)
    (* my-pi r r )))
;; unit tests
;(check-expect (circle-area 1) my-pi)
;(check-expect (circle-area 2) (* 4 my-pi))

;; (annulus-area r1 r2) -> nonnegative-real
;                    r1 : real
;                    r2 : real
(define annulus-area
  (λ(r1 r2)
    (distance (circle-area r1) (circle-area r2))))

;; unit tests
(check-expect (annulus-area 2 3) 15.7)
(check-expect (annulus-area 6 5) 34.54)