.model small
.stack 100h
.data
  msg1 db 10, 13, "Enter a number: $"
  msg2 db 10, 13, "Invalid Input $"
  msg3 db 10, 13, "Another number (y/n)? $"
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

    jmp invalid

  more:
    mov ah, 09h
    mov dx, offset msg3
    int 21h

    mov ah, 01h
    int 21h

    cmp al, "Y"
    je prompt

    cmp al, "y"
    je prompt

    cmp al, "N"
    je exit

    cmp al, "n"
    je exit
  
  invalid:
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    jmp mr1

  p0:
    mov ah, 09h
    mov dx, offset more
    int 21h
    jmp more

  p1:
    mov ah, 09h
    mov dx, offset more
    int 21h
    jmp more
  
  p2:
    mov ah, 09h
    mov dx, offset more
    int 21h
    jmp more

  p3:
    mov ah, 09h
    mov dx, offset more
    int 21h
    jmp more

  p4:
    mov ah, 09h
    mov dx, offset more
    int 21h
    jmp more
  
  mr1:
    jmp more

  p5:
    mov ah, 09h
    mov dx, offset m5
    int 21h
    jmp mr1

  p6:
    mov ah, 09h
    mov dx, offset m6
    int 21h
    jmp mr1

  p7:
    mov ah, 09h
    mov dx, offset m7
    int 21h
    jmp mr1
  
  p8:
    mov ah, 09h
    mov dx, offset m8
    int 21h
    jmp mr1
  
  p9:
    mov ah, 09h
    mov dx, offset m9
    int 21h
    jmp mr1

  exit:
    mov ah, 4ch
    int 21h
end