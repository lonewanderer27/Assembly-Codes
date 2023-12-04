;TITLE: Display a character
.model small 	;program directive
.stack 100h		;usually dictated, the values in hex values
.data			;connects to data segment

.code			;connects your code segment
	mov ax,@data
	mov ds,ax
	;connects the code segment & data segment

	mov ah,02h	;display a character
	mov dl,41h	;holds the ascii code
	int 21h		;int value

	mov ah,4ch		
	int 21h
	;termination routine
end
