#!/bin/bash

usage () {
    cat <<END
count [-r] [-b n] [-s n] stop

Print each number up to stop, beginning at 0:
	-b gives the number to begin with (default: 0)
	-h show this help message
	-r reverses the count
	-s sets step size (default: 1)
END
}

error () {
	echo "Error ${1}"
	usage
	exit $2
} >&2 # will go to stderr

isnum () {
	# we assign the patterns to variables here becasue otherwise we would
	# have to escape the special variable in the conditions below where they are used
	declare -r num_re='^[0-9]+$' # $ matches the end of a string; + matches the expression before it 1 or more times
	declare -r octal_re='^0(.+)' # ^ matches the start of a string
	num_error="ok"
    if [[ $1 =~ ${num_re} ]]; then
		if [[ $1 =~ ${octal_re} ]]; then # numbers that start with 0 in bash are octal numbers and will be interpreted differently to what we want
			num_error="${1} is not a number, did you mean ${BASH_REMATCH[1]}?" # BASH_REMATCH contains groups of matches. We ask for 1 because this is the second time a match is made (I think)
			return 1
		fi
	else
		num_error="${1} is not a number"
		return 1
	fi

	return 0
}

declare reverse=""
declare -i begin=0
declare -i step=1


while getopts ":b:s:r:h" opt; do
	case $opt in
		r)
			reverse="yes"			
			;;
		b) 
			isnum ${OPTARG} || error "${OPTARG} is not a number" 1;
			echo ${OPTARG}
			start="${OPTARG}"
			;;
		h)
			usage
			exit 0
			;;
		s)
			isnum ${OPTARG} || error "${OPTARG} is not a number" 1;
			step="${OPTARG}"
			;;
		:) 
			echo "Option -${OPTARG} is missing an argument" >&2
			exit 1
			;;
		\?)
			echo "Unknown option: -${OPTARG}" >&2
			exit 1
			;;
	esac
done

shift $(( OPTIND -1 ))

[[ $1 ]] || { echo "missing an argument" >&2; exit 1; }
[[ $1 =~ ^[0-9]+$ ]] || { echo "$1 is not a number" >&2; exit 1; }
declare end="$1"

if [[ ! $reverse ]]; then
	for (( i=start; i <= end; i+=step )); do
		echo $i
	done
else
	for (( i=end; i >= start; i-=step )); do
		echo $i
	done
fi

exit 0
