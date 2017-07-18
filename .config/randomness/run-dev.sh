#!/bin/bash

# Just some fun
clear
tput setaf 1
echo "Starting magic..."
tput setaf 3
echo "3."
tput setaf 4
sleep 1
echo "2.."
tput setaf 5
sleep 1
echo "1..."
tput setaf 6
sleep 1
echo "Go MoFo!!!"
sleep 1
tput sgr0

# Literaly only serious shit
(cd $1 && nvim)

# Just some fun
clear
tput setaf 2
echo "Hope it didn't suck brah..."
tput setaf 1
sleep 1
echo "Nope FU"
tput sgr0
sleep 2
clear
# PURE Magic kids
[[ $BASH_SOURCE =~ (.*\/).*..* ]] && source ${BASH_REMATCH[1]}welcome.sh
