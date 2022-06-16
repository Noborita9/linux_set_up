#!/usr/bin/bash

print_read_menu ()
{
    echo ""
    echo "q  ) Quit"
    echo "e  ) Edit file"
    echo "c N) Complete task number N"
    echo "d N) Remove task number N"
    echo ""
}

read_options ()
{
    local read_exit=0
    print_read_menu
    read -p "Select: " read_selection

    case $read_selection in
        e) nvim "$NOTE_PATH/$1" ;;
        [cC]" "[123456789]) remove_task $1 ${read_selection:2} ;;
        [dD]" "[123456789]) remove_task $1 ${read_selection:2} ;;
        q) read_exit=1
    esac
    if [[ $read_exit == 0 ]]
    then
        read_options
    fi
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
    # file_to_modify what to remove
    read_options $1 $2
    sleep 0.2
}
