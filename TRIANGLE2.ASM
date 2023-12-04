.model small
.stack 100h

; output:
; 1*1
; 2**2
; 3***3
; 4****4
; 5*****5

.data
  r db 5 ; Define variable r with an initial value of 5
  c db 1 ; Define variable c with an initial value of 1
  num db 31h ; Define variable num with an initial value of 1

.code
  mov ax, @data
  mov ds, ax ; Initialize the data segment

  ; Loop through rows
  mov ah, 02h
  mov cl, r ; Load r into cl (loop counter)
  mov dl, num ; Load num into dl (for printing)
y:
  mov r, cl ; Store cl back into r
  mov cl, c ; Load c into cl (inner loop counter)
  mov dl, num ; Reload num into dl for printing
  int 21h ; Print character in DL
x:
  mov dl, '*' ; Load asterisk character into dl
  int 21h ; Print the asterisk
  loop x ; Decrement CX and loop if CX is not zero
  mov dl, num ; Reload num for printing
  int 21h ; Print num

  ; Move to the next line
  mov dl, 0ah ; Load newline character into dl
  int 21h ; Print newline
  mov dl, 0dh ; Load carriage return character into dl
  int 21h ; Print carriage return

  ; Increment columns
  mov cl, r ; Reload r into cl (loop counter)
  inc c ; Increment c
  inc num; Increment num
  loop y ; Decrement CX and loop if CX is not zero

  ; Exit program
  mov ah, 4ch
  int 21h
end
