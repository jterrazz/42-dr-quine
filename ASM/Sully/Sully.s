global _main

extern _printf
extern _sprintf
extern _fopen
extern _fclose
extern _fprintf
extern _system
extern _strcmp

section .rodata
CODE_STR db "global _main%1$c%1$cextern _printf%1$cextern _sprintf%1$cextern _fopen%1$cextern _fclose%1$cextern _fprintf%1$cextern _system%1$cextern _strcmp%1$c%1$csection .rodata%1$cCODE_STR db %2$c%3$s%2$c, 0%1$c%1$cASCII_NL equ 10%1$cASCII_QUOTE equ 34%1$c%1$cSRC_TEMPLATE db %2$cSully_%%d.s%2$c, 0%1$cOBJ_TEMPLATE db %2$cSully_%%d.o%2$c, 0%1$cEXEC_TEMPLATE db %2$cSully_%%d%2$c, 0%1$cCURRENT_FILE db __FILE__, 0%1$cOPEN_PERM db %2$cw%2$c, 0%1$cCOMPILE_TEMPLATE db %2$cnasm -f macho64 %%s && gcc -o %%s %%s && rm %%s%2$c, 0%1$cRUN_TEMPLATE db %2$c./%%s%2$c, 0%1$c%1$csection .data%1$cX_VALUE dq %4$d ; To be replaced%1$cRUN_CMD times 200 db 0%1$cCOMPILE_CMD times 400 db 0%1$cOBJ_FILENAME times 100 db 0%1$cSRC_FILENAME times 100 db 0%1$cEXEC_FILENAME times 100 db 0%1$cCURRENT_FILENAME times 100 db 0%1$c%1$csection .text%1$c_main:%1$center 0, 0%1$cpush r12%1$cpush r13%1$cmov r12, qword[rel X_VALUE] ; r12 = X of file%1$c%1$cstop_when_i_null:%1$ccmp r12, 0%1$cjle return%1$c%1$ccheck_is_first:%1$ccreate_current_name:%1$clea rdi, [rel CURRENT_FILENAME]%1$clea rsi, [rel SRC_TEMPLATE]%1$cmov rdx, r12%1$ccall _sprintf%1$c%1$ctry_accessing_file:%1$clea rdi, [rel CURRENT_FILENAME]%1$clea rsi, [rel CURRENT_FILE]%1$ccall _strcmp%1$c%1$ctest rax, rax%1$cjnz create_src_name%1$cdec r12%1$c%1$ccreate_src_name:%1$clea rdi, [rel SRC_FILENAME]%1$clea rsi, [rel SRC_TEMPLATE]%1$cmov rdx, r12%1$ccall _sprintf%1$c%1$ccreate_exec_name:%1$clea rdi, [rel EXEC_FILENAME]%1$clea rsi, [rel EXEC_TEMPLATE]%1$cmov rdx, r12%1$ccall _sprintf%1$c%1$ccreate_obj_name:%1$clea rdi, [rel OBJ_FILENAME]%1$clea rsi, [rel OBJ_TEMPLATE]%1$cmov rdx, r12%1$ccall _sprintf%1$c%1$ccreate_file:%1$clea rdi, [rel SRC_FILENAME]%1$clea rsi, [rel OPEN_PERM]%1$ccall _fopen%1$ctest rax, rax%1$cjz return%1$cmov r13, rax ; r13 = FD of the new src file%1$c%1$cmov rdi, r13%1$clea rsi, [rel CODE_STR]%1$cmov rdx, ASCII_NL%1$cmov rcx, ASCII_QUOTE%1$clea r8, [rel CODE_STR]%1$cmov r9, r12%1$ccall _fprintf%1$c%1$cmov rdi, r13%1$ccall _fclose%1$c%1$ccreate_compile_cmd:%1$clea rdi, [rel COMPILE_CMD]%1$clea rsi, [rel COMPILE_TEMPLATE]%1$clea rdx, [rel SRC_FILENAME]%1$clea rcx, [rel EXEC_FILENAME]%1$clea r8, [rel OBJ_FILENAME]%1$clea r9, [rel OBJ_FILENAME]%1$ccall _sprintf%1$c%1$ccreate_run_cmd:%1$clea rdi, [rel RUN_CMD]%1$clea rsi, [rel RUN_TEMPLATE]%1$clea rdx, [rel EXEC_FILENAME]%1$ccall _sprintf%1$c%1$ccompile:%1$clea rdi, [rel COMPILE_CMD]%1$ccall _system%1$c%1$crun_exec:%1$clea rdi, [rel RUN_CMD]%1$ccall _system%1$c%1$creturn:%1$cpop r13%1$cpop r12%1$cleave%1$cret%1$c", 0

ASCII_NL equ 10
ASCII_QUOTE equ 34

SRC_TEMPLATE db "Sully_%d.s", 0
OBJ_TEMPLATE db "Sully_%d.o", 0
EXEC_TEMPLATE db "Sully_%d", 0
CURRENT_FILE db __FILE__, 0
OPEN_PERM db "w", 0
COMPILE_TEMPLATE db "nasm -f macho64 %s && gcc -o %s %s && rm %s", 0
RUN_TEMPLATE db "./%s", 0

section .data
X_VALUE dq 5 ; To be replaced
RUN_CMD times 200 db 0
COMPILE_CMD times 400 db 0
OBJ_FILENAME times 100 db 0
SRC_FILENAME times 100 db 0
EXEC_FILENAME times 100 db 0
CURRENT_FILENAME times 100 db 0

section .text
_main:
enter 0, 0
push r12
push r13
mov r12, qword[rel X_VALUE] ; r12 = X of file

stop_when_i_null:
cmp r12, 0
jle return

check_is_first:
create_current_name:
lea rdi, [rel CURRENT_FILENAME]
lea rsi, [rel SRC_TEMPLATE]
mov rdx, r12
call _sprintf

try_accessing_file:
lea rdi, [rel CURRENT_FILENAME]
lea rsi, [rel CURRENT_FILE]
call _strcmp

test rax, rax
jnz create_src_name
dec r12

create_src_name:
lea rdi, [rel SRC_FILENAME]
lea rsi, [rel SRC_TEMPLATE]
mov rdx, r12
call _sprintf

create_exec_name:
lea rdi, [rel EXEC_FILENAME]
lea rsi, [rel EXEC_TEMPLATE]
mov rdx, r12
call _sprintf

create_obj_name:
lea rdi, [rel OBJ_FILENAME]
lea rsi, [rel OBJ_TEMPLATE]
mov rdx, r12
call _sprintf

create_file:
lea rdi, [rel SRC_FILENAME]
lea rsi, [rel OPEN_PERM]
call _fopen
test rax, rax
jz return
mov r13, rax ; r13 = FD of the new src file

mov rdi, r13
lea rsi, [rel CODE_STR]
mov rdx, ASCII_NL
mov rcx, ASCII_QUOTE
lea r8, [rel CODE_STR]
mov r9, r12
call _fprintf

mov rdi, r13
call _fclose

create_compile_cmd:
lea rdi, [rel COMPILE_CMD]
lea rsi, [rel COMPILE_TEMPLATE]
lea rdx, [rel SRC_FILENAME]
lea rcx, [rel EXEC_FILENAME]
lea r8, [rel OBJ_FILENAME]
lea r9, [rel OBJ_FILENAME]
call _sprintf

create_run_cmd:
lea rdi, [rel RUN_CMD]
lea rsi, [rel RUN_TEMPLATE]
lea rdx, [rel EXEC_FILENAME]
call _sprintf

compile:
lea rdi, [rel COMPILE_CMD]
call _system

run_exec:
lea rdi, [rel RUN_CMD]
call _system

return:
pop r13
pop r12
leave
ret
