BITS 64

  global asm_strchr

  ; C function definition:
  ;
  ; char *asm_strchr(const char *s, int c)

  section .text

asm_strchr:
  ; function prologue
  push rbp
  mov rbp, rsp

  push r8
  push r9

  mov r8, 0
  mov r9, 0

  ; sil -> low bites of rsi
  ; al -> low bites of rax

  strchr:
    mov r8b, byte [rdi]

    cmp r8b, 0h ; check if the byte is 0
    je not_found;

    cmp r8b, sil
    je found

    inc r8
    inc rdi
    jmp strchr

  found:
    mov rax, rdi
    jmp end

  not_found:
    mov rax, 0

  end:
    pop r9
    pop r8

    ; function epilogue
    mov rsp, rbp
    pop rbp

    ret
