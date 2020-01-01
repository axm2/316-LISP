Solutions to LISP Exercises 2
-----------------------------
1.(a) y   (b) n   (c) n   (d) y   (e) n   (f) y   (g) y

2. (a) atom      (b) list of 4 elements    (c) neither
   (d) neither   (e) list of 2 elements    (f) neither
   (g) list of 3 elements    (h) list of 2 elements

3. > (setq x '(a b c))
   (A B C)
   > (append x x)
   (A B C A B C)

4. (QUOTE (QUOTE (A)))
   'a = (QUOTE A) is a list of two symbols that evaluates to the symbol A.

5. (a) (setq y (list 'a 'b))
   (b) (list 'd (car y))

6. (defun sqr (side)
      (list (* 4 side) (* side side)))

7. (defun quadratic (a b c)
       (list (/ (+ (- b)
                   (sqrt (- (* b b) (* 4 a c))))
                (* 2 a))
             (/ (- (- b)
                   (sqrt (- (* b b) (* 4 a c))))
                (* 2 a))))

8. (defun area-of-circle (radius)
       (* pi radius radius))

9. (defun ftoc (fahrenheit)
       (* (- fahrenheit 32.0) 5/9))

10. (defun rotate-left (lst)
       (append (cdr lst) (list (car lst))))

11. (defun square (x) (* x x))

    (defun euclidean-distance (p1 p2)
       (sqrt (+ (square (- (car p1) (car p2)))
                (square (- (cadr p1) (cadr p2))))))

12. (defun head (lst) (car lst))
    (defun tail (lst) (cdr lst))

13. (defun switch (2-list)
       (list (cadr 2-list) (car 2-list)))

14. 70

15.(a) (car (cdr (cdr E)))
   (b) (car (cadr (cadr E))) = (car   (car (cdr   (car (cdr E)) )) )
   (c) (car (cadr (cadr (car (car E))))) = (car (car (cdr (car (cdr (car (car E)))))))

16.(a) (cons 'a (cons 'b (cons 'x (cons 'd nil))))

   (b) (x d) =                 (cons 'x
                                     (cons 'd 
                                           nil))
       Hence:
       (b (x d)) = (cons 'b
                         (cons (cons 'x
                                     (cons 'd 
                                           nil))
                               nil))

       Hence (a (b (x d))) =
       (cons 'a
             (cons (cons 'b
                         (cons (cons 'x
                                     (cons 'd 
                                           nil))
                               nil))
                   nil))

   (c) (b (x) d) =                  (cons 'b
                                          (cons (cons 'x nil)
                                                (cons 'd 
                                                      nil)))
       Hence:
       (a (b (x) d)) =  (cons 'a
                              (cons (cons 'b
                                          (cons (cons 'x nil)
                                                (cons 'd 
                                                       nil)))
                                    nil))
       Hence:
       (((a (b (x) d)))) =
           (cons (cons (cons 'a
                             (cons (cons 'b
                                         (cons (cons 'x nil)
                                               (cons 'd 
                                                     nil)))
                                   nil))
                        nil)
                  nil)

17. (list (cons (list (first (first E)) 
                      (second (first E)))  
                (rest (rest (first E))))
          (cons 'a 
                (cons 'b 
                      (rest (rest (third E))))))

18. (list (cons (first (first E)) 
                (cons 'a 
                      (rest (rest (first E)))))
          (second (second E))
          (third (third E))
          (cons (third (second E)) 
                (rest (rest (third E)))))
 
19. (list (append (first E) (list (second (second E)))) 
          (append (second E) (rest (rest (third E)))))

20. (list (cons 'a (rest (first E)))
          (cons (first (first E)) 
                (cons (list (second (third E))
                            (third (third E)))
                      (rest (rest (rest (third E)))))))

=============================================================
2nd way of writing the above solutions to 17 - 20
[using (car E), (cadr E), (caddr E), and (cdr e) instead of 
(first e), (second e), (third e), and (rest e)]:

17. (list (cons (list (caar E) (cadar E))  (cddar E))
          (cons 'a 
                (cons 'b (cddr (caddr E)))))

    Note that (cddr (caddr E)) cannot be written as (cddaddr E)
    because c...r functions are only predefined for up to 4 a's and d's.

18. (list (cons (caar E) 
                (cons 'a (cddar E)))
          (cadadr E)
          (caddr (caddr E))
          (cons (caddr (cadr E)) (cddr (caddr E))))

    Note that (caddr (caddr E)), (caddr (cadr E)), and (cddr (caddr E)) 
    cannot be written as (caddaddr E), (caddadr E), and (cddaddr E) 
    because c...r functions are only predefined for up to 4 a's and d's.
 
19. (list (append (car E) (list (cadadr E))) 
          (append (cadr E) (cddr (caddr E))))

20. (list (cons 'a (cdar E))
          (cons (caar E) 
                (cons (list (cadr (caddr E))
                            (caddr (caddr E)))
                      (cdddr (caddr E)))))
