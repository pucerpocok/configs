#! /bin/bash

# used for coloring output
source "${HOME}/.cache/wal/colors.sh"
foreground_alt=$color2

curr=""

function set_pr() {
    echo "# on" > ~/.env
    cat ~/.proxy | while read line
    do
        echo "export $line" >> ~/.env
    done
}

function unset_pr() {
    echo "# off" > ~/.env
    cat ~/.proxy | while read line
    do
        var=$(echo "$line" | cut -d "=" -f 1)
        echo "unset $var" >> ~/.env
    done
}

function output() {
    getcurr
    echo "%{F$foreground_alt} %{F-}$curr"
}

function getcurr() {
    curr=$(head -1 ~/.env | cut -d " " -f 2)
}

function toggle() {
    getcurr
    case "$curr" in
        on)
            unset_pr
            ;;
        off)
            set_pr
            ;;
    esac
}

case "$1" in
    --set)
        echo set
        set_pr
        ;;
    --unset)
        echo unset
        unset_pr
        ;;
    --toggle)
        echo t
        toggle
        ;;
    *)
        output
        ;;
esac

