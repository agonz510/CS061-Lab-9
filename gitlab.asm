;=================================================
; Name: Alejandro Gonzalez-Mejia
; Email: agonz510@ucr.edu
; 
; Lab: lab 9
; Lab section: 024
; TA: James Luo
; 
;=================================================
.orig x3000
LD R6, STACK_ADDR
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
LD R1, DEC_4
LD R2, push_val_ptr
JSRR R2

;push_val(3) pushes the value 3 onto the stack [4,3]
LD R1, DEC_3
LD R2, push_val_ptr
JSRR R2


;push_val(2) pushes the value 2 onto the stack [4,3,2]
LD R1, DEC_2
LD R2, push_val_ptr
JSRR R2


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R2, add_val_ptr
JSRR R2

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R2, add_val_ptr
JSRR R2


;move the top value of the stack into r4
LDR R4, R6, #0
ADD R6, R6, #1

HALT
;===========
;LOCAL DATA
;===========
STACK_ADDR      .FILL xFE00
push_val_ptr    .FILL x3400
add_val_ptr     .FILL x3800
DEC_4           .FILL #4
DEC_3           .FILL #3
DEC_2           .FILL #2
.end



.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
;==========================================================================================
; Doesn't actually change any registers; this sub is only here to add a number to the stack
;==========================================================================================

ADD R6, R6, #-1     ;Stores value
STR R1, R6, #0

ret
.end



.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
;=========================================================
; Stores top 2 values of stack and removes them, adds them
; and pushes results to the top of the stack.
;=========================================================
ST R7, backup_r7_3800

LDR R3, R6, #0      ;Stores and removes top value
ADD R6, R6, #1

LDR R5, R6, #0      ;Stores and removes second value
ADD R6, R6, #1

ADD R1, R3, R5      ;Adds them

ADD R6, R6, #-1     ;Stores new value back into the stack
STR R1, R6, #0

LD R7, backup_r7_3800
ret
;============
;x3800 DATA
;============
backup_r7_3800  .BLKW #1
.end



.orig x4200 ;;data you might need

.end
