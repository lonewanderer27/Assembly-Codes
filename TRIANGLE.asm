.model small
.stack 100h

; output:
; *
; **
; ***
; ****
; *****

.data
  r db 5 ; define variable r with initial value of 3
  c db 1 ; define variable c with initial value of 3\

.code
  mov ax, @data
  mov ds, ax ; initialize data segment
  
  ; loop through rows
  mov ah, 02h
  mov cl, r
  y: mov r, cl
  mov cl, c
  mov dl, '*'
  x: int 21h
  loop x
  
  ; move to next line
  mov dl, 0ah
  int 21h
  mov dl, 0dh
  int 21h
  
  ; increment columns
  mov cl, r
  inc c
  loop y
  
  ; exit program
  mov ah, 4ch
  int 21h
end