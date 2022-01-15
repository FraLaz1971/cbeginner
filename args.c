#include <stdio.h>

int main(int argc, char **argv){
	int ac = 0, res = 0; char str[20];
	fprintf(stderr, "**************************************\n");
	fprintf(stderr, "** This program shows the use\n");
	fprintf(stderr, "** of program arguments \n");
	fprintf(stderr, "** that are given on the command line \n");
	fprintf(stderr, "** when the program is launched, try with\n");
	fprintf(stderr, "**  args par1 par2 par3 ... \n");
	fprintf(stderr, "**  where parn can be any string/number \n");
	fprintf(stderr, "**************************************\n\n");
	fprintf(stdout, "You entered %d command line parameters to %s\n\n", argc, argv[0]);
	printf("This include %s as first parameter\n", argv[0]);
	for (ac=0; ac<argc; ac++){
		printf("argv[%d] = %s\n", ac, argv[ac]);
	}
	fprintf(stderr, "program %s is ended. Bye. \n", argv[0]);
	fprintf(stderr,"please type a key and then enter \n");
	res = scanf("%s", str);
	return 0;
}
