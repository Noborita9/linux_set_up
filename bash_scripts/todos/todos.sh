#!/usr/bin/bash

NOTE_PATH=~/.mynotes

source ./print_notes.sh
source ./read_notes.sh
source ./alter_tasks.sh
source ./get_file_from_number.sh

EXIT=0
menu ()
{
    print_menu
    read -p "Select: " ANSWER

    case $ANSWER in
        [qQ]) EXIT=1 ;;
        [123456789])
            local result=$(get_file_from_number ANSWER)
            read_note "$NOTE_PATH/$result"
        ;;
        "e "[123456789])
            local number=${ANSWER:2}
            local result=$(get_file_from_number number)
            nvim "$NOTE_PATH/$result"
        ;;
        "e "*)
            nvim "$NOTE_PATH/${ANSWER:2}"
        ;;
    esac

    sleep 0.2
    if [[ $EXIT == 0 ]]
    then
        echo ""
        menu
    fi
}

menu
echo "bye"

