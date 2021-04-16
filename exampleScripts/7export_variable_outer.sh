#!/bin/bash

# declaring a variable for use within this parent script
declare var="outer"

# OR

# If we want a variable from a parent process we can export like
# declare -x var="outer"

echo "outer before: $var"

# notice that the $var variable in export_variable_inner.sh
# is assigned when using the -x line above
./export_variable_inner.sh
echo "outer after: $var"
