#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

(wal -t &)
cat ~/.cache/wal/sequences

#export PAGER=/usr/bin/vimcat
