.model small
.stack 100h

.data
    q1 db 'Enter 1st number: $'
    q2 db 'Enter 2nd number: $'
    res_quotient db 'The quotient is $'
    res_remainder db 'The remainder is $'

    newline db 0ah, 0dh, "$"
    n1 db 0
    n2 db 0
    quotient db 0
    remainder db 0

.code
    mov ax, @data
    mov ds, ax

    ; Input first number
    mov ah, 09h
    mov dx, offset q1
    int 21h
    mov ah, 01h
    int 21h
    mov n1, al
    sub n1, 30h

    ; Display newline
    mov ah, 09h
    mov dx, offset newline
    int 21h

    ; Input second number
    mov ah, 09h
    mov dx, offset q2
    int 21h
    mov ah, 01h
    int 21h
    mov n2, al
    sub n2, 30h

    ; Display newline
    mov ah, 09h
    mov dx, offset newline
    int 21h

    ; Compute quotient
    mov ah, 00h
    mov al, n1
    div n2
    mov quotient, al
    mov remainder, ah

    ; Display quotient
    mov ah, 09h
    mov dx, offset res_quotient
    int 21h
    mov ah, 02h
    mov dl, quotient
    int 21h

    ; Display newline
    mov ah, 09h
    mov dx, offset newline
    int 21h

    ; Display remainder
    mov ah, 09h
    mov dx, offset res_remainder
    int 21h
    mov ah, 02h
    mov dl, remainder
    int 21h

    ; Exit program
    mov ah, 4ch
    int 21h
end