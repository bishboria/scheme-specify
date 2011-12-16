(define (specify . facts)
  (map (lambda (x) x) facts))

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
