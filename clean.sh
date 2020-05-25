#!/bin/bash
DEBUG=0
[[ $DEBUG = 1 ]] && echo  "this script removes all the generated executable and object files"
SUFF=C; suff=c
OSUFF=O; osuff=o; osuffwin=obj; OSUFFWIN=OBJ
# default values
exepr=NULL; EXEPR=NULL; exewin=NULL; EXEWIN=NULL
objf=NULL; OBJF=NULL; objfwin=NULL; 
[[ $DEBUG = 1 ]] && echo  "you have the following c source files: $(ls -lh *.c *.C 2>/dev/null )"
[[ $DEBUG = 1 ]] && echo  "you have the following c object files: $(ls -lh *.o *.O *.obj *.OBJ 2>/dev/null )"
# if programname.c is present, then remove programname or programname.exe
for cpr in $(ls *.c 2>/dev/null )
do
    #find the executable
    exeprt=${cpr%.$suff}
    if [[ $exeprt != $cpr ]] 
    then 
         exepr=${cpr%.$suff} 
         [[ $DEBUG = 1 ]] && echo  exepr = $exepr
    fi
    # remove the executable
    if [[ $exepr != $cpr && $exepr != NULL ]]
    then
        if test -f $exepr; then  rm $exepr; else [[ $DEBUG = 1 ]] && echo "$exepr not present"; fi
    fi
    # do the same for .exe files
    exewin=${cpr%.$suff}.exe
     [[ $DEBUG = 1 ]] && echo  exewin = $exewin
    # if the exe is there, then remove it
    if [[ $exewin != $cpr && $exewin != NULL ]]
    then
        if test -f $exewin; then  rm $exewin; else [[ $DEBUG = 1 ]] && echo  "$exewin not present"; fi
    fi
# the case programname.c ---> programname.EXE
    EXEPRT=${cpr%.$suff}
     if [[ $EXEPRT != $cpr ]]; 
     then 
        EXEPR=${cpr%.$suff}; 
        EXEWIN=${cpr%.$suff}.EXE
    fi
    [[ $DEBUG = 1 ]] && echo  EXEWIN = $EXEWIN
    if [[ $EXEWIN != $cpr && $EXEWIN != NULL ]]
    then
        if test -f $EXEWIN; then  rm $EXEWIN; else [[ $DEBUG = 1 ]] && echo  "$EXEWIN not present"; fi
    fi
done

# do the same for .C program files

for cpr in $(ls *.C 2>/dev/null )
do
    EXEPRT=${cpr%.$SUFF}
    if [[ $EXEPRT != $cpr ]]; 
    then 
        EXEPR=${cpr%.$SUFF}; 
        EXEWIN=${cpr%.$SUFF}.EXE
    fi
    [[ $DEBUG = 1 ]] && echo  EXEWIN = $EXEWIN
    [[ $DEBUG = 1 ]] && echo  EXEPR = $EXEPR
    if [[ $EXEWIN != $cpr && $EXEWIN != NULL ]]
    then
        if test -f $EXEWIN; then  rm $EXEWIN; else [[ $DEBUG = 1 ]] && echo  "$EXEWIN not present"; fi
    fi
    if [[ $EXEPR != $cpr && $EXEPR != NULL ]]
    then
        if test -f $EXEPR; then  rm $EXEPR; else [[ $DEBUG = 1 ]] && echo  "$EXEPR not present"; fi
    fi
# the case programname.c ---> programname.EXE 
    EXEPRT=${cpr%.$suff}
    if [[ $EXEPRT != $cpr ]]; 
    then 
        EXEPR=${cpr%.$suff}; 
        EXEWIN=${cpr%.$suff}.EXE
    fi
    [[ $DEBUG = 1 ]] && echo  EXEWIN = $EXEWIN
    if [[ $EXEWIN != $cpr && $EXEWIN != NULL ]]
    then
        if test -f $EXEWIN; then  rm $EXEWIN; else [[ $DEBUG = 1 ]] && echo  "$EXEWIN not present"; fi
    fi

done

# remove object files

for objf in $(ls *.o *.O *.obj *.OBJ 2>/dev/null )
do
    if test -f $objf; then rm $objf; else [[ $DEBUG = 1 ]] && echo  "$objf not present"; fi
done

for of in $(ls outdata*.dat *.log clean 2>/dev/null )
do
    if test -f $of; then rm $of; else [[ $DEBUG = 1 ]] && echo  "$of not present"; fi
done


