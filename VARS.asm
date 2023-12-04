.model small
.stack 100h

; output:
; ***
; ***
; ***

.data
  r db 3 ; define variable r with initial value of 3
  c db 3 ; define variable c with initial value of 3

.code
  mov ax, @data
  mov ds, ax ; initialize data segment

  ; loop through rows
  mov cl, r   
  mov ah, 02h
  y: mov r, cl

  ; loop through columns
  mov cl, c
  mov dl, "*"
  x: int 21h
  loop x

  ; move to next line
  mov dl, 0ah
  int 21h
  mov dl, 0dh
  int 21h

  ; decrement row counter and loop
  mov cl,r
  loop y

  ; exit program
  mov ah, 4ah
  int 21h
end