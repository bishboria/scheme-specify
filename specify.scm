(define (specify . facts)
  (let ((correct (filter correct? facts))
	(incorrect (filter incorrect? facts)))
    (append correct incorrect)))

(define (correct? fact)
  (if (equal? fact '.)
    #t
    #f))

(define (incorrect? fact)
  (not (correct? fact)))

(define-syntax fact 
  (syntax-rules ()
		((delay e a)
		 (if (equal? e a)
		   '.
		   (list 'expected 'a 'to 'be e 'but 'is a)))))

(specify
  (fact #f #t)
  (fact #t (< 1 2))
  (fact #t (< 2 1))
  (fact 3 (+ 2 2))
  (fact 2 (sqrt 4)))

(specify
  (fact (list '. '(expected #t to be #f but is #t))
	(specify
	  (fact #t (= 1 1))
	  (fact #f #t)))
  (fact (list '. '. '(expected #t to be #f but is #t))
	(specify
	  (fact #t (= 1 1))
	  (fact #f #t)
	  (fact #t #t)))
  (fact #t (correct? '.))
  (fact #f (correct? '(expected #t to be #f but is #t))))
