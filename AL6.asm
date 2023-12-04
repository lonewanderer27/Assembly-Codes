; This program converts uppercase English alphabet characters to their corresponding
; lowercase characters and prints them to the console.

; OUTPUT: AaBbCcDd

.model small
.stack 100h
.data

.code
	mov ax, @data      ; Initialize the data segment pointer
	mov ds, ax

	mov cx, 1Ah        ; Number of iterations (26 characters)
	mov ah, 02h        ; Function code for output character

	mov dl, 41h        ; Initialize dl with the ASCII code for 'A'

x:                   ; Start of the loop
	int 21h            ; Print the character in dl to the console

	add dl, 20h        ; Convert the uppercase character to lowercase
	int 21h            ; Print the lowercase character

	sub dl, 20h        ; Restore the uppercase character
	inc dl             ; Increment dl to the next character

	loop x             ; Repeat the loop until cx is zero

	mov ah, 4ch         ; Terminate program (DOS function code)
	int 21h             ; Call DOS to terminate the program

end





