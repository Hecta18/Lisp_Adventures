;listas
(format t "~a~%" (list 'a 'b))
(format t "~a~%" (list '(a b) '(a b)))
;car
(format t "~a~%" (car (quote (a b c))))
(format t "~a~%" (car '(a b c)))
;If x is a cons, car returns the car of that cons.
;If x is nil, car returns nil
;cdr
(format t "~a~%" (CDR '(a b c)))
(format t "~a~%" (CAR (CDR '(a b c))))
;variables
(defvar x)
(setq x 10) 
(format t "~a~%" (+ x 5))
(setq x '(a b c)) 
(format t "~a~%" (car x))
;Predicados
(format t "~a~%" (setq x (list 'a 'b 'c)))
(format t "~a~%" (listp x))
(format t "~a~%" (atom x))
;cond
(defvar y 20)
(setq x 10)
(format t "~a~%" (cond ((< x y) x)
;if x < y, return x
(t y)));equal to else, defoult case
;cond structure: test condition, body expression 
;(evaluated if test condition is true)
;funciones
(defun mi-menor (x y)
(cond ((< x y) x)
(t y)
)
)
(format t "~a~%" (mi-menor 20 6))
;modulo
(format t "~a~%" (REM 6 5))
;funcion propia
(defun mi-par(x)
(cond ((= (REM x 2) 0)"es par")(t "es impar"))
)
(format t "~a~%" (mi-par 5))
(format t "~a~%" (mi-par 6))