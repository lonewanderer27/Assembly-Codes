.model small
.stack 100h

.code 
  mov ax,@data
  mov ds, ax

  ; SET CURSOR POSITION TO THE CENTER
  mov ah, 02h  ; Set the function code for setting cursor position
  mov dh, 12   ; Set the row position to 12 (center)
  mov dl, 40   ; Set the column position to 40 (center)
  mov bh, 0    ; Set the page number to 0 (default)
  int 10h      ; Call the BIOS interrupt to set the cursor position

  ; PRINT STRING
  mov ah, 02h  ; Set the function code for printing character
  mov dx, "A"  ; Set the character to be printed
  int 21h      ; Call the DOS interrupt to print the character

  mov ah, 4ch  ; Set the function code for program termination
  int 21h      ; Call the DOS interrupt to terminate the program
end
