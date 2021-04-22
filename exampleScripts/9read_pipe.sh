#!/bin/bash

# Attempts to cound the lines of output of any given command
declare -i count=0

count_lines () {
    while read -r; do
        ((++count))
    done
}

$* | count_lines
echo $count
