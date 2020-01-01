; Question 1 
; (a) Yes, an atom is a symbolic expression that is not a list
; (b) No, a number cannot be a variable name, only symbols can be variable names.
; (c) No, a list can't be a variable because a list is not a symbol
; (d) Yes, an atom can have no value
; (e) No 
; (f) Yes for example (defparameter SWAG (string "SWAG"))
; (g) Yes for example (setf Q '(A B C)) (setf R '(A B C))
;
; Question 2 
; (a) single atom
; (b) single list with 4 elements
; (c) neither
; (d) neither
; (e) single list with 2 elements
; (f) neither
; (g) single list with 3 elements
; (h) single list with 2 elements
;
; Question 3 
; (setf X '(A B C))
; (list (first X) (second X) (third X) (first X) (second X) (third X))
;
; Question 4
; (quote (quote A))
; A single list with 2 elements
;
; Question 5
; (a) (SETF Y (quote (A B)))
; (b) (list (quote D) (first Y))
;
; Question 6
 (defun SQR (X)
     (* X X))
;
; Question 7
 (defun QUADRATIC (A B C)
     (list 
         (/ (+ (- B) (SQRT (- (* B B) (* 4 A C)))) (* 2 A)) 
         (/ (- (- B) (SQRT (- (* B B) (* 4 A C)))) (* 2 A))))
