#!/bin/bash

# Change filename extensions

# This:
#if [[ $# -ne 2]]; then
#	echo "Need exactly two arguments" >&2
# 	exit 1
#fi

# can be shortened to:
[[ $# -ne 2 ]] && { echo "Need exactly two arguments" >&2; exit 1; }

for f in *"$1"; do # iterate through files
# -- means end of options. This is useful for places where you can't 
# control the input variables. For Example, files named "-hello.jpg"
	mv -- "$f" "${f/%$1/$2}" # % is used to only match the end of the file (replaces with $2 then)
done

# Can be ran by:
# Navigating to the folder containing this file
# Creating 3 test files: 
# 	touch {a..c}.txt
# This command will use the script to swap the file types
#   ./10mvnext.sh .txt .jpg 
