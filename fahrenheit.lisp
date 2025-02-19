(
defun conversion (c)
  (format nil "~a° Fahrenheit son ~,2F° Cel" c (+ (* 9/5 c) 32))
)

(
let((c (read)))
  (format t "~%~a~%" (conversion c))
)