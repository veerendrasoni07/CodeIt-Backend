#!/bin/sh

#change directory to the temp 
cd temp

#compile the java file 
javac Main.java 2> compile_error.txt

if [ -s compile_error.txt ]; then
    echo "{\"error\":\"$(cat compile_error.txt | head -n 10 | tr '\n' ' ')\"}"
    exit 0
fi 

# Run the compiled program with input redirection
output=$(timeout 5 java Main < input.txt)

echo "{\"output\":\"$output\"}"


