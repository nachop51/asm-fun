BITS 64

  global asm_strcmp

  section .text

asm_strcmp:
  ; function prologue
  push rbp
  mov rbp, rsp

    mov rsi, [rbp+16]   ; Load the address of the first string
    mov rdi, [rbp+24]   ; Load the address of the second string

  strcmp:
    mov al, [esi] ; Load the character from the first string into al
    mov bl, [edi] ; Load the character from the second string into bl
    cmp al, bl
    je end

    cmp al, 0h
    je end

    cmp bl, 0h
    je end

    inc rsi
    inc rdi
    jmp strcmp

  end:

    xor rax, rax
    sub eax, ebx

    ; function epilogue
    mov rsp, rbp
    pop rbp

    ret
