BITS 64

  global asm_strncmp

  ; C Definition of the function:
  ;
  ; int asm_strncmp(const char *s1, const char *s2, size_t n);
  ;
  ; modified strncmp (instead of return char a - char b, returns -1, 0 or 1)
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
    je str_ended

    cmp r9b, 0h ; check if string ended
    je gret

    cmp r8b, r9b ; check if there is any difference
    jne compare

    inc r10
    inc rsi ; in case that the chars are equal,
    inc rdi ; increment both registers to continue
    jmp strcmp

  str_ended:
    cmp r9b, 0h ; if the first ended, check the second
    je equal    ; if the second ended, the strings are equal
    jmp lest    ; any other case is less than

  equal:
    mov rax, 0  ; put 0 on the rax register
    jmp end     ; return

  compare:
    cmp r8b, r9b
    jg gret
    jmp lest

  gret:
    mov rax, 1
    jmp end

  lest:
    mov rax, -1
    jmp end

  end:
    pop r9 ; clean the registers before leaving
    pop r8 ; important!! in order

    ; function epilogue
    mov rsp, rbp
    pop rbp

    ret
