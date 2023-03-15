BITS 64

  global asm_strncmp

  ; C Definition of the function:
  ;
  ; int asm_strncmp(const char *s1, const char *s2, size_t n);
  ;
  ; original strncmp
  ;
  ; To return a value use, remember to use the rax register

  section .text

asm_strncmp:
  ; function prologue
  push rbp
  mov rbp, rsp

  push r8 ; push register in case they were used before
  push r9 ; same thing
  push r10

  mov r8, 0 ; Initialize both in 0
  mov r9, 0 ;

  ; The first six parameters are passed through registers:
  ; ('rdi', 'rsi', 'rdx', 'rcx', 'r8', 'r9')
  ; Any additional parameter will be pushed to the stack

  ; (rdx) here is the n
  mov r10, 0 ; set r10 to 0

  strcmp:

    cmp r10, rdx
    je equal

    mov r8b, byte [rdi] ; load a string into r8 register, and use the low bites
    mov r9b, byte [rsi] ; same thing here

    cmp r8b, 0h ; check if string ended
    je substract

    cmp r9b, 0h ; check if string ended
    je substract

    cmp r8b, r9b ; check if there is any difference
    jne substract

    inc r10
    inc rsi ; in case that the chars are equal,
    inc rdi ; increment both registers to continue
    jmp strcmp

  equal:
    mov rax, 0  ; put 0 on the rax register
    jmp end     ; return

  substract:
    xor rax, rax
    mov eax, r8d
    sub eax, r9d

  end:
    pop r10
    pop r9 ; clean the registers before leaving
    pop r8 ; important!! in order

    ; function epilogue
    mov rsp, rbp
    pop rbp

    ret
