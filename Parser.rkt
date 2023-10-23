#lang slideshow

;This is all of our variables that we will use
(define currentLine "") ;tracks the current line
(define previousWasOperator #f) ;tracks if the previous word was an operator
(define lineCounter 0) ;tracks what line we are on
(define error #f) ;tracks if there if there is an error in the code
(define operators (list "/" "*" "-" "=" "+" ">" "<")) ;list of operators

;methods that change data in our above variables
(define (toggleOperator num)
  (if previousWasOperator
     (set! error #t)
     (set! previousWasOperator #t)))

;methods that run checks on the current word
(define (checkWord str) ;checks if there was a previous operator
  (set! currentLine str)
  (if(member str operators)
     (toggleOperator 3)
     (display "Not there"))
  (display str))

(define (is-alphanumeric? str);checks to see if this is alphanumric
  (string? str) 
  (regexp-match #rx"^[a-zA-Z0-9]+$" str))

;breaks down each line into words
(define (parse-statement str)
  (define sub-strings (string-split str " "))
    (for-each checkWord sub-strings))

;checks if the end of file was handled properly
(define (properEnding str)
  (display "This is the end of the file: ")
  (display str)
  (if (string=? "$$" (string-trim str))
      (display "Accept")
      (display "File Not Properly Ended")))


;main method, breaks it downn by line recursively
(define (parse filename); define method 
  (define input-port (open-input-file filename))
  
  (define (parse)
    (let ((line (read-line input-port)))
      (cond
        ((eof-object? line) ; Check for end of file
         (properEnding currentLine)
         (close-input-port input-port)) ; Close the file
        (else
         (parse-statement line)
         (parse))))) ; Recursively read the next character

  (parse) ; Start reading and printing characters
  
  (close-input-port input-port)) ; Close the file when done



;END OF PROGRAM ADDITIONAL RESOURCES BELOW

(define (pie input)
  input)

(define (testing input) ;if we call this it will run the top code too
  (parse "Prompt1.txt")
  (string-append (pie input) "exam"))


(define julio "It's equal!")

;CONDITIONALS
;if statements (with equality in numbers)
(if(equal? 1 1)
   julio
   'not)

;Reminder to study more!

(parse "SampleCode/code001.txt")

