#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

source "${HOME}/.cache/wal/colors.sh"
background=$color0
background_alt=$color3
foreground=$color15
foreground_alt=$color2
highlight=$color4

export POLY_WS_ICON_0="0;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_1="1;%{F$foreground_alt} %{F-} web"
export POLY_WS_ICON_2="2;%{F$foreground_alt} %{F-} dev"
export POLY_WS_ICON_3="3;%{F$foreground_alt} %{F-} ent"
export POLY_WS_ICON_4="4;%{F$foreground_alt} %{F-} rgr"
export POLY_WS_ICON_5="5;%{F$foreground_alt} %{F-} com"
export POLY_WS_ICON_6="6;%{F$foreground_alt} %{F-} bit"
export POLY_WS_ICON_7="7;%{F$foreground_alt} %{F-} mus"
#
export POLY_WS_ICON_8="8;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_9="9;%{F$foreground_alt} %{F-} win"
export POLY_WS_ICON_10="10;%{F$foreground_alt} %{F-} trs"
export POLY_WS_ICON_11="11;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_12="12;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_13="13;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_14="14;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_15="15;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_16="16;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_17="17;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_18="18;%{F$foreground_alt} %{F-} rnd"
export POLY_WS_ICON_19="19;%{F$foreground_alt} %{F-} rnd"

monitors=`xrandr | grep connected | grep -v disconnected | cut -d ' ' -f 1`

for monitor in $monitors; do
    if [ "$monitor" = "eDP-1" ]; then
        MONITOR=$monitor polybar laptop &
    else
        MONITOR=$monitor polybar secondary &
    fi
    #MONITOR=DP-2-3 polybar secondary &
done
