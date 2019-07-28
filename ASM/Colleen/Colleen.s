; Outside comment

global _main
extern _printf

section .rodata
code_str db "; Outside comment%1$c%1$cglobal _main%1$cextern _printf%1$c%1$csection .rodata%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c_main:%1$center 0, 0%1$clea rdi, [rel code_str]%1$c; Inside comment%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel code_str]%1$ccall _printf%1$cleave%1$ccall return%1$c%1$creturn:%1$cret%1$c", 0

section .text
_main:
enter 0, 0
lea rdi, [rel code_str]
; Inside comment
mov rsi, 10
mov rdx, 34
lea rcx, [rel code_str]
call _printf
leave
call return

return:
ret
