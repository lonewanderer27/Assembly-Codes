; This assembly code prompts the user to enter a number and displays the corresponding word representation of the number.
; It uses the DOS interrupt 21h to read input from the user and display output on the screen.
; The program checks the input character and jumps to the corresponding label to display the word representation of the number.
; If the input is not a valid digit, it displays an error message.
; After displaying the word representation, the program prompts the user if they want to enter another number.
; If the user enters 'y' or 'Y', it goes back to the prompt. If the user enters 'n' or 'N', it exits the program.

.model small
.stack 100h
.data
  ; Messages displayed to the user
  msg1 db 10, 13, 10, 13, "Enter a number: $" ; Prompt to enter a number
  msg2 db 10, 13, "Invalid Input $" ; Error message for invalid input
  msg3 db 10, 13, 10, 13, "Another number (y/n)? $" ; Prompt to enter another number
  m0 db 10, 13, "zero $" ; Word representation of 0
  m1 db 10, 13, "one $" ; Word representation of 1
  m2 db 10, 13, "two $" ; Word representation of 2
  m3 db 10, 13, "three $" ; Word representation of 3
  m4 db 10, 13, "four $" ; Word representation of 4
  m5 db 10, 13, "five $" ; Word representation of 5
  m6 db 10, 13, "six $" ; Word representation of 6
  m7 db 10, 13, "seven $" ; Word representation of 7
  m8 db 10, 13, "eight $" ; Word representation of 8
  m9 db 10, 13, "nine $" ; Word representation of 9

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
    mov dx, offset m0
    int 21h
    jmp more

  p1:
    mov ah, 09h
    mov dx, offset m1
    int 21h
    jmp more
  
  p2:
    mov ah, 09h
    mov dx, offset m2
    int 21h
    jmp more

  p3:
    mov ah, 09h
    mov dx, offset m3
    int 21h
    jmp more

  p4:
    mov ah, 09h
    mov dx, offset m4
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