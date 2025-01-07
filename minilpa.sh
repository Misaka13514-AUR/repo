#!/bin/sh

# Use directory with write permission (user's home)
WORKING_DIR=~/.MiniLPA
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# Run program
java -jar /usr/lib/minilpa/MiniLPA.jar "$@"
