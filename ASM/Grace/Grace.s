; Only one comment
%macro insert_code_str 0
code_str db "; Only one comment%1$c%%macro insert_code_str 0%1$ccode_str db %2$c%3$s%2$c, 0%1$c%%endmacro%1$c%1$c%%macro insert_data 0%1$cglobal _main%1$cextern _dprintf%1$c%1$csection .rodata%1$coutput db %2$cGrace_kid.s%2$c, 0%1$cinsert_code_str%1$cSYS_OPEN equ 0x2000005%1$cSYS_CLOSE equ 0x2000006%1$cO_RDWR equ 0x0202%1$cO_RDWR_PERM equ 420%1$c%%endmacro%1$c%1$c%%macro insert_main 0%1$csection .text%1$c%1$c_main:%1$center 0, 0%1$cmov rax, SYS_OPEN%1$clea rdi, [rel output]%1$cmov rsi, O_RDWR%1$cmov rdx, O_RDWR_PERM%1$csyscall%1$ctest rax, rax%1$cjz return%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel code_str]%1$ccall _dprintf%1$cmov rax, SYS_CLOSE%1$csyscall%1$creturn:%1$cleave%1$cret%1$c%%endmacro%1$c%1$cinsert_data%1$cinsert_main%1$c", 0
%endmacro

%macro insert_data 0
global _main
extern _dprintf

section .rodata
output db "Grace_kid.s", 0
insert_code_str
SYS_OPEN equ 0x2000005
SYS_CLOSE equ 0x2000006
O_RDWR equ 0x0202
O_RDWR_PERM equ 420
%endmacro

%macro insert_main 0
section .text

_main:
enter 0, 0
mov rax, SYS_OPEN
lea rdi, [rel output]
mov rsi, O_RDWR
mov rdx, O_RDWR_PERM
syscall
test rax, rax
jz return
mov rdi, rax
lea rsi, [rel code_str]
mov rdx, 10
mov rcx, 34
lea r8, [rel code_str]
call _dprintf
mov rax, SYS_CLOSE
syscall
return:
leave
ret
%endmacro

insert_data
insert_main
