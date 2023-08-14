;; Load necessary libraries
(import (chicken random))

;; absolute value
(define (abso x) (if (< x 0) (* -1 x) x))

;; newtons method of finding squares
(define (sqrt guess number)
        (if (< (abso(- (* guess guess) number)) 0.01) ; if the square of guess is < number => return 0.01
        guess ; take another guess with return val of last expr
        (sqrt (/ (+ guess (/ number guess)) 2) number))) ;  average guess and (number / guess), and return

;; Define the main function
(define (main)
  ;; Loop from 0 to 999999
  (let loop ((i 0)  ; Counter for the loop
             (res 0.0))  ; Result storage
    (if (< i 1000000)  ; Check if the loop should continue
	(let* ((r (pseudo-random-integer 8192))  ; Generate a random 32-bit integer
               (q (sqrt 1 r)))  ; Apply Q_rsqrt function
          (loop (+ i 1) q))  ; Recursively continue the loop
        0)))  ; Return 0 when the loop is complete

;; Call the main function to run the program
(display (main))  ; Display the result of the main function
(newline)  ; Add a newline for cleaner output
