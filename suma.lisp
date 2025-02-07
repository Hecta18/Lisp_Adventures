(defun SUMAR (a b)(+ a b))
; ingreso de datos
(format t "~%Ingrese el primer valor~%")
;let and let* create new variable bindings and execute a 
;series of forms that use these bindings. let performs the 
;bindings in parallel and let* does them sequentially
(let ((a (read)))
;read parses the printed representation of an object from 
;input-stream and builds such an object.
    (format t "~%Ingrese el segundo valor~%")
    (let ((b (read)))
        (format t "El resultado es:~a~%" (SUMAR a b))
        (format t "El resultado es:~a~%" (+ (* a a) (/ a a)))
        (format t "El resultado es:~a~%" (/ (* 5 (+ a b)) 5))))