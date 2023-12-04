; This assembly code takes a 2-digit ASCII code as input from the user and displays the corresponding character.
; It prompts the user to enter the ASCII code, reads the input, converts the ASCII code to a character, and displays the character.

.model small
.stack 100h
.data
  msg1 db "Enter 2 digit ASCII code: $"   ; Prompt message to enter the ASCII code
  msg2 db 0ah, 0dh, "character : $"       ; Message to display the character
  lfcr db 0ah, 0dh, "$"                   ; Line feed and carriage return

  dig1 db 0                               ; Variable to store the first character of the ASCII code
  dig2 db 0                               ; Variable to store the second character of the ASCII code

.code
  mov ax, @data                           ; Initialize the data segment
  mov ds, ax

  mov ah, 09h                             ; Set AH register to 09h to print a string
  mov dx, offset msg1                     ; Load DX register with the offset of message 1
  int 21h                                 ; Call DOS interrupt 21h to print the string

  mov ah, 01h                             ; Read a character from the standard input
  int 21h
  mov dig1, al                            ; Store the first character of the ASCII code
  mov ah, 01h                             ; Read another character from the standard input
  int 21h
  mov dig2, al                            ; Store the second character of the ASCII code

  sub dig1, 30h                           ; Convert the first character to its corresponding numeric value
  sub dig2, 30h                           ; Convert the second character to its corresponding numeric value

  mov bh, 00h                             ; Clear BH register
  mov bl, 10h                             ; Set BL register to 10h (16 in decimal)
  mov ah, 00h                             ; Clear AH register
  mov al, dig1                            ; Move the first digit to AL register

  mul bx                                  ; Multiply AX by BX (AX = AX * BX)
  add al, dig2                            ; Add the second digit to AL
  mov dig1, al                            ; Store the result in dig1

  mov ah, 09h                             ; Set AH register to 09h to print a string
  mov dx, offset lfcr                     ; Load the line feed & carriage return variable
  int 21h                                 ; Print line feed & carriage return

  mov dx, offset msg2                     ; Load DX register with the offset of message 2
  int 21h                                 ; Call DOS interrupt 21h to print the string

  mov ah, 02h                             ; Set AH register to 02h to print a character
  mov dl, dig1                            ; Move the character to DL register
  int 21h                                 ; Call DOS interrupt 21h to print the character

  ; Exit program
  mov ah, 4ch                             ; Set AH register to 4ch to exit program
  int 21h                                 ; Call DOS interrupt 21h to exit
end
