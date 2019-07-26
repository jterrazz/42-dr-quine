global _main

extern _printf
extern _sprintf
extern _fopen
extern _fclose
extern _fprintf
extern _system
extern _access

section .rodata
CODE_STR db "global _main%1$c%1$c_main:ret", 0 ; Replace is first 0

ASCII_NL equ 10

SRC_TEMPLATE db "Sully_%d.s", 0
OBJ_TEMPLATE db "Sully_%d.o", 0
EXEC_TEMPLATE db "Sully_%d", 0
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
	xor rsi, rsi ; Set to zero
	call _access

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
	mov r13, rax ; r13 = FD of the new src file

	mov rdi, r13
	lea rsi, [rel CODE_STR]
	mov rdx, ASCII_NL
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
