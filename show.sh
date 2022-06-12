#!/bin/bash

# #######
# TODO:
#   - script on parameter to fetch news
#       - if no script as $2, then go default ../python/
# #######

# if no parameter provided
if [[ -z "$1" ]]; then
    if python3 ../python/physicsfeed01.py 2>/dev/null; then
        # set input file, hardcoded from python script
        if stat "articles.lst" 1>/dev/null 2>&1; then
            input="articles.lst"
        else
            echo "Missing input."
            exit 1
        fi
    else
        echo "Error fetching news feed."
        exit 1
    fi
else
    if stat "$1" 1>/dev/null 2>&1; then
        input="$1"
    else
        echo "File does not exist."
        echo "Run without parameter to fetch news feed from hardcoded script path."
        exit 1
    fi
fi

# set control variable
i=0
function header() {
    clear
    echo -e "\e[1;30m\t\t---:[ News feed ]:---"
}
# read lines from the file into variable 'line'
while IFS= read -r line
do
    # counter = 0 means it is a title
    if [[ "$i" == 0 ]]; then
        header
        echo -e "\e[32mTitle: \e[37m$line"
        ((i++)) # increment counter
    # if counter = 1 means it is content
    elif [[ "$i" == 1 ]]; then
        echo -e "\e[32mBrief: \e[37m$line"
        ((i++)) # increment counter
    elif [[ "$i" == 2 ]]; then
        echo -e "\e[32mURL: \e[1;30m$line"
        echo -e "\n\e[1;30m\t\t--- end article ---"
        # wait 5 seconds
        sleep 7s
        i=0
    fi
done < "$input"
# restore the color
echo -e "\e[0m\n"

# notes:
# sleep NUMBER[SUFFIX]
# s, seconds; m, minutes; h, hours
# the python script has to run to generate the file from where to read articles.
