#!/bin/bash

echo $@

#breaks up into rows and prints each arg on separate line
for a in $@; do
    echo $a;
done
# for example:
# ./8printargs.sh "hello there are several args"
# hello
# there
# are
# several
# args


for a in "$@"; do
    echo $a;
done
# for example:
# ./8printargs.sh "hello there are several args"
# hello there are several args
