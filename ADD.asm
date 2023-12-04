.model small
.stack 100h

.data
  msgC db "ADDITION: $"
  msgA db "Enter 1st number: $"
  msgB db "Enter 2nd number: $"
  summ db "Sum of the two is: $"
  lfcr db 0ah, 0dh, '$'
  numA db 0h
  numB db 0h

.code
    mov ax, @data         ; Load the segment address of the data segment into AX
    mov ds, ax            ; Set the data segment register (DS) to the value in AX

    mov ah, 09h           ; Set the value of AH to 09h (print string function)
    
    mov dx, offset msgC   ; Load the offset address of the string msgC into DX
    int 21h               ; Call the DOS interrupt 21h to print the string    
    mov dx, offset lfcr   ; Load the offset address of the string msgB into DX
    int 21h               

    mov dx, offset msgA   ; Load the offset address of the string msgA into DX
    int 21h               ; Call the DOS interrupt 21h to print the string

    mov ah, 01h           ; Set the value of AH to 01h (read character function)
    int 21h               ; Call the DOS interrupt 21h to read a character from input
    add numA, al          ; Add the value of AL (the ASCII code of the character) to the variable numA
    sub numA, 30h         ; Subtract 30h from the value of numA to convert it from ASCII to decimal
    
    mov ah, 09h           ; Set the value of AH to 09h (print string function)
    mov dx, offset lfcr   ; Load the offset address of the string msgB into DX
    int 21h               ; Call the DOS interrupt 21h to print the string
    
    mov dx, offset msgB   ; Load the offset address of the string msgB into DX
    int 21h               ; Call the DOS interrupt 21h to print the string

    mov ah, 01h           ; Set the value of AH to 01h (read character function)

    int 21h               ; Call the DOS interrupt 21h to read a character from input
    add numB, al          ; Add the value of AL (the ASCII code of the character) to the variable numB
    sub numB, 30h         ; Subtract 30h from the value of numB to convert it from ASCII to decimal

    mov ah, 09h           ; Set the value of AH to 09h (print string function)

    mov dx, offset lfcr   ; Load the offset address of the string msgB into DX
    int 21h               ; Call the DOS interrupt 21h to print the string
    
    mov bh, 00h           ; Set the value of BH to 00h (clear BH)
    mov bl, numA          ; Move the value of numA into BL
    add bl, numB          ; Add the value of numB to BL
    add bl, 30h           ; Add 30h to BL to convert it from decimal to ASCII

    mov dx, offset summ   ; Load the offset address of the string summ into DX
    int 21h               ; Call the DOS interrupt 21h to print the string

    mov ah, 02h           ; Set the value of AH to 02h (print character function)
    mov dx, bx            ; Move the value of BX into DX
    int 21h               ; Call the DOS interrupt 21h to print the character

    mov ah, 4ch           ; Set the value of AH to 4ch (exit function)
    int 21h               ; Call the DOS interrupt 21h to exit the program
end     