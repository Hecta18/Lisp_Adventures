;tokenizer
;input = String
;output = List of tokens

(defvar token nil)
(defvar listaPreTokens nil)
(defvar listaTokens nil)
;defvar to declare global variables

(defun concatenar (list)
  "Concatenates the elements of a list into a string."
  (with-output-to-string (stream);with-output-to-string is a macro that captures the output of the code inside it
    (dolist (element list)
    ;dolist is a macro that iterates over a list
      (format stream "~a" element))))

(defun tokenizerNoStructure (input)
  "Tokenizes the input string without considering the structure."
  (loop for i from 0 below (length input)
        do (if (not (char= (char input i) #\Space))
        ;not is a function that returns true if the argument is false
        ;char= compares characters
               (progn;to use more than one expression in a loop
                 (push (char input i) token)
                 ;push adds an element to a list in the first position
                 (loop for j from (1+ i) below (length input)
                       do (if (char= (char input j) #\Space)
                              (tokenizerNoStructure (subseq input (1+ j) (length input)))
                              (push (char input j) token))
                              )
                 (setf token (nreverse token))
                 ;nreverse returns the reverse of a list
                 ;necesario ya que push agrega al principio
                 (push (concatenar token) listaPreTokens)
                 (setf token nil))
               (progn
                 (when token
                 ;when macro that executes code if condition true
                   (push (concatenar (nreverse token)) listaPreTokens))
                 (setf token nil)))))


(defun tokenizerWithStructure (listaPreTokens)
  "Tokenizes the input list considering the structure."
  (loop for i from 0 below (length listaPreTokens)
        do (if (char= (char (elt listaPreTokens i) 0) #\()
        ;elt returns the element of a list at a given index
               (loop while (and (< i (length listaPreTokens))
                                (not (char= (char (elt listaPreTokens i) 0) #\))))
                     do (progn
                          (push (elt listaPreTokens i) token)
                          (incf i))
                          ;incf increments a variable
               (progn
                 (push (concatenar (nreverse token)) listaTokens)
                 (setf token nil)))
        (when token
          (push (concatenar (nreverse token)) listaTokens)
          (setf token nil))))
)

; Test
(format t "Ingrese la expresion dejando un espacio entre atoms~%")
;format is a function that writes to the output stream
(let ((a (read-line)))
  (tokenizerNoStructure a)
  (tokenizerWithStructure listaPreTokens)
  (format t "Tokens: ~a~%" listaTokens))