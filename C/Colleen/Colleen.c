#include <stdio.h>

/*
** Hey, this is an outside comment
*/

int main(void)
{
	/*
	** Hey, this is an inside comment
	*/
	char *str = "#include <stdio.h>%c%c/*%c** Hey, this is an outside comment%c*/%c%cint main(void)%c{%c%c/*%c%c** Hey, this is an inside comment%c%c*/%c%cchar *str = %c%s%c;%c%cprintf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 10);%c}%c";
	printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 10);
}
