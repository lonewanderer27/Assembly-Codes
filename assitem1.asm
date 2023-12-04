; AAzAA
; BByBB
; CCxCC
; ZZaZZ

.model small
.stack 100h
.data
.code
    mov ax, @data
    mov ds, ax
    mov cx, 1ah     ; amount of loop
    
    mov bh, 41h     ; A
    mov dh, 7ah     ; z ascii code

    mov ah, 02h     ; print char function    
    x: mov dl, bh   ; move char A to dl
    int 21h         ; print A
    int 21h         ; print A
    mov dl, dh      ; move char z to dl
    int 21h         ; print z
    mov dl, bh      ; move char A to dl
    int 21h         ; print A
    int 21h         ; print A

    mov dl, 0ah     ; new line
    int 21h         ; print new line
    mov dl, 0dh     ; carriage return
    int 21h         ; print carriage return

    inc bh          ; increment A
    dec dh          ; decrement z
    loop x          ; loop until cx = 0
    
    mov ah, 4ch     ; exit function
    int 21h         ; exit program
end
