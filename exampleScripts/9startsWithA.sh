#!/bin/bash

sum() {
    # $1 and $2 are locally scoped to the sum function
    return $(( $1 + $2 ))
}

starts_with_a() {
    [[ $1 == [aA]* ]];
    return $? # this stores that exit code of the last executed command
}

if starts_with_a ax; then
    echo "yup"
else
    echo "nope"
fi

if starts_with_a xa; then
    echo "yup"
else
    echo "nope"
fi
