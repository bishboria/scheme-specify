(define (specify . facts)
  (define (correct? fact)
    (equal? fact '.))
  (define (incorrect? fact)
    (not (correct? fact)))
  (let ((correct (filter correct? facts))
	(incorrect (filter incorrect? facts)))
    (append correct incorrect)))

(define-syntax fact 
  (syntax-rules ()
		((fact e a)
		 (if (equal? e a)
		   '.
		   (list 'expected 'a 'to 'be e 'but 'is a)))))
