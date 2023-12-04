; This assembly code hides and brings back the cursor on the screen.
; It uses interrupt 10h to interact with the video BIOS.

.model small
.stack 100h

.code 
  mov ax,@data
  mov ds, ax

  ; hides the cursor
  mov ah, 01h        
  mov ch, 32h
  int 10h
  
  ; brings back the cursor
  ; standard blinking
  mov ah, 01h
  mov ch, 06h
  mov cl, 07h
  int 10h

  mov ah, 4ch
  int 21h
end