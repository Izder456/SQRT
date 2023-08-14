;; Load necessary libraries
(import (srfi 27))  ; Library for bitwise operations

;; Define the Q_rsqrt function
(define (Q-rsqrt number)
  ;; Constants
  (let* ((threehalfs 1.5)
         ;; Calculate half of the input number
         (x2 (* number 0.5))
         ;; Convert the input number to bytes for manipulation
         (y number)
         ;; Convert bytes to a 32-bit unsigned integer
         (i (vector-ref (bytes->u32vector 
                (bytes-ref (u32vector->bytes 
                  (vector->u32vector 
                    (list->vector (list 0x5f3759df))))) 0) 0))
         ;; Convert the floating-point value y to bytes
         (int-y (u32vector->bytes (vector 
                  (u32vector-ref (bytes->u32vector 
                    (u32vector->bytes (vector y))) 0)))))
    ;; Perform bit manipulation on the integer representation of y
    (set-u32vector! int-y 0 (- (u32vector-ref int-y 0) (arithmetic-shift i -1)))
    ;; Convert the bytes back to a floating-point value
    (set! y (bytes->single-float int-y))
    ;; Perform the Quake inverse square root algorithm
    (set! y (* y (- threehalfs (* x2 (* y y)))))
    y))  ; Return the result of the algorithm

;; Define the main function
(define (main)
  ;; Loop from 0 to 999999
  (let loop ((i 0)  ; Counter for the loop
             (res 0.0))  ; Result storage
    (if (< i 1000000)  ; Check if the loop should continue
        (let* ((r (random 4294967296))  ; Generate a random 32-bit integer
               (q (Q-rsqrt (single-float r))))  ; Apply Q_rsqrt function
          (loop (+ i 1) q))  ; Recursively continue the loop
        0)))  ; Return 0 when the loop is complete

;; Call the main function to run the program
(display (main))  ; Display the result of the main function
(newline)  ; Add a newline for cleaner output
