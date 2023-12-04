.model small
.stack 100h

.data
  msg db "CALCULATE DIFFERENCE $"
  msga db "Enter 1st number: $"
  msgb db "Enter 2nd number: $"
  msgc db "The difference is: $"
  lfcr db 0ah, 0dh, '$'
  n1 db 0h
  n2 db 0h
  diff db 0
  
.code
  mov ax, @data
  mov ds, ax

  ; prompt for program name
  mov ah, 09h
  mov dx, offset msg
  int 21h

  ; print new line
  mov dx, offset lfcr
  int 21h

  ; prompt for 1st number
  mov dx, offset msga
  int 21h
  
  ; ask for 1st number
  mov ah, 01h
  int 21h

  ; store 1st number
  mov n1, al

  ; print new line
  mov ah, 09h
  mov dx, offset lfcr
  int 21h

  ; prompt for 2nd number
  mov dx, offset msgb
  int 21h

  ; ask for 2nd number
  mov ah, 01h
  int 21h

  ; store 2nd number
  mov n2, al

  ; subtract 2nd number from 1st number
  mov al, n1
  sub al, n2
  mov diff, al

  ; print new line
  mov ah, 09h
  mov dx, offset lfcr
  int 21h

  ; prompt for difference
  mov ah, 09h
  mov dx, offset msgc
  int 21h

  ; add 30h to difference
  add diff, 30h

  ; print difference
  mov ah, 02h
  mov dl, diff
  int 21h

  ; exit program
  mov ah, 4ch
  int 21h
end
