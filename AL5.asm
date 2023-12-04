; displays the alphabet
.model small
.stack 100h
.data
.code
	mov ax, @data
	mov ds, ax
	
	mov cx, 1Ah	; define the number it'll loop
	mov ah, 02h	
	mov dl, 41h	; define the character, in this case A
	x: int 21h		; start of the loop
	inc dl			; increase the number of value in dl (41h -> 42h -> 43h)
	loop x			; go back to the loop
	
	; termination process
	mov ah, 4ch
	int 21h
end
