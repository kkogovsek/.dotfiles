dt=$(date '+%d/%m %H:%M:%S');
echo "Hello klemen ¯\_(ツ)_/¯"
tput setaf 2
echo "Time:: $dt"
tput setaf 1
shuf -n 1 ~/.config/randomness/stuff_to_print.txt
tput sgr0

