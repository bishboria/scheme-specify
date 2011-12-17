(define (specify . facts)
  (define (correct? info)
    (equal? info '.))
  (define (incorrect? info)
    (not (correct? info)))
  (let ((correct (filter correct? facts))
	(incorrect (filter incorrect? facts)))
    (append correct incorrect)))

(define-syntax fact 
  (syntax-rules ()
		((fact a e)
		 (if (equal? a e)
		   '.
		   (list 'expected (if (symbol? a)
				     a
				     'a)
			 'to 'be e 'but 'is a)))))
