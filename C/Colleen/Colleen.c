#include <stdio.h>

/*
** Hey, this is an outside comment
*/

char *get_str()
{
	return "#include <stdio.h>%1$c%1$c/*%1$c** Hey, this is an outside comment%1$c*/%1$c%1$cchar *get_str()%1$c{%1$c%2$creturn %3$c%4$s%3$c;%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$c/*%1$c%2$c** Hey, this is an inside comment%1$c%2$c*/%1$c%2$cchar *str = get_str();%1$c%2$cprintf(str, 10, 9, 34, str);%1$c}%1$c";
}

int main(void)
{
	/*
	** Hey, this is an inside comment
	*/
	char *str = get_str();
	printf(str, 10, 9, 34, str);
}
