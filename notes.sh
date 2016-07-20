#!/bin/bash

#   Note this tells the interpreter where to run the script from (bash). The 
#   characters (#!) are known as a shebang. The script will usually still run 
#   without this directive, but not always.

#   http://ryanstutorials.net/linuxtutorial
#   Run with $ bash tutorial.sh or $ sh tutorial
#   A bash script runs line by line--errors are only discovered at runtime
#   Don't forget about tab completion!

echo '\n# Display shell:\n'
echo $SHELL

echo '\n# Where is bash?:\n'
which bash

echo '\n# Print current log in:\n'
whoami

echo '\n# Print working directory:\n'
pwd

echo '\n# List files:\n'
ls -l

#   File paths can be relative, or absolute (referenced rom '/'--root)
#   '~' is a reference to the home directory
#   '.' is a reference to the current directory
#   '..' is a reference to the parent directory

echo '\n# Change directory to Desktop:\n'
cd ~/Desktop ; pwd

echo '\n# Change directory to home:\n'
# cd ; pwd

#   Under the hood, EVERYTHING is a file
#   Linux is an Extensionless System. In other systems such as Windows the 
#   extension is important and the system uses it to determine what type of 
#   file it is. Under Linux the system actually ignores the extension and looks 
#   inside the file to determine what type of file it is.

echo '\n# Find a file type with file command:\n'

echo 'something' > something.txt
file something.txt
rm something.txt

echo '\n# Spaces in file names are fine, but we must us quotes:\n'
touch 'a file'
rm 'a file'

echo '\n# ...or an escape character "\"\n'
touch 'another file'
rm another\ file

#   Files beginning with '.' are 'hidden' files.

echo '\n# List all files (including hidden files) with ls -a:\n'
ls -a

#   printenv to display environment variables
#   display command manuals with man <command>
#   shorthand command arguments can be strung together e.g. ls -alh

echo '\n# Make nested directories with argument -p:\n'
mkdir -pv nested/directories

echo '\n# Remove directories with argument -r:\n'
rm -r nested

echo '\n# Use the touch command to make a blank file:\n'
touch blank.file

echo '\n# Use the cp (copy) command to copy a file or directory:\n'
cp blank.file another.blank.file
rm blank.file 
rm another.blank.file

#   Directories can be copied with the -r (recursive) argument
echo '\n#The mv (move) command can move files to a new directory:\n'
cd ; touch blank.file
mv blank.file Desktop
rm Desktop/blank.file

#   vi (visual) editor is a powerful CLI text editor--two modes, INSERT and EDIT
#   cat (concatenate) used to view a file, but also to concatenate files
#   less is used to scroll through a file
#   head -[X], tail [-X] are used to print the first/last X lines in a file

touch file1 ; touch file22 ; touch file333
echo '\n# The '?' character is a single character wildcard:\n'
rm file?
echo '\n# The '*' character is a multi-character wildcard:\n'
rm file*

#   Linux permissions dictate 3 things you may do with a file, read (r), write 
#   (w) and execute (x). ls -l to view file permissions

touch file
echo '\n# Change permissions by indicating the user, +/- and the permission:'
chmod o+x file
rm file

#   These user and permissions parameters can be chained together. For
#   convenience, a single octal number can be used to assign any of the 2^9
#   possible permissions. So, 750 = 111 101 000 indicates all permissions for
#   user, read and execute for group, and nothing for other. ls -ld for a
#   specific directory. Remember: assigning permissions for a directory does
#   not apply to the directory contents.

echo $'some\ntext\nhere' > textfile

#   Various filters are available apart from cat, head, and tail. Sort acts
#   like cat but sorts lines alphabetically (by default--other options exist).

echo '\n# Output sorted text with sort command:\n'
sort textfile

echo '\n# Print with line numbers with nl:\n'
nl textfile

echo '\n# Perform words count with wc:\n'
wc textfile

echo '\n# The sed command is powerful and can be used to replace text:\n'
sed 's/text/sext/' textfile


#   Grep can be used to search files using regular expressions (regex). The 
#   grep command is extended by egrep.

echo '\n# Redirect to a file with the greater than (>) operator:\n'
echo 'first line' > output
cat output

echo '\n#Append with double greater than (>>):\n'
echo 'second line' >> output
cat output

rm output

#   All this works because conceptually, all unix commands have an input stream 
#   and an output stream (and a possible error stream). This allows commands to 
#   be strung together.

echo '\n#Redirect the other way with the less than (<) operator:\n'

#   We can redirect errors with 2> (2 indicates the error stream). Redirection
#   is for files, piping is for programs.

echo '\n#Pipe between programs e.g. head and tail:\n'

cat textfile | head -2 | tail -1
rm textfile

#   Processes may be managed with top, ps [aux], killed with kill <pid>

echo '\n#Run a process in the background with the & operator:\n'
sleep 5 &

echo '\n#Monitor this with the jobs command:\n'
jobs

#   We can use the fg command to bring background jobs to the foreground.

#   Bash is in fact a whole programming language, but this script is not 
#   intended to explore those capabilities.

#   Some more powerful bash software includes: cron for task scheduling and 
#   running scripts periodically; find for searching for files; tar for 
#   compressing files into a Tape ARchive. awk or perl for text manipulation; 
#   scp for securely copying files between machines.

#   On OSX, shell preferences can be set in hidden file ~/.bash_profile, which 
#   is checked before the shell environment is loaded. It can be reset with the 
#   source command. An alias is a way of defining or redefining custom commands.
