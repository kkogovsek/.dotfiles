#!/bin/bash

# Just some fun
clear
tput setaf 1
echo "Starting magic..."
tput setaf 3
echo "3."
tput setaf 4
echo "2.."
tput setaf 5
echo "1..."
tput setaf 6
echo "Go MoFo!!!"
tput sgr0
sleep 3

# Literaly only serious shit
(cd $1 && nvim)

# Just some fun
clear
tput setaf 2
echo "Hope it didn't suck brah..."
tput setaf 1
echo "Nope FU"
tput sgr0
sleep 1
clear
# PURE Magic kids
[[ $BASH_SOURCE =~ (.*\/).*..* ]] && source ${BASH_REMATCH[1]}welcome.sh
