#!/bin/bash

# Script will print the string input in a box to the console
# the objective is to show how functions can be used in bash

# A function to draw a line
drawline () { 
    declare line=""
    declare char="-"

    # $1 is expanded to be the value of len below.
    # The purpose of this here is to show that drawline
    # function has it's own context
    # better solution is to declare an empty varialbe at the top
    # to make the code more 'self commenting'
    # See 9hist.sh script for example of this (als redirection)
    for (( i=0; i<$1; ++i )); do
        line="${line}${char}"
    done
    printf "%s\n" "$line"
}

# no arguments, no output
[[ ! $1 ]] && exit 0

declare -i len="${#1} + 4" # #1 is how we calculate the length of variable 1
drawline len
printf "| %s |\n" "$1"
drawline len


# Example:
#./9box.sh hello will print:
# ---------
# | hello |
# ---------
