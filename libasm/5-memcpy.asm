BITS 64

  global asm_memcpy

  ; void *asm_memcpy(void *dest, const void *src, size_t n)

  section .text

asm_memcpy:
  ; prologue
  push rbp
  mov rbp, rsp

  push r8
  mov r8, 0

  null_checks:
    cmp rdi, 0
    je end
    cmp rsi, 0
    je end
    cmp qword [rsi], 0h
    je end
    cmp rdx, 0
    je end

  memcpy:
    cmp r8d, edx
    je done

    mov al, byte [rsi + r8]
    mov byte [rdi + r8], al

    inc r8
    jmp memcpy

  done:
    mov rax, rdi

  end:
    pop r8

    ; epilogue
    mov rsp, rbp
    pop rbp

    ret