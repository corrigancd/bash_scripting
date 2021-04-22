#!/bin/bash

declare -i i=0

if [[ $1 == "-l" ]]; then
    # setting a destination for all script output
    exec >logfile
fi    

while true; do
    echo "still here $((++i))"
    sleep 1 # pause for 1 second
done

# Run this script with the following options to:
# - log the outputs of the script that is running in 
#   the background to a file named log

# & means the script will start running but in the background
# nohup means the script will keep running when the terminal session is closed

#   nohup stillhere > log &

# tail returns the last ten lines of each file that it is given
# (-f means to follow the changes to the file also)

# use "tail -f log"
