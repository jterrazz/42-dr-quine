; Only one comment
%define CODE "; Only one comment%1$c%%define CODE %2$c%3$s%2$c%1$c%%define MAIN_BUT_NOT_MAIN _main:%1$c%%define GLOBAL_MAIN_BUT_NOT_MAIN global _main:%1$c%1$cGLOBAL_MAIN_BUT_NOT_MAIN%1$c%1$cextern _dprintf%1$c%1$csection .rodata%1$coutput db %2$cGrace_kid.s%2$c, 0%1$ccode_str db CODE, 0%1$cSYS_OPEN equ 0x2000005%1$cSYS_CLOSE equ 0x2000006%1$cO_RDWR equ 0x0202%1$cO_RDWR_PERM equ 420%1$c%1$csection .text%1$cMAIN_BUT_NOT_MAIN%1$center 0, 0%1$cmov rax, SYS_OPEN%1$clea rdi, [rel output]%1$cmov rsi, O_RDWR%1$cmov rdx, O_RDWR_PERM%1$csyscall%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel code_str]%1$ccall _dprintf%1$cmov rax, SYS_CLOSE%1$csyscall%1$cleave%1$cret%1$c"
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
mov rsi, O_RDWR
mov rdx, O_RDWR_PERM
syscall
mov rdi, rax
lea rsi, [rel code_str]
mov rdx, 10
mov rcx, 34
lea r8, [rel code_str]
call _dprintf
mov rax, SYS_CLOSE
syscall
leave
ret
