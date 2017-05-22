\\ Building Abstractions with Procedures

(tc +)


\\ 1.1.4 compound procedures

(define square
  { number --> number }
  X -> (* X X))

(define double
  { number --> number }
  X -> (+ X X))

(define sum-of-squares
  { number --> number --> number}
  X Y -> (+ (square X) (square Y)))

(define f
  { number --> number }
  A -> (sum-of-squares (+ A 1) (* A 2)))


\\ 1.1.6 conditional expressions and predicates

(define abs
  { number --> number }
  X -> (if (>= X 0) X (- 0 X)))


\\ exercise 1.1.3

(define min
  { number --> number --> number }
  X Y -> (if (< X Y) X Y))

(define max
  { number --> number --> number }
  X Y -> (if (> X Y) X Y))

(define one-dot-three
  { number --> number --> number --> number }
  A B C -> (sum-of-squares (max A B) (max C (min A B))))


\\ 1.1.7 square roots by newton's method

(define average
  { number --> number --> number }
  X Y -> (/ (+ X Y) 2))

(define improve
  { number --> number --> number }
  Guess X -> (average Guess (/ X Guess)))

(define good-enough?
  { number --> number --> boolean }
  Guess X -> (< (abs (- (square Guess) X))
		0.001))

(define sqrt-iter
  { number --> number --> number }
  Guess X -> (if (good-enough? Guess X)
		 Guess
		 (sqrt-iter (improve Guess X)
			    X)))

(define sqrt
  { number --> number }
  X -> (sqrt-iter 1.0 X))


\\ tests:

(sqrt 9) \\ 3.00009155413138 : number
(sqrt (+ 100 37)) \\ 11.704699917758145 : number
(sqrt (+ (sqrt 2) (sqrt 3))) \\ 1.7739279023207892 : number
(square (sqrt 1000)) \\ 1000.000369924366 : number


\\ exercise 1.1.8


(define cube
  { number --> number }
  X -> (* X X X))

(define cr-good-enough?
  { number --> number --> boolean }
  Guess X -> (< (abs (- (cube Guess) X)) 0.001))

(define cr-improve
  { number --> number --> number }
  Guess X -> (/ (+ (/ X (square Guess)) 
		   (* 2 Guess))
		3))

(define cr-iter
  { number --> number --> number }
  Guess X -> (if (cr-good-enough? Guess X)
		 Guess
		 (cr-iter (cr-improve Guess X)
			  X)))

(define cube-root
  { number --> number }
  X -> (cr-iter 1.0 X))


\\ tests

(cube 3) \\ 27 : number
(cube-root 27) \\ 3.0000005410641766 : number
