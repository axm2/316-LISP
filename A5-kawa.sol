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
 (split-list   ; from assignments 4
   (lambda (l)
     (cond
      ((null? l) '(() ()))
      (else
       (let ((split-cdr (split-list (cdr l))))
         (list
          (cons (car l) (cadr split-cdr))
          (car split-cdr)))))))

 (partition  ; from assignments 4
   (lambda (l pivot)
     (cond 
        ((null? l) '(() ()))
        (else (let ((pcl (partition (cdr l) pivot)))
                 (cond 
                    ((< (car l) pivot) 
                       (list (cons (car l) (car pcl)) (cadr pcl)))
                    (else 
                       (list (car pcl) (cons (car l) (cadr pcl))))))))))

 (index
  (lambda (n l)
    (cond
     ((null? l) 'ERROR)
     ((= n 1) (car l))
     (else (index (- n 1) (cdr l))))))

 (min-first
   (lambda (l)
     (cond ((null? (cdr l)) l)
           (else 
             (let ((min-first-cdr (min-first (cdr l))))
               (cond 
                 ((<= (car l) (car min-first-cdr))   l)
                 (else 
                    (cons (car min-first-cdr) (cons (car l) (cdr min-first-cdr))))))))))

 (ssort
  (lambda (l)
    (cond
     ((null? l) ())
     (else (let ((l1 (min-first l))) (cons (car l1) (ssort (cdr l1))))))))

 (qsort
  (lambda (l)
    (cond 
       ((null? l) ())
       (else
          (let ((pl (partition (cdr l) (car l))))
             (append (qsort (car pl)) (cons (car l) (qsort (cadr pl)))))))))

 (merge-lists
   (lambda (l1 l2)
     (cond
      ((null? l1) l2)
      ((null? l2) l1)
      ((< (car l1) (car l2)) (cons (car l1) (merge-lists (cdr l1) l2)))
      (else (cons (car l2) (merge-lists l1 (cdr l2)))))))

 (msort
  (lambda (l)
    (cond
     ((null? l) ())
     ((null? (cdr l)) l)
     (else
      (let ((split-l (split-list l)))
        (merge-lists (msort (car split-l)) (msort (cadr split-l))))))))

 (remove-adj-dupl
   (lambda (l)
     (cond
      ((or (null? l) (null? (cdr l))) l)
      ((equal? (car l) (cadr l)) (cons (car l) (cdr (remove-adj-dupl (cdr l)))))
      (else (cons (car l) (remove-adj-dupl (cdr l)))))))     
      
 (unrepeated-elts
   (lambda (l)
     (cond
      ((null? l) ())
      ((or (null? (cdr l)) (not (equal? (car l) (cadr l))))
       (cons (car l) (unrepeated-elts (cdr l))))
      ((or (null? (cddr l)) (not (equal? (car l) (caddr l))))
       (unrepeated-elts (cddr l)))
      (else (unrepeated-elts (cdr l))))))

 (repeated-elts
   (lambda (l)
     (cond
      ((null? l) ())
      ((or (null? (cdr l)) (not (equal? (car l) (cadr l))))
       (repeated-elts (cdr l)))
      ((or (null? (cddr l)) (not (equal? (car l) (caddr l))))
       (cons (car l) (repeated-elts (cddr l))))
      (else (repeated-elts (cdr l))))))

(count-repetitions
  (lambda (l)
    (cond
      ((null? l) ())
      ((null? (cdr l)) (list (cons 1 l)))
      (else
        (let ((count-rep-cdr (count-repetitions (cdr l))))
           (cond 
              ((not (equal? (car l) (cadr l)))
                 (cons (list 1 (car l)) count-rep-cdr))
              (else 
                 (cons (list (+ 1 (caar count-rep-cdr)) (car l))
                       (cdr count-rep-cdr)))))))))

 (subset
   (lambda (f l)
     (cond
      ((null? l) ())
      ((f (car l)) (cons (car l) (subset f (cdr l))))
      (else (subset f (cdr l))))))

 (our-some
   (lambda (f l)
     (cond ((null? l) #f) ((f (car l)) l) (else (our-some f (cdr l))))))

 (our-every
   (lambda (f l)
     (cond ((null? l) #t) (else (and (f (car l)) (our-every f (cdr l)))))))

 (partition1
   (lambda (l pivot p)
     (cond 
        ((null? l) '(() ()))
        (else
           (let ((pcl (partition1 (cdr l) pivot p)))
              (cond 
                 ((p (car l) pivot)
                    (list (cons (car l) (car pcl)) (cadr pcl)))
                 (else
                    (list (car pcl) (cons (car l) (cadr pcl))))))))))

 (qsort1
   (lambda (p l)
     (cond 
        ((null? l) ())
        (else 
           (let ((pl (partition1 (cdr l) (car l) p)))
              (append (qsort1 p (car pl)) 
                      (cons (car l) (qsort1 p (cadr pl)))))))))

 (foo
  (lambda (f l)
    (cond 
      ((null? l) ())
      (else 
         (cons
            (cons (f (car l)) (cdr l))
            (map (lambda (lst) (cons (car l) lst)) (foo f (cdr l))))))))

 (tr-fac (lambda (n res) (cond ((zero? n) res) 
                               (else (tr-fac (- n 1) (* n res))))))

 (tr-add (lambda (l res) (cond ((null? l) res) 
                               (else (tr-add (cdr l) (+ (car l) res))))))

 (tr-mul (lambda (l res) (cond ((null? l) res) 
                               (else (tr-mul (cdr l) (* (car l) res))))))

 (slow-primep (lambda (n) (= (modulo (tr-fac (- n 1) 1) n) (- n 1))))

 (transpose1
   (lambda (m)
     (cond ((null? (cdr m)) (map list (car m)))
           (else (map cons (car m) (transpose1 (cdr m)))))))

 (transpose2
   (lambda (m)
     (cond ((null? (cdar m)) (list (map car m)))
           (else (cons (map car m) (transpose2 (map cdr m)))))))

 (transpose3 (lambda (m) (apply map list m)))

)
)

(values)

