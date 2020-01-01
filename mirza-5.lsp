; Solution to Problem 1

(defun index (N L)
  (if (null (car L)) 'ERROR
    (let ((X (index (- N 1) (cdr L))))
      (if (equal 1 N) (car L)
        X))))

; Solution to Problem 2

(defun min-first (L)
  (if (null (cdr L)) L
    (let ((X (min-first (cdr L))))
      (if (<= (car l) (car X )) 
        (cons (car l) (cdr L))
        (cons (car x) (cons (car l) (cdr X)))))))

; Solution to Problem 3

(defun ssort (L)
  (if (endp L) nil
    (let* ((L1 (min-first L))
           (X  (ssort (cdr L1))))
      (cons (car L1) x))))

; Partition function from assignment 4

(defun partition (L P)
  (if (NULL L) (list nil nil)
    (let ((X (partition (cdr L) P)))
      (if (< (car L) P)
        (cons (cons (car L) (car X)) (cdr X))
        (list (car X) (cons (car L) (cadr X)))))))

; Solution to Problem 4

(defun qsort (L)
  (if (endp L)
    nil
    (let ((pl (partition (cdr L) (car L))))
      (if (null (car pl))
        (cons (car L) (qsort (cdr L)))
        (append (qsort (car pl)) (qsort (cadr pl)))))))

; Solution to Problem 5

(defun merge-lists (L1 L2)
  (if (or (null L1) (null L2))
    (if (null L1) L2 L1)
    (if (< (car L1) (car L2))
      (cons (car L1) (merge-lists (cdr L1) L2))
      (cons (car L2) (merge-lists L1 (cdr L2))))))

; split-list function from assignment 4

(defun split-list (L)
  (if (NULL L) (list nil nil)
    (let ((X (split-list (cdr L))))
      (cons (cons (car L) (cadr X)) (list (car X))))))

; Solution to Problem 6

(defun msort (L)
  (if (null (cdr L))
    L
    (let ((X (split-list L)))
      (if (null (cadr x))
        (merge-lists (car X) (cadr X))
        (merge-lists (msort (car x)) (msort (cadr x)))))))

; Solution to Problem 7

(defun remove-adj-dupl (L)
  (if (null (cdr L))
    L
    (let ((X (remove-adj-dupl (cdr L))))
      (if (equal (car L) (car X))
        X
        (cons (car L) X)))))

; Solution to Problem 8

(defun unrepeated-elts (L)
  (cond ((null L) nil)
        ((or (endp (cdr L)) (not (equal (car L) (cadr L)))) (cons (car L) (unrepeated-elts (cdr L))))
        ((or (endp (cddr L)) (not (equal (car L) (caddr L)))) (unrepeated-elts (cddr L)))
        (t (unrepeated-elts (cdr L)))))

; Solution to Problem 9

(defun repeated-elts (L)
  (cond ((null L) nil)
        ((or (endp (cdr L)) (not (equal (car L) (cadr L)))) (repeated-elts (cdr L)))
        ((or (endp (cddr L)) (not (equal (car L) (caddr L)))) (cons (car L) (repeated-elts (cddr L))))
        (t (repeated-elts (cdr L)))))

; Solution to Problem 10

(defun count-repetitions (L)
  (if (null L) nil 
    (let ((x (count-repetitions (cdr L))))
      (if (equal (car L) (cadr L))
        (append (list (list (+ 1 (caar x)) (cadar x))) (cdr x))
        (append (cons (list 1 (car L)) x))))))

; Solution to Problem 11

(defun subset (f L)
  (if (null L)
    nil
    (let ((X (subset f (cdr L))))
      (if (funcall f (car L))
        (cons (car L) x)
        X))))

; Solution to Problem 12

(defun our-some (f L)
  (if (null L)
    nil
    (let ((X (our-some f (cdr L))))
      (if (funcall f (car L))
        L
        X))))

(defun our-every (f L)
  (if (null L)
    t
    (let ((X (our-every f (cdr L))))
      (if x (funcall f (car L))))))

; Solution to Problem 13

(defun partition1 (f L P)
  (if (endp L)
    (list nil nil)
    (let ((X (partition1 f (cdr L) P)))
      (if (funcall f (car L) P)
        (list (cons (car L) (car X)) (cadr X))
        (list (car X) (cons (car L) (cadr X)))))))
(DEFUN QSORT1 (f L)
       (IF (ENDP L)
           NIL
           (LET ((PL (PARTITION1 f (CDR L) (CAR L))))
                (append (QSORT1 f (car PL)) (cons (car L) (QSORT1 f (cadr PL)))))))


; Solution to Problem 14

(defun foo (f L)
  (if (endp L)
    nil
    (append (list (cons (funcall f (car L)) (cdr L)))
            (mapcar (lambda (L1) (cons (car L) L1)) (foo f (cdr L))))))

; Solution to Problem 15a

(defun tr-add (L acc)
  (if (null L)
    acc
    (tr-add (cdr L) (+ (car L) acc))))

(defun tr-mul (L acc)
  (if (null L)
    acc
    (tr-mul (cdr L) (* (car L) acc))))

(defun tr-fac (x acc)
  (if (zerop x)
    acc
    (tr-fac (- x 1) (* x acc))))

; Solution to Problem 15b

(defun slow-primep (N)
  (if (equal (mod (tr-fac (- n 1) 1) n) (- n 1))
    t
    nil))

;Solution to Problem 16a

(defun transpose1 (m)
  (cond ((null (cdr m)) (mapcar #'list (car m)))
        (t (mapcar #'cons (car m) (transpose1 (cdr m))))))

; Solution to Problem 16b

(defun transpose2 (m)
  (cond ((null (cdar m)) (list (mapcar #'car m)))
        (t (cons (mapcar #'car m) (transpose2 (mapcar #'cdr m))))))

; Solution to Problem 16c

(defun transpose3 (m)
  (apply #'mapcar #'list m))
