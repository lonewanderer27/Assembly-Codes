.model small 
.stack 100h
.data
  msg1 db 10, 13, "Want another (Y/N)? $"
  msg2 db 10, 13, "Invalid Input $"
  inp db 0
.code
  ; set up data segment
  mov ax, @data
  mov ds, ax

prompt:
  ; print msg1
  mov ah, 09h
  mov dx, offset msg1
  int 21h
  
  ; read input
  mov ah, 01h
  int 21h
  
  ; check if input is valid
  cmp al, 'Y'
  je prompt
  cmp al, 'y'
  je prompt

  cmp al, 'N'
  je exit

  cmp al, 'n'
  je exit

  cmp al, 'Q'
  je exit

  cmp al, 'q'
  je exit

  ; print msg2
  mov ah, 09h
  mov dx, offset msg2
  int 21h

  jmp prompt

exit:
  mov ah, 4ch
  int 21h
end