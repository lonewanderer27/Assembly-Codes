.model small
.stack 100h
.data
  msgc db "KEY -> ASCII $"
	msga db "Press any key: $"
	msgb db "The ASCII code for that is: $"
	lfcr db 0Ah, 0Dh, "$"
	chb db 0
	numa db 0
	numb db 0

; This assembly code reads an ASCII character from the user, 
; calculates the first and second digits of the ASCII code, 
; converts them to ASCII characters, and displays them on the screen.

.code
  mov ax, @data
  mov ds, ax

  ; Display title
  mov ah, 09h
  mov dx, offset msgc
  int 21h
  
  ; New Line
  mov dx, offset lfcr
  int 21h

  ; Display prompt
  mov dx, offset msga
  int 21h

  ; Read input
  mov ah, 01h
  int 21h

  ; Divide ASCII character by 10 to get first digit
  mov chb, al
  mov ah, 00h
  mov bh, 00h
  mov bl, 10h
  div bx
  mov numa, al

  ; Calculate second digit of ASCII code
  mul bx
  mov bl, chb
  sub bl, al
  mov numb, bl

  ; Convert digits to ASCII characters
  add numa, 30h
  add numb, 30h

  ; New Line
  mov ah, 09h
  mov dx, offset lfcr
  int 21h

  ; Display prompt
  mov dx, offset msgb
  int 21h

  ; Display first digits
  mov ah, 02h
  mov dl, numa
  int 21h
  mov dl, numb
  int 21h

  ; Exit program
  mov ah, 4Ch
  int 21h
end