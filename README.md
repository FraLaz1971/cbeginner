# c language programs for beginners 
introductory exercises
from Dan Gookin ["C for dummies"](https://www.amazon.it/dp/0764570684?tag=duckduckgo-newext-it-21&linkCode=osi&th=1&psc=1) book (2004). 

revised and tested by fralaz1971 fralaz1971@gmail.com
## instructions to run programs 

### we're supposing you're at the linux/MacOS/msys2 terminal.

To see the c programs contained in the main folder:

	ls *.c *.C
	
to see what is contained in the exercise folder

	ls 
	
to compile and link the program goodbye.c

	gcc goodbye.c -o goodbye
	
to run the program named "goodbye"

	./goodbye
	
to compile and link a c program in general

	gcc <programname>.c -o <programname>
	
to run a c executable program in general

	./<programname>
	
to compile a c source file into an object file without linking

	gcc -c <programname>.c
	
to link an object file into an executable

	gcc -o <programname> programname.o
	
2 steps compilation example

	gcc -c hello.c
	gcc hello.o -o hello
	
to compile a simple c program using make (without makefile)

	make <programname> # without '.c' extension e.g.
	make hello
	
to remove all generated files

	./clean.sh
	
in case the file clean.sh is not executable, type

	chmod +x clean.sh 
	
(this chmod only one time)
to remove a single file (pay attention!)

	rm <filename>
	
e.g.

	rm hello
	
to copy a file to another with different filename and same content

	cp <filename> <filename2>
	
e.g.

	cp hello.c hello2.c
	
check what you did

	ls -lh hello.c hello2.c
	
# and so on ...
list all files which name  starts with hello and finish with .c

	ls -lh hello*.c
	
this 
    clean.sh 
script is an example of how shell script can simplify your life
infact running the program clean.sh is faster than removing all the files one-by-one
it is also faster than selecting all with the GUI file browser and then removing it

# check by yourself!
###
you can copy-paste examples from Dan Gookin "C for dummies" book
and execute them, but some characters encoding is not pure ASCII and gives error
you have to change double quotes and perhaps other, see copypasterror.c program

	gcc copypasterror.c -o copypasterror

to clean the terminal screen

	clear
	
### checking errors
the program error.c is typed on purpose with an error
find the error and correct it :-)
check the difference with file you change with diff program

    diff -s whoru.c whoruorig.c
    diff -s whoru.c whoru2.c
    
you can also run interactively an interactive program
	
    echo "ciccio" | ./whoru
    echo "kingElizabeth" | ./whoru
    
gives batch input to 3x2 matrix processing program
    
    echo 1 10 11 22 34 57 | ./matrix
    
#
### doublematrix.c 
takes as input a nx3 array 
and multiply each element x 2, n is variable
the input data are contained in an ascii text file
the output data are given on the standard output (screen)

    ./doublematrix 6000 < longinput.dat

save output to a file for n=60

    ./doublematrix 60 < longinput.dat > outdata-60.dat 2>doublematrix.log

the same for n=15 (more generic syntax) and using cat

    n=15; cat longinput.dat | ./doublematrix "$n" > outdata-"$n".dat 2>doublematrix.log

to see the files tha has been produced

    ls -alhrt 

or
    
    nautilus . &

to generate the long input random data file (values in [1,100) )

    for c in {1..10000}; do echo $(($RANDOM*100/32767)) $(($RANDOM*100/32767)) $(($RANDOM*100/32767)); done > longinput.dat

to generate a shorter 7 rows input random data file
    
    for c in {1..7}; do echo $(($RANDOM*100/32767)) $(($RANDOM*100/32767)) $(($RANDOM*100/32767)); done > shortinput.dat

##

when you compile and link in one step, a temp object .o file is generated and then removed
look inside compile-insult.log.save for details
see how insult your ex-partner using the gets function

    make insult
    echo "J.Doe" | ./insult
    
#
### args.c ---> program arguments
We show how to give input to the program directly in the command line launching them
program executable.
    int main(int argc, char **argv )
it is called the signature of the main function
argc and argv are the input argument to the function main() the function main() always return an integer, that gives 0 if the main() ended with no error
argc is an integer expressing the input values given to the program, added 1 for the program name that is the first (index zero) argument
char **argv or also char * argv[] it is an array of strings, of sets of characters that can be passed to the program
say you have a program called my prog
    myprog.exe
when you run it like:

    myprog 1 2 "hello" 3 "alita"

then
argc will be = 6 because you have 1 2 "hello" 3 "alita" that are 5 plus the program name myprog.exe 
in total they are 6.
this means that argv array will be:
argv[0] = "myprog.exe"
argv[1] = "1"
argv[2] = "2"
argv[3] = "hello"
argv[4] = "3"
argv[5] = "alita"
the variable argc expresses the number of input arguments to the program.
(+1 that is the program name, and it is the first element of argv[])
argv[] instead is an array of strings, do you know what are strings?
They are explained in Gookin (2004), too.
### seeing the run with no arguments:
    francesco@squirrel:~/projects/c_cpp/cbeginner$ ./args
    **************************************
    ** This program shows the use
    ** of program arguments 
    ** that are given on the command line 
    ** when the program is launched, try with
    **  args par1 par2 par3 ... 
    **  where parn can be any string/number 
    **************************************

    You entered 1 command line parameters to ./args

    This include ./args as first parameter
    argv[0] = ./args
    program ./args is ended. Bye. 
    please type a key and then enter 
    d
#
    francesco@squirrel:~/projects/c_cpp/cbeginner$ ./args 1 2 "hello" 0.41
    **************************************
    ** This program shows the use
    ** of program arguments 
    ** that are given on the command line 
    ** when the program is launched, try with
    **  args par1 par2 par3 ... 
    **  where parn can be any string/number 
    **************************************

    You entered 5 command line parameters to ./args

    This include ./args as first parameter
    argv[0] = ./args
    argv[1] = 1
    argv[2] = 2
    argv[3] = hello
    argv[4] = 0.41
    program ./args is ended. Bye. 
    please type a key and then enter 
    h
#
    ├── args.c (shows the main(argc, argv) function arguments usage)
    ├── clean.sh (program to remove generated files)
    ├── compile-insult.log.save (shows where temporary object files are created -and a warning-)
    ├── copypasterror.c
    ├── doublematrix.c
    ├── error.c
    ├── ERROR.C
    ├── goodbye.c
    ├── GOODBYE.c
    ├── hello.c (classic first program)
    ├── inmatrix.dat (matrix to give as input data file)
    ├── insult2.c
    ├── insult.c (example of interactive program , batch if read from stdin)
    ├── justify.c
    ├── longinput.dat (long data input file)
    ├── matrix.c
    ├── README.md (full instuctions markdown)
    ├── README (full instuctions)
    ├── README.short (very short instructions)
    ├── README.win (how to run on MS Windows)
    ├── rules.c
    ├── whoru2.c
    ├── whoruage.c
    ├── whoru.c
    └── whoruorig.c

    0 directories, 25 files
