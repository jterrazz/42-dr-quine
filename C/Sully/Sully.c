#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CODE "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$cint main(void)%1$c{%1$c%5$cint i = %4$d;%1$c%5$cif (i <= 0) return (0);%1$c%5$cchar current_file[100];%1$c%5$csprintf(current_file, %2$cSully_%%d.c%2$c, i);%1$c%5$cif (!strcmp(current_file, __FILE__))i--;%1$c%5$cchar new_src_file[100];%1$c%5$csprintf(new_src_file, %2$cSully_%%d.c%2$c, i);%1$c%5$cchar new_exec[100];%1$c%5$csprintf(new_exec, %2$cSully_%%d%2$c, i);%1$c%5$cFILE *f = fopen(new_src_file, %2$cw%2$c);%1$c%5$cif (f == NULL) return (1);%1$c%5$cfprintf(f, CODE, 10, 34, CODE, i, 9);%1$c%5$cfclose(f);%1$c%5$cchar compile_cmd[300];%1$c%5$csprintf(compile_cmd, %2$cgcc -o %%s %%s%2$c, new_exec, new_src_file);%1$c%5$csystem(compile_cmd);%1$c%5$cchar run_cmd[200];%1$c%5$csprintf(run_cmd, %2$c./%%s%2$c, new_exec);%1$c%5$csystem(run_cmd);%1$c%5$creturn (0);%1$c}%1$c"

int main(void)
{
	int i = 5;
	if (i <= 0) return (0);
	char current_file[100];
	sprintf(current_file, "Sully_%d.c", i);
	if (!strcmp(current_file, __FILE__))i--;
	char new_src_file[100];
	sprintf(new_src_file, "Sully_%d.c", i);
	char new_exec[100];
	sprintf(new_exec, "Sully_%d", i);
	FILE *f = fopen(new_src_file, "w");
	if (f == NULL) return (1);
	fprintf(f, CODE, 10, 34, CODE, i, 9);
	fclose(f);
	char compile_cmd[300];
	sprintf(compile_cmd, "gcc -o %s %s", new_exec, new_src_file);
	system(compile_cmd);
	char run_cmd[200];
	sprintf(run_cmd, "./%s", new_exec);
	system(run_cmd);
	return (0);
}
