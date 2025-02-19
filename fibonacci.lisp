(defun fibo (n)
  (let ((numeros (list 0 1)))
    (cond
      ((< n 2) (subseq numeros 0 n));subseq devuelve los primeros n elementos de numeros
      (t
       (loop for i from 2 to (1- n) do
            (setf numeros (append numeros (list (+ (nth (- i 1) numeros) (nth (- i 2) numeros))))))
            ;setf actualiza la lista numeros con el nuevo valor
            ;append agrega un nuevo elemento a la lista numeros
            ;nth devuelve el valor en la posicion indicada
       numeros))))

(
    let((n (read)));let es una forma de declarar variables en una funcion
        (format t "~%La fila de fibonacci de ~a es: ~a~%" n (fibo n))
)