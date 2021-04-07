#!/bin/bash

# Simple note-taking script
# Author: Edwin

#get the date
date=$(date)

#get the topic
topic="$1"

#filename to write to
filename="${HOME}/work/bash_scripting/temp/${topic}notes.txt"

read -p "Your note: " note

if [[ $note ]]; then
    echo "$date: $note" >> "$filename"
    echo "Note '$note' saved to $filename"
else
    echo "No input; note wasn't saved."
fi