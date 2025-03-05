;tokenizer
;input = String
;output = List of tokens

(setq token nil)
(setf listaPreTokens nil)
(setf listaTokens nil)

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
        do (if (not (char= (char input i) #\Space))
                ;not returns content if value false, otherwise return nil
                    ;char= compares characters
                                    ;char gets element of string by index.
            (progn ;progn executes multiple expressions in the then
                      (push (char input i) token)
                      ;push adds an element to the beginning of a list
                      (loop for j from (1+ i) below (length input)
                            do (if (not (char= (char input j) #\Space))
                                   (push (char input j) token)
                                   (return)))
                      (setf token (nreverse token))
                      ;nreverse returns the reverse of a list
            )
            (progn
                  (push (concatenar (nreverse token)) listaPreTokens)
                  (setf token nil)
            )
          )
  )
)

(defun tokenizerWithStructure (listaPreTokens)
  (loop for i from 0 below (length listaPreTokens)
    do (if (char= (char (elt listaPreTokens i) 0) #\()
            (loop while (not (char= (char (elt listaPreTokens i) 0) #\)))
              do (progn
                (push (elt listaPreTokens i) token)
                (incf i) ;incrementa i
                 ))
            (progn
              (push (concatenar (nreverse token)) listaTokens)
              (setf token nil)
            )
        )
  )      
)

;test
(format t "Ingrese la expresion dejando un espacio entre atoms~%")
(let ((a (read)))
  (tokenizerNoStructure (princ-to-string a))
  (tokenizerWithStructure (listaPreTokens))
  (format t "Tokens: ~a~%" listaTokens)
)