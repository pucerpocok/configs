#! /bin/bash

exists=$(acpi -v 2>&1 1&>/dev/null)
if [ "$?" -eq "127" ]; then
    exit 0
fi

source "${HOME}/.cache/wal/colors.sh"
foreground_alt=$color2
#TODO: what is this xrdb? copied from polybar/config
avg_color=${xrdb:color2:#555}

count=$(acpi -b | wc -l);
sum=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | xargs -I% echo -n '+%')
avg=$(( sum / count ))

icon=
if [ "$avg" -lt "20" ]; then
    icon=
elif [ "$avg" -lt "40" ]; then
    icon=
elif [ "$avg" -lt "60" ]; then
    icon=
elif [ "$avg" -lt "80" ]; then
    icon=
else
    icon=
fi

echo %{F$foreground_alt}$icon %{F$avg_color}$avg%
