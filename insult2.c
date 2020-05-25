#include <stdio.h>

int main(int argc, char **argv){
	char ans[20];
	puts("hello, how are you today?");
	gets(ans);
	puts("ok, you told me:"); printf("\"%s\"\n",ans);
	puts("and instead i will say: piece of shit!");
	return 0;
}
