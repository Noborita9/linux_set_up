#!/usr/bin/bash

NOTE_PATH=~/.mynotes

print_menu ()
{
    local ITER=1
    echo "Welcome to notes, what do you want to do?"
    echo "0 - QUIT"
    for note in `ls $NOTE_PATH`
    do
        echo "$ITER - $note"
        ITER=$((ITER+1))
    done
    echo ""
}

read_note ()
{
    ITER=1
    while read -r line
    do
        if [[ $line =~ " " ]]
        then
            echo "$ITER - $line"
            ITER=$((ITER+1))
        fi
    done < $1
}

EXIT=0
menu ()
{
    print_menu
    read -p "Select: " ANSWER
    case $ANSWER in
        0) EXIT=1 ;;
        [123456789]) read_note "$NOTE_PATH/TODOS.txt" ;;
        "e "[123456789]) nvim "$NOTE_PATH/TODOS.txt" ;;
    esac
}

menu

