#!/bin/bash

#called from 'export_variable_outer'
echo "inner before: $var"

# Each process has its own environment,
# and variables from child environments are NOT
# inherited by the parent process
export var="inner"
echo "inner after: $var"
