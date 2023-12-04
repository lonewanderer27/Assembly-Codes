.model small
.stack 100h
.data
  msg1 db "Hello World!$", 0Dh, 0Ah
  msg2 db "Assembly Language$"

.code
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h
  mov dx, offset msg1
  int 21h
  mov dx, offset msg2
  int 21h
  
  ; Exit program
  mov ah, 4ch
  int 21h