section .data
    msg db 'Number: ', 0

section .bss
    num resb 1

section .text
global _start

_start:
    mov byte [num], 0

print_loop:
    mov rax, 1             ; syscallnum sys_write
    mov rdi, 1
    mov rsi, msg
    mov rdx, 9
    syscall

    mov rax, 1
    lea rsi, [num]
    mov rdx, 1             ; 1byte
    syscall

    inc byte [num]
    cmp byte [num], '9'
    jg exit_loop


    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    jmp print_loop

exit_loop:
    mov rax, 60            ; syscallnum sys_exit
    xor rdi, rdi
    syscall

section .data
    newline db 0xA

