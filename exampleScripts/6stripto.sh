#!/bin/bash

# Prints standard input to standard output
# discarding all lines before the first line matching 
# the string given as the first argument.

# Can be executed by running the below from the terminal.
# This will redirect the input to webpage.html and will
# log the lines AFTER the line that body is found on:
# ./stripto body < webpage.html


if [[ ! $1 ]]; then
	echo "Need first argument" >&2
	exit 1
fi

# read upto first match
while read -r || [[ $REPLY ]]; do
	if [[ $REPLY =~ $1 ]]; then # =~ means 'contains'
		echo "$REPLY"
		break # the IF statement could be negated and 'continue' could be used (as an alternative to 'break') in a for loop)
	fi
done

# We only need to evaluate the first condition when reading the file. When the end 
# of the file is found (i.e. read -r is false), then we evaluate 
# if some reply data exists and will print it (same for the while loop above)
while read -r || [[ $REPLY ]]; do
	echo "$REPLY"
done

exit 0
