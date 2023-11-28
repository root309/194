section .data
    num1 dq 0
    num2 dq 1
    format db "%ld ", 0

section .bss
    buffer resb 20

section .text
global _start

_start:
    mov rcx, 10

print_fibonacci:
    mov rsi, [num1]
    call convert_to_string
    call print_string

    mov rax, [num1]
    mov rbx, [num2]
    add rbx, rax
    mov [num1], rbx
    mov [num2], rax

    dec rcx
    jnz print_fibonacci

convert_to_string:
    mov rax, rsi
    test rax, rax
    jz convert_zero

    mov rbx, 10
    mov rcx, buffer + 19
    mov byte [rcx], 0

convert_loop:
    dec rcx
    xor rdx, rdx
    div rbx
    add dl, '0'
    mov [rcx], dl
    test rax, rax
    jnz convert_loop
    jmp string_done

convert_zero:
    mov rcx, buffer
    mov byte [rcx], '0'
    mov byte [rcx + 1], 0

string_done:
    ret

print_string:
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 20
    syscall
    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

