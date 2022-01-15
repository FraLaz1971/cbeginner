REM This script is not complete
REM Date: 2022-01-16
REM Author: Francesco Lazzarotto mailto:fralaz1971@gmail.com
@echo off
SET DEBUG=0
[[ %DEBUG% == 1 ]]  && echo  "this script removes all the generated executable and object files"
SET SUFF=C & SET suff=c
SET OSUFF=O & SET osuff=o & SET osuffwin=obj & SET OSUFFWIN=OBJ
# default values
SET exepr=NULL & SET EXEPR=NULL & SET exewin=NULL & SET EXEWIN=NULL
SET objf=NULL & SET OBJF=NULL & SET objfwin=NULL & 
[[ %DEBUG% ==  1 ]]  && echo  "you have the following c source files: %%(dir /OD *.c *.C )"
[[ %DEBUG% ==  1 ]]  && echo  "you have the following c object files: %%(dir /OD *.o *.O *.obj *.OBJ )"
REM if programname.c is present, then remove programname or programname.exe
for cpr in %(dir /B *.c 2>/dev/null )
do
    REM find the executable
    exeprt=%{cpr%.%suff}
    if [[ %exeprt != %cpr ]] 
    then 
         exepr=%{cpr%.%suff} 
         [[ %DEBUG% == 1 ]]  && echo  exepr = %exepr%
    fi
    # remove the executable
    if [[ %exepr% != %cpr%  && %exepr% != NULL ]]
    then
        if test -f %exepr% & then  echo del %exepr% & else [[ %DEBUG% == 1 ]]  && echo "%exepr% not present" & fi
    fi
    # do the same for .exe files
    exewin=%{cpr%.%suff}.exe
     [[ %DEBUG% ==  1 ]]  && echo  exewin = %exewin%
    # if the exe is there, then remove it
    if [[ %exewin% != %cpr%  & & %exewin% != NULL ]]
    then
        if test -f %exewin% & then echo del %exewin% & else [[ %DEBUG% == 1 ]]  && echo  "%exewin% not present" & fi
    fi
# the case programname.c ---> programname.EXE
    EXEPRT=%{cpr%.%suff}
     if [[ %EXEPRT% != %cpr ]] & 
     then 
        EXEPR=%{cpr%.%suff} & 
        EXEWIN=%{cpr%.%suff}.EXE
    fi
    [[ %DEBUG% == 1 ]]  && echo  EXEWIN = %EXEWIN%
    if [[ %EXEWIN% != %cpr%  && %EXEWIN != NULL ]]
    then
        if test -f %EXEWIN% & then  echo del %EXEWIN% & else [[ %DEBUG% == 1 ]]  && echo  "%EXEWIN not present" & fi
    fi
done

REM do the same for .C program files

for cpr in %(ls *.C 2>/dev/null )
do
    EXEPRT=%{cpr%.%SUFF}
    if [[ %EXEPRT% != %cpr ]] & 
    then 
        EXEPR=%{cpr%.%SUFF} & 
        EXEWIN=%{cpr%.%SUFF}.EXE
    fi
    [[ %DEBUG% == 1 ]]  & & echo  EXEWIN = %EXEWIN
    [[ %DEBUG% == 1 ]]  & & echo  EXEPR = %EXEPR
    if [[ %EXEWIN% != %cpr  & & %EXEWIN != NULL ]]
    then
        if test -f %EXEWIN% & then  echo del %EXEWIN% & else [[ %DEBUG% == 1 ]]  && echo  "%EXEWIN not present" & fi
    fi
    if [[ %EXEPR% != %cpr%  && %EXEPR% != NULL ]]
    then
        if test -f %EXEPR% & then  echo del %EXEPR% & else [[ %DEBUG = 1 ]]  && echo  "%EXEPR% not present" & fi
    fi
REM the case programname.c ---> programname.EXE 
    EXEPRT=%{cpr%.%suff}
    if [[ %EXEPRT% != %cpr ]] & 
    then 
        EXEPR=%{cpr%.%suff} & 
        EXEWIN=%{cpr%.%suff}.EXE
    fi
    [[ %DEBUG% == 1 ]]  & & echo  EXEWIN = %EXEWIN%
    if [[ %EXEWIN% != %cpr  & & %EXEWIN% != NULL ]]
    then
        if test -f %EXEWIN & then  echo del %EXEWIN% & else [[ %DEBUG% == 1 ]]  && echo  "%EXEWIN% not present" & fi
    fi

done

REM remove object files

for objf in %(dir /B *.o *.O *.obj *.OBJ 2>err.log )
do
    if test -f %objf% & then echo del %objf% & else [[ %DEBUG = 1 ]]  && echo  "%objf% not present" & fi
done

for of in %(dir /B outdata*.dat *.log clean 2>/dev/null )
do
    if test -f %of% & then echo del %of% & else [[ %DEBUG = 1 ]]  && echo  "%of% not present" & fi
done


