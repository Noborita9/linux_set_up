#!/usr/bin/bash

remove_task ()
{
    sed -i "$2" "$NOTE_PATH/$1"
}
complete_task ()
{
    sed -i "$2" "$NOTE_PATH/$1"
}
