#lang slideshow
(define prompt (open-input-file "Prompt1.txt"))

(define 1st (read-char prompt))
(display 1st)

;
;(define (printFileCharacters filename)
;  (define input-port (open-input-file filename))
  
;  (define (readAndPrintChar)
;    (let ((char (read-char input-port)))
;      (cond
;        ((eof-object? char) ; Check for end of file
;         (close-input-port input-port)) ; Close the file
;        (else
;         (display char) ; Print the character
;         (readAndPrintChar))))) ; Recursively read the next character
  
;  (readAndPrintChar) ; Start reading and printing characters
  
;  (close-input-port input-port)) ; Close the file when done

(close-input-port prompt)