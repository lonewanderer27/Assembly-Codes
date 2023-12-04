.model small
.stack 100h
.data
  msg1 db 10, 13, "Enter a number (Q to quit): $"
  msg2 db 10, 13, "Invalid Input $"
  inp db 0
  m0 db 10, 13, "zero $"
  m1 db 10, 13, "one $"
  m2 db 10, 13, "two $"
  m3 db 10, 13, "three $"
  m4 db 10, 13, "four $"
  m5 db 10, 13, "five $"
  m6 db 10, 13, "six $"
  m7 db 10, 13, "seven $"
  m8 db 10, 13, "eight $"
  m9 db 10, 13, "nine $"

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

    cmp al, "0"
    je p0

    cmp al, "1"
    je p1

    cmp al, "2"
    je p2
    
    cmp al, "3"
    je p3

    cmp al, "4"
    je p4

    cmp al, "5"
    je p5

    cmp al, "6"
    je p6

    cmp al, "7"
    je p7

    cmp al, "8"
    je p8

    cmp al, "9"
    je p9

    cmp al, "Q"
    je exit

    cmp al, "q"
    je exit

    jmp invalid

  invalid:
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    jmp prompt

  p0:
    mov ah, 09h
    mov dx, offset m0
    int 21h
    jmp prompt

  p1:
    mov ah, 09h
    mov dx, offset m1
    int 21h
    jmp prompt
  
  p2:
    mov ah, 09h
    mov dx, offset m2
    int 21h
    jmp prompt

  p3:
    mov ah, 09h
    mov dx, offset m3
    int 21h
    jmp prompt

  p4:
    mov ah, 09h
    mov dx, offset m4
    int 21h
    jmp prompt

  p5:
    mov ah, 09h
    mov dx, offset m5
    int 21h
    jmp prompt

  p6:
    mov ah, 09h
    mov dx, offset m6
    int 21h
    jmp prompt

  p7:
    mov ah, 09h
    mov dx, offset m7
    int 21h
    jmp prompt
  
  p8:
    mov ah, 09h
    mov dx, offset m8
    int 21h
    jmp prompt
  
  p9:
    mov ah, 09h
    mov dx, offset m9
    int 21h
    jmp prompt

  exit:
    mov ah, 4ch
    int 21h
end