.model small
.stack 100h
.data
  msg1 db "Input number of rows: $"
  msg2 db "Input number of columns: $"
  rows db 0
  cols db 0 
  star db 0ah, 0dh , "$"

.code
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h ; Set AH register to 09h to print a string
  mov dx, offset msg1 ; Load DX register with the offset of message 1
  int 21h ; Call DOS interrupt 21h to print the string
  
  mov ah, 01h ; number of rows gets stored to al
  int 21h
  mov rows, al 
  sub rows, 30h

  mov ah, 09h ; Set AH register to 09h to print a string
  mov dx, offset msg2 ; Load DX register with the offset of message 1
  int 21h ; Call DOS interrupt 21h to print the string

  mov ah, 01h ; number of columns gets stored to al
  int 21h
  mov cols, al 
  sub cols, 30h

  ; loop through rows
  mov ah, 02h
  mov cl, rows
  y: mov 
end