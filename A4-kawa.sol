(require 'pretty-print)

(define (def solution)
   (map eval 
     `((define ,(string->symbol 
                   (string-append (symbol->string (car solution)) "$"))
               '(define ,(cons (car solution) (cadadr solution)) 
		                ,(caddr (cadr solution))))
	   (define ,(car solution)  ,(cadr solution))
	  )
   )
)

            
(map def
'(
 (sum (lambda (l) (cond ((null? l) 0) 
                        (else (+ (car l) (sum (cdr l)))))))

 (neg-nums
   (lambda (l)
     (cond
      ((null? l) ())
      ((< (car l) 0) (cons (car l) (neg-nums (cdr l))))
      (else (neg-nums (cdr l))))))

 (inc-list-2
   (lambda (l n)
     (cond ((null? l) ()) 
           (else (cons (+ n (car l)) (inc-list-2 (cdr l) n))))))

 (insert
   (lambda (n l)
     (cond
      ((null? l) (list n))
      ((<= n (car l)) (cons n l))
      (else (cons (car l) (insert n (cdr l)))))))

 (isort (lambda (l) (cond ((null? l) ()) 
                          (else (insert (car l) (isort (cdr l)))))))

 (split-list
   (lambda (l)
     (cond
      ((null? l) '(() ()))
      (else
       (let ((split-cdr (split-list (cdr l))))
         (list
          (cons (car l) (cadr split-cdr))
          (car split-cdr)))))))

 (partition
   (lambda (l pivot)
     (cond 
        ((null? l) '(() ()))
        (else (let ((pcl (partition (cdr l) pivot)))
                 (cond 
                    ((< (car l) pivot) 
                       (list (cons (car l) (car pcl)) (cadr pcl)))
                    (else 
                       (list (car pcl) (cons (car l) (cadr pcl))))))))))

 (pos
  (lambda (x l)
    (cond
     ((null? l) 0)
     ((equal? x (car l)) 1)
     (else
      (let ((pos-in-cdr (pos x (cdr l))))
        (cond ((zero? pos-in-cdr) 0) 
              (else (+ 1 pos-in-cdr))))))))

 (split-nums
   (lambda (n)
     (cond 
        ((zero? n) '((0) ()))
        (else 
           (let ((split-prev (split-nums (- n 1))))
              (cond 
                 ((even? n)
                    (list (cons n (car split-prev)) (cadr split-prev)))
                 (else 
                    (list (car split-prev) (cons n (cadr split-prev))))))))))

 (set-union
   (lambda (s1 s2)
     (cond
      ((null? s1) s2)
      ((member (car s1) s2) (set-union (cdr s1) s2))
      (else (cons (car s1) (set-union (cdr s1) s2))))))

 (set-remove
   (lambda (x s)
     (cond
      ((null? s) ())
      ((equal? x (car s)) (cdr s))
      (else (cons (car s) (set-remove x (cdr s)))))))

 (set-excl-union
   (lambda (s1 s2)
     (cond
      ((null? s1) s2)
      ((member (car s1) s2) (set-remove (car s1) (set-excl-union (cdr s1) s2)))
      (else (cons (car s1) (set-excl-union (cdr s1) s2))))))

 (singletons
   (lambda (e)
     (cond
      ((null? e) ())
      ((member (car e) (cdr e)) (set-remove (car e) (singletons (cdr e))))
      (else (cons (car e) (singletons (cdr e))))))))
)

(values)
