.model small
.stack 100h
.data
.code
    mov ax, @data
    mov ds, ax

    mov cx, 09h     ; 9 rows
    
    mov bh, 61h     ; a
    mov ah, 02h     ; print char

    x: mov dl, bh   ; print char
    int 21h         ; print char
    sub dl, 20h     ; print char=
    int 21h
    sub dl, 10h
    mov dl, "*"
    int 21h
    mov dl, bh
    sub dl, 30h
    int 21h
    add dl, 10h
    int 21h
    add dl, 20h
    int 21h
    
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    inc bh
    loop x
    mov ah, 4ch
    int 21h
end