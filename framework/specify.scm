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
