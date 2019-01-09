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
#PS1='\[\e[31m\]┌─[\[\e[37m\]\u@\t\[\e[31m\]] \n└─[\[\e[37m\]\W\[\e[31m\]]>\e[37m '
PS1='[\u@\h \W]\$ '
#GREEN="$(tput setaf 2)"
#RESET="$(tput sgr0)"
#PS1='${GREEN}[${RESET}\u${GREEN}@${RESET}\h \W${GREEN}]\$ ${RESET}'

function swap()
{
  tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
  mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
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
