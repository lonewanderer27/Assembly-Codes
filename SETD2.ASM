.model small
.stack 100h

.data
  r db 1ah        ; loop counter
  letaa db 61h   ; letter a
  letA db 41h   ; letter A
  letzz db 7ah   ; letter z
  letZ db 5ah   ; letter Z
  
.code
  ; bl bh dl
  mov ax, @data
  mov ds, ax
  
  ; Loop through rows
  mov ah, 02h   ; print char
  mov cl, r     ; loop counter

y: 
  mov dl, letaa  ; print letter
  int 21h       ; print letter
  
  mov dl, letZ  ; print letter
  int 21h       ; print letter

  mov dl, letA  ; print letter
  int 21h       ; print letter
  
  mov dl, letzz  ; print letter
  int 21h       ; print letter

  mov dl, letA  ; print letter
  int 21h       ; print letter

  mov dl, letZ  ; print letter
  int 21h       ; print letter

  mov dl, letaa  ; print letter
  int 21h       ; print letter

  mov dl, 0ah   ; print new line
  int 21h       ; print new line  
  mov dl, 0dh   ; print new line
  int 21h       ; print new line

  inc letaa      ; increment letter
  dec letZ      ; decrement letter
  inc letA      ; increment letter
  dec letzz      ; decrement letter

  loop y        ; loop through rows
  
  ; Exit program
  mov ah, 4ch
  int 21h
end