.model small
.stack 100h

.data
  r db 9        ; loop counter
  num db 39h    ; number 9
  letA db 41h   ; letter A
  letz db 7ah   ; letter z
  
.code
  ; bl bh dl
  mov ax, @data
  mov ds, ax
  
  ; Loop through rows
  mov ah, 02h   ; print char
  mov cl, r     ; loop counter

y: 
  mov dl, letA  ; print letter
  int 21h       ; print letter
  
  mov dl, num   ; print number
  int 21h       ; print number
  
  mov dl, letz  ; print letter
  int 21h       ; print letter

  mov dl, num   ; print number
  int 21h       ; print number
  
  mov dl, letA  ; print letter
  int 21h       ; print letter
  
  mov dl, 0ah   ; print new line
  int 21h       ; print new line  
  mov dl, 0dh   ; print new line
  int 21h       ; print new line
  
  dec num       ; increment number
  inc letA      ; increment letter
  dec letz      ; decrement letter
  
  loop y        ; loop through rows
  
  ; Exit program
  mov ah, 4ch
  int 21h
end