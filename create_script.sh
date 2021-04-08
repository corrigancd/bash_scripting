#!/bin/bash

# This script creates a new bash scirpt, adds an alias to .zshrc
# and sets execute permissions for the user who created the script
# Author: Edwin

# Is there an argument?
if [[ ! $1 ]]; then
    echo "Missing argument"
    exit 1
fi

tempdir="${BSHOME}/temp"
scriptname="${1}"
filename="${tempdir}/${scriptname}.sh"

if [[ -e $filename ]]; then
    echo "File ${filename} already exists"
    exit 1
fi

if type "$scriptname" > /dev/null 2>&1; then
    echo "There is already a command with name ${scriptname}"
    exit 1
fi

# This folder contains personal files which are omitted by .gitignore
if [[ ! -d $tempdir ]]; then
    if mkdir "$tempdir"; then # if the mkdir suceeds then the create was successful
        echo "Created ${tempdir}"
    else
        echo "Could not create ${bindir}."
        exit 1
    fi
fi

#create sh file with single line
echo '#!/bin/bash' >${filename}
# change permissions for current user
chmod u+x "$filename"
# add alias in .bashrc file
echo "alias ${scriptname}='${filename}'" >>${HOME}/.zshrc

#Try open newly create file in VsCode, otherwise default editor, otherwise error
if type code; then
    code "${filename}"
    echo "Opening ${scriptname} in VsCode"
elif [[ $EDITOR ]]; then
    $EDITOR "${filename}"
else
    echo "Script create; not starting editor because \$EDITOR is not set."
fi

exit 0
