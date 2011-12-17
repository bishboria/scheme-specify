(load "framework/specify.scm")

(specify
  (fact (= 1 1) #t)
  (fact (> 2 1) #t)
  (fact (< 1 2) #t)
  (fact (+ 1 2) 3)
  (fact #t #t))

(specify
  (fact (< 2 1) #t)
  (fact (sqrt 4) 3))

(specify
  (fact (specify
	  (fact (= 1 1) #t)
	  (fact (= 1 2) #t))
	(list '. '(expected (= 1 2) to be #t but is #f)))
  (fact (specify
	  (fact (= 1 2) #t)
	  (fact (= 1 1) #t)
	  (fact #t #t))
	(list '. '. '(expected (= 1 2) to be #t but is #f)))
  (fact (specify
	  (fact 'b 'a))
	(list '(expected b to be a but is b)))
  (fact (specify
	  (fact '(c d) '(a b)))
	(list '(expected (c d) to be (a b) but is (c d)))))
