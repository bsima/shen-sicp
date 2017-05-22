\\ 1.2 procedures and the processes they generate

(tc +)


\\ linear recursive

(define factorial
  { number --> number }
  1 -> 1
  N -> (* N (factorial (- N 1))))


\\ linear iterative

(define fact-iter
  { number --> number --> number --> number }
  P C M -> P where (> C M)
  Product Counter MaxCount ->
    (fact-iter (* Counter Product)
	       (+ Counter 1)
	       MaxCount))

(define factorial-2
  { number --> number }
  N -> (fact-iter 1 1 N))


\\ 1.2.2 tree recursion

(define fib
  { number --> number }
  0 -> 0
  1 -> 1
  N -> (+ (fib (- N 1))
	  (fib (- N 2))))

(define fib-iter
  { number --> number --> number --> number}
  A B 0 -> B
  A B Count -> (fib-iter (+ A B) A (- Count 1)))

(define fib-2
  { number --> number }
  N -> (fib-iter 1 0 N))
