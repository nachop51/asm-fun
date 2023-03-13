BITS 64

global add_me

; section .data
; 			; some data
; 	string db "Holberton", " another", 0Ah, 0
; 	; Holberton and a new line (0A hexa), and the \0

section .text
			; Here goes the code

add_me:
	; INSTRUCTION SRC/DEST, SRC
	; enter
	; push rbp ; old ebp
	; mov esp, ebp
	; function prologue
	mov eax, edi ; move whatever is in edi that is the first parameter to the eax register
	mov ebx, esi ; same thing but with esi which is the second parameter
	add eax, ebx ; then add eax and ebx, that are storing the values of the parameters
	; function epilogue
	; pop rbp
	ret
	; leave
