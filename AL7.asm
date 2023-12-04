.model small
.stack 100h
.data

.code
	mov ax, @data
	mov ds, ax
	mov cx, 1Ah
	mov bh, 41h
	mov bl, 5Ah
	mov ah, 02h
	x: mov dl, bh
	int 21h
	
	mov dl, bl
	int 21h
	inc bh
	dec bl
	loop x
	
	mov ah, 4ch
	int 21h
end
