;Solution to Problem 1

(defun sum (L)
  (if (NULL L) 0
    (let ((X (sum (cdr L))))
      (if (car L) (+ X (car L)) 0))))

;Solution to Problem 2

(defun neg-nums (L)
  (if (NULL L) NIL
    (let ((X (neg-nums (cdr L))))
      (if (minusp (car L)) (append (list (car L)) X) X))))

;Solution to Problem 3

(defun inc-list-2 (L N)
  (if (NULL L) NIL
    (let ((X (inc-list-2 (cdr L) N)))
      (if (car L) (append (list (+ (car L) N)) X) NIL))))

;Solution to Problem 4

(defun insert (N L)
  (if (NULL L) (list N)
    (let ((X (insert N (cdr L))))
      (if (<= N (car L)) (cons N L) (cons (car L) X)))))

;Solution to Problem 5

(defun isort (L)
  (if (NULL L) NIL
    (let ((x (isort (cdr L))))
      (insert (car L) X)))) 

;Solution to Problem 6

(defun split-list (L)
  (if (NULL L) (list nil nil)
    (let ((X (split-list (cdr L))))
      (cons (cons (car L) (cadr X)) (list (car X))))))

;Solution to Problem 7

(defun partition (L P)
  (if (NULL L) (list nil nil)
    (let ((X (partition (cdr L) P)))
      (if (< (car L) P) 
	;Put it in the first section
	(cons (cons (car L) (car X)) (cdr X))
	;Put it in the second section
	(list (car X) (cons (car L) (cadr X)))))))

;Solution to Problem 8

(defun pos (e l)
  (cond ((endp L) 0)
	((equal e (car l)) 1)
	(t (let ((x (pos e (cdr l))))
	     (if (zerop x) 0 (+ x 1))))))

;Solution to Problem 9

(defun split-nums (N)
  (if (zerop N) '((0) NIL)
    (let ((X (split-nums (- N 1))))
      (if (zerop (mod N 2))
	(cons (cons N (car X)) (cdr X))
	(list (car X) (cons N (cadr X)))))))

;Solution to Problem 10

(defun set-union (s1 s2)
  (if (NULL s2) s1
    (let ((X (set-union s1 (cdr s2))))
      (if (not (member (car s2) s1))
	(append X (list (car s2)))
	X))))

;Solution to Problem 11

(defun set-remove (x s)
  (if (NULL S) NIL
    (let ((Y (set-remove x (cdr s))))
      (if (equal (car s) x) Y
	(append (list (car S)) Y)))))

;Solution to Problem 12

(defun set-excl-union (s1 s2)
  (if (null s2) s1
    (let ((X (set-excl-union s1 (cdr s2))))
      (if (not (member (car s2) s1))
	(append X (list (car s2)))
	(set-remove (car s2) X)))))

;Solution to Problem 13

(defun singletons (e)
  (if (null e) NIL
    (let ((X (singletons (cdr e))))
      (if (not (member (car e) (cdr e)))
	(append X (list (car e)))
	(set-remove (car e) x)))))
