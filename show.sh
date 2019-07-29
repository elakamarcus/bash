#!/bin/bash

# TODO:
#   - run python script from bash to d/l
# fresh list of articles

# input file
input="articles.lst"

# set control variable
i=0
function header() {
    echo -e "\e[1;30m\t\t---:[ News feed ]:---"
}
# while there are still lines
while IFS= read -r line
do
    # counter = 0 means it is a title
    if [[ "$i" == 0 ]]; then
        clear
        header
        echo -e "\e[32mTitle: \e[37m$line"
        ((i++)) # increment counter
    # if counter = 1 means it is content
    elif [[ "$i" == 1 ]]; then
        echo -e "\e[32mBrief: \e[1;30m$line"
        echo -e "\n\e[1;30m\t\t--- end article ---"
        # wait 5 seconds
        sleep 3s
        i=0
    fi
done < "$input"
# restore the color
echo -e "\e[0m\n"

# notes:
# sleep NUMBER[SUFFIX]
# s, seconds; m, minutes; h, hours
# the python script has to run to 
#generate the filet from wherr to read articles.