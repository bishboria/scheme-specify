(load "framework/specify.scm")

(specify
  (fact #t #t)
  (fact #t (= 1 1))
  (fact #t (< 1 2))
  (fact #t (> 2 1))
  (fact 3 (+ 1 2))
  (fact #t (< 2 1))
  (fact 3 (sqrt 4)))

(specify
  (fact (list '. '(expected (= 1 2) to be #t but is #f))
	(specify
	  (fact #t (= 1 1))
	  (fact #t (= 1 2))))
  (fact (list '. '. '(expected (= 1 2) to be #t but is #f))
	(specify
	  (fact #t #t)
	  (fact #t (= 1 1))
	  (fact #t (= 1 2))))
  (fact #t (correct? '.))
  (fact #f (correct? '(expected (= 1 2) to be #t but is #f))))
