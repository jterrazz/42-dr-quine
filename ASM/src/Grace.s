; Only one comment
%define CODE "Yoooo"
%define MAIN_BUT_NOT_MAIN _main:
%define GLOBAL_MAIN_BUT_NOT_MAIN global _main:

GLOBAL_MAIN_BUT_NOT_MAIN

extern _dprintf

section .rodata
output db "Grace_kid.s", 0
code_str db CODE, 0
SYS_OPEN equ 0x2000005
SYS_CLOSE equ 0x2000006
O_RDWR equ 0x0202
O_RDWR_PERM equ 420

section .text
MAIN_BUT_NOT_MAIN
enter 0, 0
mov rax, SYS_OPEN
lea rdi, [rel output]
mov rsi, O_RDWR ; Check for errors
mov rdx, O_RDWR_PERM
syscall
mov rdi, rax
lea rsi, [rel code_str]
call _dprintf ; Check for errors
mov rdi, SYS_CLOSE
syscall
leave
ret
