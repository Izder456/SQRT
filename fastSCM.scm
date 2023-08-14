;; Load necessary libraries
(import (chicken random))

;; Define the main function
(define (main)
  ;; Loop from 0 to 999999
  (let loop ((i 0)  ; Counter for the loop
             (res 0.0))  ; Result storage
    (if (< i 1000000)  ; Check if the loop should continue
	(let* ((r (pseudo-random-integer 8192))  ; Generate a random 32-bit integer
               (q (sqrt r)))  ; Apply Q_rsqrt function
          (loop (+ i 1) q))  ; Recursively continue the loop
        0)))  ; Return 0 when the loop is complete

;; Call the main function to run the program
(display (main))  ; Display the result of the main function
(newline)  ; Add a newline for cleaner output
