; This assembly code demonstrates a simple program that prints two messages to the console using the DOS interrupt 21h.
; The first message is "Hello World!" followed by a new line and carriage return.
; The second message is "Assembly Language".
; After printing the messages, the program exits.

.model small
.stack 100h
.data
  msg1 db "Hello World!", 0ah, 0dh, "$" ; Message 1: "Hello World!" with new line and carriage return
  msg2 db "Assembly Language$" ; Message 2: "Assembly Language"

.code
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h ; Set AH register to 09h to print a string

  mov dx, offset msg1 ; Load DX register with the offset of message 1
  int 21h ; Call DOS interrupt 21h to print the string
  
  mov dx, offset msg2 ; Load DX register with the offset of message 2
  int 21h ; Call DOS interrupt 21h to print the string
  
  ; Exit program
  mov ah, 4ch ; Set AH register to 4ch to exit program
  int 21h ; Call DOS interrupt 21h to exit

end