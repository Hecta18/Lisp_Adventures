;tokenizer
;input = String
;output = Split deL 

setq token '()
setq listaTokens '()

(defun concatenar (list)
  (with-output-to-string (stream)
  ;creates a character output stream, 
  ;performs a series of operations that may send results to this stream, 
  ;and then closes the stream.
    (dolist (element list)
    ;dolist iterates over the elements of a list. 
    ;The body of dolist consists of a series of tags and statements.
      (format stream "~a" element))))
      ;format writes the elements to the stream

(defun recorrerString (input)
  "Tokenizes the input string."
  ;rango de caracteres
  (loop for i from 0 below (length input)
        ;es un espacio?
        do (if (not (string= (check (char input i)) "space" ))
              (progn ;used to execute multiple expressions in the then
                        (setq listaToken (append listaToken (list (input i)))
                        (recorrerString (subseq input (1+ i) (length input)))
                        )
                      )  
        ;string= compares strings
        ;not returns content if value false, otherwise return nil
            )else(
                  (if (string= (check (char input (1+ i)) "space"))
                      (progn
                        (setq listaToken (append listaToken (list (input i)))
                        (recorrerString (subseq input (1+ i) (length input)))
                        )
                      )
                  )
  )
)

(defun check (char)
  "Checks the type of the character."
  (case char
    (#\Space "space")
    (#\( "parenthesisOpen")
    (#\) "parenthesisClose")
    ((#\+ #\- #\* #\/) "operator")
    ((#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9) "number")
    (t "unknown"))) ; Default case for characters not explicitly handled
;assignments?
;returns?
;imports?
;exports?
;modules?
;classes?
;methods?
;attributes?
;inheritance?
;interfaces?
;exceptions
;try?   