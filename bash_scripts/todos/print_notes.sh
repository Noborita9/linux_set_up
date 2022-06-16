#!/usr/bin/bash

# Colors
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

print_menu ()
{
    local ITER=1
    echo "Welcome to notes, what do you want to do?"
    echo "q - QUIT"
    for note in `ls $NOTE_PATH`
    do
        echo "$ITER - $note"
        ITER=$((ITER+1))
    done
    echo ""
}
