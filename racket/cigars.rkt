;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lol) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;(cigar-party cigars weekend) -> Boolean
;     cigars : integer
;     weekend : boolean
(define cigar-party
  (λ(cigars weekend)
    (if weekend (> cigars 40) (and (>= cigars 40) (<= cigars 60)))))
;;Unit tests
;(check-expect (cigar-party 30  false) false)
;(check-expect (cigar-party 50  false) true)
;(check-expect (cigar-party 70  true) true)



;;(date-fashion you date) -> integer
;    you : integer
;    date : integer
(define date-fashion
  (λ(you date)
    (if (or (<= you 2) (<= date 2))
        0
        (if (or (>= you 8) (>= date 8))
            2
            1))))
;;Unit tests
;(check-expect (date-fashion 5 10) 2)
;(check-expect (date-fashion 5 2) 0)
;(check-expect (date-fashion 5 5) 1)



;;(love6 a b) -> boolean
;          a  :  integer
;          b  :  integer
(define love6
  (λ(a b)
    (if (or (= a 6) (= b 6))
        #t
        (or (= (+ a b) 6) (= (abs (- a b)) 6)))))
;;Unit tests
;(check-expect (love6 6 4) true)
;(check-expect (love6 4 5) false)
;(check-expect (love6 1 5) true)



;;(answer-cell morning? mom? asleep?) -> boolean
;              morning? : boolean
;              mom? : booleaen
;              asleep? : boolean
(define answer-cell
  (λ(morning? mom? asleep?)
    (if asleep?
        #f
        (if mom?
            #t
            (not morning?)))))
;;Unit tests
;(check-expect (answer-cell #f #f #f) #t)
;(check-expect (answer-cell #f #f #t) #f)
;(check-expect (answer-cell #t #f #f) #f)



;;(max-mod5 a b) -> integer
;             a  :  integer
;             b  :  integer
(define max-mod5
  (λ(a b)
    (if (= a b)
        0
        (if (= (modulo a 5) (modulo b 5))
            (min a b)
            (max a b)))))
;;Unit tests
;(check-expect (max-mod5 2 3) 3)
;(check-expect (max-mod5 6 2) 6)
;(check-expect (max-mod5 3 2) 3)