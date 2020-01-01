     C SCI 316 (Kong):  LISP Exercises 1 (Not for credit) 

1. Write a LISP S-expression that multiplies 30 by the result of 7 minus 2.  
   To do this, you must write a LISP function call that multiplies two things;
   one of these things will itself be a LISP function call.

  Solution: (* 30 (- 7 2))

2. [Exercise 1 on page 15 of Wilensky]  Write Lisp S-expressions to evaluate 
   each of the following:      
           2   2                           3   3     3    3
      (a) 3 + 4   (b) 3*17 + 4*19    (c) 12 + 1  - (9 + 10 )              

  Solution: (a) (+ (* 3 3) (* 4 4))  (b) (+ (* 3 17) (* 4 19))
  (c) (- (+ (* 12 12 12) (* 1 1 1)) (+ (* 9 9 9) (* 10 10 10)))

3.(a) Write a LISP S-expression that divides 30 by the result of 7 minus 3, 
      in such a way that the result is a rational number (i.e., 15/2).      

  Solution: (/ 30 (- 7 3))

  (b) Write a LISP S-expression that divides 30 by the result of 7 minus 3, 
      in such a way that the result is a floating-point number (i.e., 7.5).  
      Do not use the FLOAT function.

  Solution: (/ 30.0 (- 7 3))

4. [Exercise 3 on page 16 of Wilensky]  Write a LISP S-expression that 
   computes the average of the following five numbers: 83, 83, 85, 91, 97.  
   Do this in such a way that the result is rational, and then in such a 
   way that the result is a floating-point number.  

  Solution:  (/ (+ 83 83 85 91 97) 5) and
             (/ (+ 83 83 85 91 97) 5.0)

5. Lisp always prints rational numbers (fractions) in lowest terms; for 
   example, if you enter the number 20/12 at Clisp's > prompt (with no spaces 
   before or after the "/") then Clisp will print the equivalent number 5/3. 
   Write a number that you can enter at Clisp's > prompt to determine whether 
   or not the two integers 7,360,001,711 and 58,879,948,151 are relatively
   prime. If they are not relatively prime, then find their greatest common 
   divisor. (Two integers are said to be relatively prime, or coprime, if 
   no integer greater than 1 divides both of them. For example, 20 and 9 are 
   relatively prime; but 10 and 8 are not relatively prime because 2 divides 
   both 10 and 8.)

  Solution: When you enter the number 7360001711/58879948151 at Clisp's 
  prompt, Clisp prints 112303/898423. Therefore 7360001711/58879948151 is 
  equal to 112303/898423, and the latter is in lowest terms. We also see 
  that 7360001711/112303 = 58879948151/898423 = 65537 is a common divisor of
  7360001711 and 58879948151, and is their greatest common divisor because 
  112303/898423 is in lowest terms. So our conclusions are that the two 
  integers are not relatively prime and that their greatest common divisor 
  is 65537.
              
6. [Exercise 4 on p. 16 of Wilensky]  The LISP function SQRT returns the 
   non-negative square root of any non-negative real argument.  Use this 
   function to write S-expressions that evaluate to the roots of the 
   following equation:     2
                          x  - 11x - 1302 = 0

  Solution: (/ (+ (- -11) (SQRT (- (* -11 -11)(* 4 1 -1302)))) (* 2 1))
        and (/ (- (- -11) (SQRT (- (* -11 -11)(* 4 1 -1302)))) (* 2 1))

7. [Cf. exercise 7 on p. 17 of Wilensky] Devise a test to determine the order 
   in which LISP evaluates function arguments.   You may assume that the 
   order is either left-to-right or right-to-left, and that the same order is 
   used in all LISP function calls.  

  Solution:   Evaluation of (- x (setf x 4)) (without first
  giving a value to x) produces an error message that says x has
  no value.  So the argument evaluation order is left-to-right.
  This is, in fact, true of all function calls in Common LISP.
  In this respect Common LISP is like Java, and unlike C++ and
  Scheme.  (In C++ and Scheme, the order in which arguments are
  evaluated is not specified by the definition of the language,
  and is therefore implementation-dependent.  This makes the
  behavior of certain programs implementation-dependent, but also
  allows compilers to generate faster code in some cases.)
