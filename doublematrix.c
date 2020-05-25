#include <stdio.h>
#include <stdlib.h>
/* accepts input data typed from the keyboard  */
/* or from the standard input */
int main(int argc, char** argv){
	/* check on input parameters number */
       if (argc != 2) {
          fprintf(stderr,"%s.main() this program reads a 2D array with n rows and 3 colunns\n", argv[0]);
          fprintf(stderr,"%s.main() and gives it doubled in output\n", argv[0]);
          fprintf(stderr,"%s.main() you enterd %d input parameters\n", argv[0], argc-1);
          fprintf(stderr,"%s.main() usage %s <nrows> \n", argv[0], argv[0]);
          exit(0);
        }
	/* 2D array declaration*/
	const char *snrows=argv[1];
	fprintf(stderr,"going to process a matrix called disp with %s rows and 3 columns\n", snrows);
	int nrows=atoi(snrows);
	int disp[nrows][3]; int outval;
	/*Counter variables for the loop*/
	int i, j;
	fprintf(stderr,"This reads and prints out a matrix with %d rows and 3 columns\n", nrows);
	for(i=0; i<nrows; i++) {
		for(j=0;j<3;j++) {
			fprintf(stderr, "Enter value for disp[%d][%d]:", i, j);
			scanf("%d", &disp[i][j]);
		}
	}
	//Displaying array elements
	fprintf(stderr, "Doubled two Dimensional array elements:\n");
		for(i=0; i<nrows; i++) {
			for(j=0;j<3;j++) {
				outval=2*disp[i][j];
				printf("%d ", outval);
				if(j==2){
					printf("\n");
				}
			}
		}
	return 0;
}
