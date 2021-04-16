#!/bin/bash

echo -n "Are you sure (Y/N)? "

answered=
while [[ ! $answered ]]; do
	# -r disallows escape sequences
	# -n specified the number of characters to read
	# -s supresses output
	read -r -n 1 -s answer
	if [[ $answer = [Yy] ]]; then # [Yy] is pattern matching
		answered="yes"
	elif [[ $answer = [Nn] ]]; then
		answered="no"
	fi
done

printf "\n%s\n" $answered
