BITS 64

  global asm_strlen

  section .text

asm_strlen:
  ; function prologue
  push rbp
  mov rbp, rsp

  mov rsi, rdi ; move the parameter to the rsi register
  xor eax, eax ; clean eax register

  add rsp, -4         ; add some space to the stack pointer
  mov dword [rsp], 0  ; initialize in 0 that memory

  ; loop through the string
  strlen:
    lodsb       ; load the character from the rsi register to the rax one
    cmp al, 0h  ; use al to get the lowest bits of rax
                ; check if the character is the null terminator
    jne sum     ; jump if not equal
    jmp end     ; jump to the end

  sum:
    inc dword [rsp] ; increment the space of memory used to save the int
    jmp strlen      ; jump back to the start of the loop

  end:

    mov eax, dword [rsp] ; save the data from the rsp register to the rax one
    add rsp, 4           ; restore the space

    ; function epilogue
    mov rsp, rbp
    pop rbp

    ret
