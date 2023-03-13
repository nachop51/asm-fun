BITS 64

  global swap

  section .text

  ; void swap(int *a, int *b);
	; Swaps the values of two pointers
	;
	; rdi <- a
	; rsi <- b

swap:
  push rbp
  mov rbp, rsp
  ; function prologue

  mov eax, dword [rsi] ; access to the memory where the int is stored
  mov ebx, dword [rdi] ; then save it in each register (32-bits)
  mov dword [rsi], ebx ; now access to the memory again and write
  mov dword [rdi], eax ; the number stored in each register

  mov rsp, rbp
  pop rbp
  ; function epilogue

  ret
