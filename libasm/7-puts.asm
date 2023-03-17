BITS 64

  global asm_puts
  extern asm_strlen

  section .text

asm_puts:
  ; prologue
  push rbp
  mov rbp, rsp

  push r8

  xor r8, r8

  call asm_strlen

  mov r8, rax

  mov rax, 1        ; system call for write
  mov rsi, rdi
  mov rdi, 1        ; file descriptor for stdout
  mov rdx, r8      ; size of string
  syscall           ; call the system call

  mov rax, r8

  pop r8

  mov rsp, rbp
  pop rbp

  ret