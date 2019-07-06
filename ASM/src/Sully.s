global _main

extern _printf
extern _sprintf

section .rodata
CODE_STR db "The str is %s", 0

SRC_ORIGINAL db "src/Sully.s", 0
SRC_TEMPLATE db "Sully_%d.c", 0
EXEC_TEMPLATE db "Sully_%d", 0
OPEN_PERM db "w", 0
COMPILE_TEMPLATE db "gcc -o %s %s", 0
RUN_TEMPLATE db "./%s", 0

section .data
IS_FIRST db 1
X_VALUE dq 5
COMPILE_CMD times 300 db 0
RUN_CMD times 200 db 0
SRC_FILENAME times 100 db 0
EXEC_FILENAME times 100 db 0

section .text
_main:
	enter 0, 0
	push r12
	push r13
	mov r12, qword[rel X_VALUE]
	cmp r12, 0
	jle return

check_is_first:
	cmp byte[rel IS_FIRST], 1
	mov byte[rel IS_FIRST], 0
	je create_src_name
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

	; Printer
	lea rdi, [rel CODE_STR]
	lea rsi, [rel EXEC_FILENAME]
	; enter 0, 0
	; push rdi
	call _printf
	; pop rdi
	; leave
	; Printer

return:
	pop r13
	pop r12
	leave
	ret
