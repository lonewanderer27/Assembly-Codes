; A
; D
; G
; J
; M
; ...
; Y

.model small
.stack 100h
.data
.code
    mov ax, @data
    mov ds, ax
    mov cx, 09h     ; amount of loop
    
    mov bh, 41h

    mov ah, 02h     ; print char
    x: mov dl, bh   ; print char
    int 21h         ; print char

    mov dl, 0ah     ;print new line
    int 21h         ;print new line

    mov dl, 0dh     ;print carriage return
    int 21h         ;print carriage return

    add bh, 3      ;increment bh
    loop x          ;loop x
    
    mov ah, 4ch     ;exit
    int 21h         ;exit
end