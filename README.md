To setup:
- Clone this repository
- Create a bashscripting home global in your .bashrc or .zshrc
    `export BSHOME="$HOME/work/bash_scripting"`

To use Simple note taking application:
- Use the take notes script by adding the alias you would like to utilise
    `alias tn="$BSHOME/tn.sh"`
- Restart terminal and type `tn` and follow on screen instructions
Notes: 
- Notes are stored in `/bash_scripting/temp/notes.txt`
- Filename can be customised with `tn <custom filename>`. For Example:
    `tn mytest` will add your message to `/bash_scripting/temp/mytestnotes.txt`

You can create and open shell scripts for editing using the ./create_scripts.sh. Execute the script followed by the name of your new script. It will automatically add an alias (like `tn` above to your .zshrc), assign execute permissions to the current user and will attempt to open the new file in your code editor. 
