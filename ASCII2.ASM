.model small
.stack 100h
.data
  inp db 0
  d1 db 0
  d2 db 0
  msg1 db "Press any key: $"
  msg2 db "The ASCII Code is : $"
  lfcr db 0dh,0ah,"$"

.code
  mov ax, @data
  mov ds, ax

  mov ah, 09h         ; use 09h to display string

  mov dx, offset msg1 ; load offset of msg1 into dx
  int 21h             ; display msg1

  mov ah, 01h         ; use 01h to read a character from keyboard
  int 21h             ; read a character from keyboard

  mov inp, al         ; save the character into inp
  mov ah, 00h         ; use 00h to read the character into al
  int 16h             ; read the character into al