; Simple attempt at a testing framework in Scheme

; failing facts (assertions) have the following form:

;          expected x to be ... but got ....

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
  (fact #t (< 2 1)))
