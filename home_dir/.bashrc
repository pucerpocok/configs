#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sudo='sudo -E'
alias cd..="cd .." #work around a common typo
PS1='[\u@\h \W]\$ '

#(wal &)
cat ~/.cache/wal/sequences

PROMPT_COMMAND='. ~/.env'
HISTSIZE=
HISTFILESIZE=

#export PAGER=/usr/bin/vimcat

#if [[ -f /etc/bash_completion ]]; then
#    /etc/bash_completion
#fi
