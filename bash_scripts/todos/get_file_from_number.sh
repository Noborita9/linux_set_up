#!/usr/bin/bash

get_file_from_number ()
{
    local ITER=1
    local filename=""
    for file in `ls $NOTE_PATH`
    do
        if [[ $ITER -eq $1 ]]
        then
            filename=$file
            echo "$filename"
        fi
        ITER=$((ITER+1))
    done
}
