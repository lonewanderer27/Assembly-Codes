;OUTPUT: AABB

.model small
.stack 100h
.data

.code
	mov ax, @data
	mov ds, ax
	
	mov ah, 02h
	mov dl, 41h
	int 21h
	int 21h
	
	mov ah, 02h
	mov dl, 42h
	int 21h
	int 21h
	
	mov ah, 4ch
	int 21h
end
