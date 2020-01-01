;Solution to Problem 1

(defun MIN-2 (A B)
  (cond 
    ((not (AND (numberp A) (numberp B))) 'ERROR)
    ((> A B) B)
    ((<= A B ) A)))

;Solution to Problem 2

(defun SAFE-AVG (A B)
  (cond
    ((not (AND (numberp A) (numberp B))) NIL)
    (t (/ (+ A B) 2))))

;Solution to Problem 3

(defun ODD-GT-MILLION (A)
  (cond
    ((not (integerp a)) NIL)
    ((not (oddp a)) NIL)
    ((not (> A 1000000)) NIL)
    (t t)))

;Solution to Problem 4

(defun multiple-member (a b)
  (cond
    ((not (listp b)) nil)
    ((not(or (symbolp a) (numberp a))) nil)
    ( t  (member a (cdr (member a b))))))

;Solution to Problem 5

(defun MONTH->INTEGER (sym)
  (cond
    ((eq sym 'january)  1)
    ((eq sym 'febuary)  2)
    ((eq sym 'march)    3)
    ((eq sym 'april)    4)
    ((eq sym 'may)      5)
    ((eq sym 'june)     6)
    ((eq sym 'july)     7)
    ((eq sym 'august)    8)
    ((eq sym 'september) 9)
    ((eq sym 'october)  10)
    ((eq sym 'november) 11)
    ((eq sym 'december) 12)
    (t 'error)))

;Solution to Problem 6

(defun score->grade (s)
  (cond
    ((not (numberp s)) NIL)
    ((< s 60) 'F)
    ((< s 70) 'D)
    ((< s 73) 'C)
    ((< s 77) 'C+)
    ((< s 80) 'B-)
    ((< s 83) 'B)
    ((< s 87) 'B+)
    ((< s 90) 'A-)
    ((>= s 90) 'A)))

;Solution to Problem 7

(defun gt (a b)
  (and (and (numberp a) (numberp b)) (> a b)))

;Solution to Problem 8

(defun same-parity (a b) 
  (and (and (integerp a) (integerp b)) (or (and (oddp a) (oddp b)) (and (evenp a) (evenp b))))) 

;Solution to Problem 9

(defun safe-div (a b)
  (and (integerp a) (integerp b) (not (zerop b)) (/ a b)))
