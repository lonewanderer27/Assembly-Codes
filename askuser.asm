.model small
.stack 100h
.data
  msg1 db "Press any key: $"
  msg2 db 0ah, 0dh , "You pressed: $"
  chr db 0

.code
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h ; Set AH register to 09h to print a string

  mov dx, offset msg1 ; Load DX register with the offset of message 1
  int 21h ; Call DOS interrupt 21h to print the string
  
  mov ah, 01h;
  int 21h;
  ; user input gets stored to al
  mov chr, al
  
  mov ah, 09h ; Set AH register to 09h to print a string
  mov dx, offset msg2 ; Load DX register with the offset of message 2
  int 21h ; Call DOS interrupt 21h to print the string
  
  mov ah, 02h
  mov dl, chr
  int 21h

  ; Exit program
  mov ah, 4ch ; Set AH register to 4ch to exit program
  int 21h ; Call DOS interrupt 21h to exit
end