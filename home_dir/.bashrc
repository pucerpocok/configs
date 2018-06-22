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
#PS1='\[\e[31m\]┌─[\[\e[37m\]\u@\t\[\e[31m\]] \n└─[\[\e[37m\]\W\[\e[31m\]]>\e[37m '
PS1='[\u@\h \W]\$ '

#(wal &)
cat ~/.cache/wal/sequences

PROMPT_COMMAND='. ~/.env'
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoredups

#export PAGER=/usr/bin/vimcat

#if [[ -f /etc/bash_completion ]]; then
#    /etc/bash_completion
#fi

# with this setting terminal won't freeze with <C-s>,
# instead it can be used for forward search in history
stty -ixon

complete -C /usr/bin/vault vault
