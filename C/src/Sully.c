#include <stdlib.h>
#include <stdio.h>

#define CODE "Code %d"

int main(void)
{
	int i = 5;
	if (i <= 0) return (0);
	char new_src_file[100];
	sprintf(new_src_file, "Sully_%d.c", i - 1);
	FILE *f = fopen(new_src_file, "w");
	if (f == NULL) return (1);
	fprintf(f, CODE, i - 1);
	char compile_cmd[200];
	sprintf(compile_cmd, "gcc -o %s %s", "Sully", new_src_file);
	printf("YOOO %s\n", compile_cmd);
	system(compile_cmd);
	char run_cmd[100];
	sprintf(run_cmd, "./%s%d%s", "Sully_", i - 1 ,".c");
	system(run_cmd);
	return (0);
}
