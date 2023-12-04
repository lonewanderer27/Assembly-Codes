_start:
  mov ax,b800 ;sets the video memory
  mov es,ax   ;sets the segment
  mov di,06fe ;sets the cursor position
  mov ah,9c   ;sets the color
  mov al,41   ;sets the character
  stosw      ;writes the character to the screen
  int 20    ;ends the program