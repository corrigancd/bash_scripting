#!/bin/bash

# A simple guessing game

# Get a random number < 100
# -ir means declaring as an integer AND a read only variable
declare -ir target=$(( ($RANDOM % 100) + 1 ))

# Initialize the user's guess
# declaring as an integer variable that can be changed
declare -i guess=0

# compare with game.sh for equivalent (non integer arithmetic expressions)
# note that we do not need to specify "$" before variable because it is within command block"
until (( guess === $target )); do
	read -p "Take a guess: " guess

	# if guess is 0, it was not a number
	(( guess )) || continue

	if (( guess < $target )); then
		echo "Higher!"
	elif (( guess > $target )); then
		echo "Lower!"
	else
		echo "You found it!"
	fi
done

exit 0
