.model small
.stack 100h
.data
.code

    mov ax, @data
    mov ds, ax

    mov cx, 09h     ;amount of loop

    ;bl, bh, dh free register variable
    mov bh, 41h     ;ascii code for A
    mov dh, 31h     ;ascii code for 1
    mov bl, 7ah     ;ascii code for z

    mov ah, 02h     ;function to print char
    x: mov dl, bh   ;print char
    int 21h         ;print char
    mov dl, dh      ;print char
    int 21h         ;print char 
    mov dl, bl      ;print char
    int 21h         ;print char

    mov dl, 0ah     ;print new line
    int 21h         ;print new line

    mov dl, 0dh     ;print carriage return
    int 21h         ;print carriage return

    inc bh          ;increment bh
    inc dh          ;increment dh
    dec bl          ;decrement bl

    loop x          ;loop x

    mov ah, 4ch     ;exit program
    int 21h         ;exit program
end

    

