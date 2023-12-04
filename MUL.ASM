.model small
.stack 100h

.data
  msga db "MULTIPLICATION $"
  msgb db "Enter 1st number: $"
  msgc db "Enter 2nd number: $"
  prod db "Product of the two is: $"
  lfcr db 0ah, 0dh, '$'

  numa db 0h
  numb db 0h

.code
  mov ax, @data         ; initialize DS
  mov ds, ax            ; to the data segment
  
  mov ah, 09h           ; print string

  mov dx, offset msga   ; load offset of msga to dx
  int 21h               ; print msga
  mov dx, offset lfcr   ; Load the offset address of the string lfcr into DX
  int 21h

  mov dx, offset msgb   ; load offset of msgb to dx
  int 21h               ; print msgb
  
  mov ah, 01h           ; read character
  int 21h               ; read character
  add numa, al          ; add to numa
  sub numa, 30h         ; convert to decimal
  
  mov ah, 09h           ; print string

  mov dx, offset lfcr   ; load offset of lfcr to dx
  int 21h               ; print lfcr

  mov dx, offset msgc   ; load offset of msgb to dx
  int 21h               ; print string

  mov ah, 01h           ; read character
  int 21h               ; read character
  add numb, al          ; add to numb
  sub numb, 30h         ; convert to decimal

  mov ah, 09h           ; print string

  mov dx, offset lfcr   ; load offset of lfcr to dx
  int 21h               ; print lfcr

  mov ah, 00h           ; clear ah
  mov al, numa          ; move numa to al
  mul numb              ; multiply al and numb
  mov bl, al            ; move al to bl
  mov bh, 00h           ; clear bh
  add bl, 30h           ; convert to ascii
  
  mov ah, 09h           ; print string

  mov dx, offset prod   ; load offset of prod to dx
  int 21h               ; print prod

  mov ah, 02h           ; print character
  mov dx, bx            ; move bx to dx
  int 21h               ; print bx

  mov ah, 4ch           ; Set the value of AH to 4ch (exit function)
  int 21h               ; Call the DOS interrupt 21h to exit the program
end     