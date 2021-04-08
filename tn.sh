#!/bin/bash

# Simple note-taking script
# Author: Edwin

#get the date
date=$(date)

#get the topic
topic="$1"

# This folder contains personal files which is omitted by .gitignore
# so we create it each time a user clones the repo for the first time
tempdir="${BSHOME}/temp"
if [ ! -d $tempdir ]; then
    echo "Creating ${tempdir}"
    mkdir ${tempdir}
else
    echo "${tempdir} already exists"
fi


#filename to write to
filename="${tempdir}/${topic}notes.txt"

read -p "Your note: " note

if [[ $note ]]; then
    echo "$date: $note" >> "$filename"
    echo "Note '$note' saved to $filename"
    exit 0
else
    echo "No input; note wasn't saved."
fi
