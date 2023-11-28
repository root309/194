section .data
    msg db 'Hello, world!', 0

section .text
global _start

_start:
    mov rax, 1          ; システムコール番号（sys_write）
    mov rdi, 1          ; ファイルディスクリプタ（stdout）
    mov rsi, msg        ; メッセージのアドレス
    mov rdx, 13         ; メッセージの長さ
    syscall             ; システムコール実行

    mov rax, 60         ; システムコール番号（sys_exit）
    xor rdi, rdi        ; 終了ステータス
    syscall             ; システムコール実行

