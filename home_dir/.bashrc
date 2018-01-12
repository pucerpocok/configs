#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sudo='sudo -E'
PS1='[\u@\h \W]\$ '

#(wal &)
cat ~/.cache/wal/sequences

PROMPT_COMMAND='. ~/.env'

#export PAGER=/usr/bin/vimcat
