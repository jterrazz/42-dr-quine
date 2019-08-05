; Only one comment
%define OPEN_CALL_NB 0x2000005
%define CLOSE_CALL_NB 0x2000006
%define RDWR_CALL_NB 0x0202

%macro insert_main 0
global _main
extern _dprintf

section .rodata
output db "Grace_kid.s", 0
code_str db "; Only one comment%1$c%%define OPEN_CALL_NB 0x2000005%1$c%%define CLOSE_CALL_NB 0x2000006%1$c%%define RDWR_CALL_NB 0x0202%1$c%1$c%%macro insert_main 0%1$cglobal _main%1$cextern _dprintf%1$c%1$csection .rodata%1$coutput db %2$cGrace_kid.s%2$c, 0%1$ccode_str db %2$c%3$s%2$c, 0%1$cSYS_OPEN equ OPEN_CALL_NB%1$cSYS_CLOSE equ CLOSE_CALL_NB%1$cO_RDWR equ RDWR_CALL_NB%1$cO_RDWR_PERM equ 420%1$c%1$csection .text%1$c%1$c_main:%1$center 0, 0%1$cmov rax, SYS_OPEN%1$clea rdi, [rel output]%1$cmov rsi, O_RDWR%1$cmov rdx, O_RDWR_PERM%1$csyscall%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel code_str]%1$ccall _dprintf%1$cmov rax, SYS_CLOSE%1$csyscall%1$cleave%1$cret%1$c%%endmacro%1$c%1$cinsert_main%1$c", 0
SYS_OPEN equ OPEN_CALL_NB
SYS_CLOSE equ CLOSE_CALL_NB
O_RDWR equ RDWR_CALL_NB
O_RDWR_PERM equ 420

section .text

_main:
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
%endmacro

insert_main
