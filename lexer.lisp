;tokenizer
;input = String
;output = Split deL 

setq token '()
setq listaPreTokens '()
setq listaTokens '()

(defun concatenar (list)
  ;Concatenates the elements of a list into a string.
  (with-output-to-string (stream)
  ;creates a character output stream, 
  ;performs a series of operations that may send results to this stream, 
  ;and then closes the stream.
    (dolist (element list)
    ;dolist iterates over the elements of a list. 
    ;The body of dolist consists of a series of tags and statements.
      (format stream "~a" element))))
      ;format writes the elements to the stream

(defun tokenizerNoStructure (input)
  ;Tokenizes the input string without considering the structure
  ;rango de caracteres
  (loop for i from 0 below (length input)
        ;es un espacio?
        do (if (not (string= (char input i) " " ))
                ;not returns content if value false, otherwise return nil
                    ;string= compares strings
                                    ;char gets element of string by index.
              (progn ;progn executes multiple expressions in the then
                        (setq token (append token (input i))
                        (recorrerString (subseq input (1+ i) (length input)))
                        )
                      )
            )else(
                  (setq listaPreTokens (append listaPreTokens (list (concatenar token))))
                  (setq token '())
            )
  )
)

(defun tokenizerWithStructure (listaPreTokens)
  (loop for i from 0 below (length listaPreTokens)
    do (if (string= (char (listaPreTokens i) 0) quote"(")
            (while (not (string= (char (listaPreTokens i) 0) quote")" ))
                   (setq token (append token (listaPreTokens i)))
            )
        )else(
                (setq listaTokens (append listaTokens (list (concatenar token))))
                (setq token '())
              )
  )
)

;test
(format t "Ingrese la expresion dejando un espacio entre atoms~%")
(let ((a (read)))
  (format t "Resultado:~a~%" (tokenizerwithstructure (tokenizernostructure a)))
)