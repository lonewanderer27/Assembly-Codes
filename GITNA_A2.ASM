.model small
.stack 100h
.data
    
.code
  mov ax, @data
  mov ds, ax

  ; clear the screen
  mov ah, 06h  ; Set the function code for scrolling the window
  mov bh, 07h  ; Set the display page number
  mov ch, 00   ; Set the starting row of the window
  mov cl, 00   ; Set the starting column of the window
  mov dh, 23   ; Set the ending row of the window
  mov dl, 79   ; Set the ending column of the window
  int 10h      ; Call the BIOS interrupt to scroll the window

  ; set the cursor position to center
  mov ah, 02h  ; Set the value of AH register to 02h
  mov dh, 12   ; Set the value of DH register to 12
  mov dl, 40   ; Set the value of DL register to 40
  mov bh, 00   ; Set the value of BH register to 00
  int 10h      ; Call the interrupt 10h to perform the specified video operation

  ; print A
  mov ah, 02h  ; Set the value of AH register to 02h
  mov dl, 41h  ; Set the value of DL register to 41h
  int 21h      ; Call the interrupt 21h to perform a specific function

  ; end program
  mov ah, 4ch
  int 21h
end