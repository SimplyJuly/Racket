#lang slideshow
;(define prompt (open-input-file "Prompt1.txt"))

;(define 1st (read-char prompt))
;(display 1st)

(define (parse filename); define method 
  (define input-port (open-input-file filename))
  
  (define (parse)
    (let ((char (read-char input-port)))
      (cond
        ((eof-object? char) ; Check for end of file
         (close-input-port input-port)) ; Close the file
        (else
         (display char) ; Print the character
         (parse))))) ; Recursively read the next character
  
  (parse) ; Start reading and printing characters
  
  (close-input-port input-port)) ; Close the file when done

;type it like this (printFileCharacters "Prompt1.txt")

;(close-input-port prompt)