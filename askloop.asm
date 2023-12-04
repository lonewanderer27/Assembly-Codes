.model small
.stack 100h
.data
  msg1 db "Input number of loop *: $"
  inp db 0
  msg2 db 0ah, 0dh , "$"

.code
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h ; Set AH register to 09h to print a string

  mov dx, offset msg1 ; Load DX register with the offset of message 1
  int 21h ; Call DOS interrupt 21h to print the string
  
  mov ah, 01h ; number of loop gets stored to al
  int 21h
  mov inp, al 
  sub inp, 30h
  
  mov ah, 09h
  mov dx, offset msg2
  int 21h
  
  mov cl, inp
  mov ah, 02h
  mov dl, "*"
  x: int 21h
  loop x
  
  ; Exit program
  mov ah, 4ch ; Set AH register to 4ch to exit program
  int 21h ; Call DOS interrupt 21h to exit
end