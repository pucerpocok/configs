#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sudo='sudo -E'
alias cal='cal -m' #always start week with monday
alias cd..="cd .." #work around a common typo
alias ssh='TERM=xterm ssh'
alias less='less -i'
alias ag='ag --color'
#alias svn_betterblame='svn log --diff'
function svn_betterblame()
{
    svn log --diff "${1}" | colordiff;
}

#PS1='\[\e[31m\]┌─[\[\e[37m\]\u@\t\[\e[31m\]] \n└─[\[\e[37m\]\W\[\e[31m\]]>\e[37m '
PS1='[\u@\h \W]\$ '
#GREEN="$(tput setaf 2)"
#RESET="$(tput sgr0)"
#PS1='${GREEN}[${RESET}\u${GREEN}@${RESET}\h \W${GREEN}]\$ ${RESET}'

function viall()
{
    ls | xargs -I{} bash -c "echo ============== {} ============== >> zsolt_temp_file; cat {} >> zsolt_temp_file; echo +++++++++++++++++++++++++++++ >> zsolt_temp_file" && vim zsolt_temp_file && rm zsolt_temp_file
}

function set_fan()
{
    sudo echo "level $1" > /proc/acpi/ibm/fan
}

function swap()
{
    tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
    mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

function toupper()
{
    mv $1 `echo $1 | awk '{ print toupper($0) }'`
}

function monitor_workspace()
{
    # cvt 1920 1200 60.00
    # xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
    # xrandr --verbose --addmode DP-2-2 "1920x1200_60.00"
    xrandr --verbose --output DP-2-2 --mode "1920x1200" --pos 0x0 --output DP-2-3 --mode 1920x1200 --pos 1920x0 --output eDP-1 --mode 1920x1080 --pos 3840x0 --output HDMI-2 --off
    # while ! $(xrandr --verbose --output DP-2-2 --mode "1920x1200_60.00" --pos 0x0 --output DP-2-3 --mode 1920x1200 --pos 1920x0 --output eDP-1 --mode 1920x1080 --pos 3840x0 --output HDMI-2 --off); do
    #     xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
    #     xrandr --verbose --addmode DP-2-2 "1920x1200_60.00"
    # done
    #xrandr --verbose --output DP-2-2 --mode 1920x1200 --pos 0x0 --output DP-2-3 --mode 1920x1200 --pos 1920x0 --output eDP-1 --mode 1920x1080 --pos 3840x0 --output HDMI-2 --off
    #sleep 3 && i3-msg restart
    i3-msg restart
}

function monitor_laptop_only()
{
    xrandr --verbose --output DP-1 --off --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --off
    #sleep 3 && i3-msg restart
    i3-msg restart
}

function monitor_projector()
{
    xrandr --verbose --output DP-1 --off --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --mode 1920x1080 --pos 1920x0
    #sleep 3 && i3-msg restart
    i3-msg restart
}

function monitor_home_office()
{
    xrandr --verbose --output DP-1 --mode 1920x1080 --pos 1920x0 --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --off
    #sleep 3 && i3-msg restart
    i3-msg restart
}

#(wal &)
cat ~/.cache/wal/sequences

PROMPT_COMMAND='. ~/.env'
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoredups

export EDITOR="vim"
export GOPATH=~/.go
export LESS=-R
#PATH=$GOPATH/bin/:$PATH

#export PAGER=/usr/bin/vimcat

#if [[ -f /etc/bash_completion ]]; then
#    /etc/bash_completion
#fi

# with this setting terminal won't freeze with <C-s>,
# instead it can be used for forward search in history
stty -ixon

complete -C /usr/bin/vault vault

PATH="/home/zschmidt/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/zschmidt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zschmidt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zschmidt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zschmidt/perl5"; export PERL_MM_OPT;

LESSOPEN="|lesspipe.sh %s";

set -o vi
bind '"\C-q":"\e"'
#bind '"\C-\e[1;5D":"\ew"'
