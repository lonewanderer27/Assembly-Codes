;output:
;A
;B
;C
;D
;E
;...
;Z

.model small
.stack 100h
.data

.code
	mov ax,@data
	mov ds, ax
	
	;amt of loop
	mov cx, 1ah

	;current letter 
	mov bh, 41h
	mov ah, 02h
	x: mov dl, bh
	int 21h

	;line feed
	mov dl, 0ah
	int 21h
	
	;carriage return
	mov dl, 0dh
	int 21h
	
	inc bh 	;increase character register
	loop x	;go back to x

	;termination
	mov ah, 4ch
	int 21h
end
