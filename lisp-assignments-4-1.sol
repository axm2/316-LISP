
LISP Assignments 4: Section 1
-----------------------------

A.  (+ (car L) X)

B.  (cond ((minusp (car L))  (cons (car L) X))
          (t  X)) 

C.  (cons (+ N (car L)) X) 

D.  (cond ((<= N (car L))  (cons N L))         
          (t  (cons (car L) X)))

E.  (insert (car L) X)  

F.  (list (cons (car L) (cadr X))
          (car X))

G.  (cond ((< (car L) P)  (list (cons (car L) (car X)) (cadr X)))
          (t  (list (car X) (cons (car L) (cadr X)))))



