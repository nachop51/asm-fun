BITS 64

  global asm_putc

  section .text

asm_putc:
  ; prologue
  push rbp
  mov rbp, rsp

  push r8

  mov r8, rdi

  mov rax, 1      ; The system call number for write is 1
  mov rdi, 1      ; stdout is file descriptor 1
  mov rdx, 1      ; We'll write just one byte at a time

  mov byte [rsi], r8b
  syscall
  jc failed       ; If the syscall failed set to 0 the ret value

  mov rax, 1
  jmp end

  failed:
    mov rax, 0

  end:
    pop r8

    ; epilogue
    mov rsp, rbp
    pop rbp
    ret
