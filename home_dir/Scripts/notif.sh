#! /bin/bash

# used for coloring output
source "${HOME}/.cache/wal/colors.sh"
foreground_alt=$color2

curr=""

function enable_notif() {
    echo "# on" > ~/.notif
    pkill -u "$USER" -USR2 dunst
}

function disable_notif() {
    echo "# off" > ~/.notif
    pkill -u "$USER" -USR1 dunst
}

function output() {
    getcurr
    case "$curr" in
        on)
            echo "%{F$foreground_alt} %{F-}$curr"
            ;;
        off)
            echo "%{F$foreground_alt} %{F-}%{F#f00}$curr%{F-}"
            ;;
    esac
}

function getcurr() {
    curr=$(head -1 ~/.notif | cut -d " " -f 2)
}

function toggle() {
    getcurr
    case "$curr" in
        on)
            disable_notif
            ;;
        off)
            enable_notif
            ;;
    esac
}

case "$1" in
    --enable)
        echo enable
        enable_notif
        ;;
    --disable)
        echo disable
        disable_notif
        ;;
    --toggle)
        echo t
        toggle
        ;;
    *)
        output
        ;;
esac

