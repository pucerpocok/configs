#! /bin/bash

# used for coloring output
source "${HOME}/.cache/wal/colors.sh"
foreground_alt=$color2

curr=""

function set_us() {
    setxkbmap -layout us
}

function set_hu() {
    setxkbmap -layout hu
}

function output() {
    getcurr
    echo "%{F$foreground_alt} %{F-}$curr"
}

function getcurr() {
    curr=`setxkbmap -query | grep layout | tr -d ' ' | cut -d ':' -f 2`
}

function toggle() {
    getcurr
    case "$curr" in
        hu)
            set_us
            ;;
        us)
            set_hu
            ;;
    esac
}

case "$1" in
    --hu)
        set_hu
        ;;
    --us)
        set_us
        ;;
    --toggle)
        toggle
        ;;
    *)
        output
        ;;
esac

