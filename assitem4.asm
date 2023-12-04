.model small
.stack 100h
.data
.code
    mov ax, @data
    mov ds, ax
    mov cx, 09h     ; amount of loop

    x: mov dl, bl
    int 21h
    add bl, 10h
    mov dl, bl
    int 21h
    mov dl, 2ah
    int 21h
    sub dl, 10h
    mov dl, bl
    int 21h
    add bl, 10h
    mov dl, bl
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    sub dl, 10h
    inc bl
    loop x
    
    mov ah, 4ch     ;exit
    int 21h         ;exit
end