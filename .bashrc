alias ll='ls -al --color=auto --group-directories-first'

#includes hidden files when using mv
shopt -s dotglob

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#find history commands like in vim
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

alias diskspace="du -S | sort -n -r |more"

alias grep='grep --color=auto --exclude-dir=.git'
alias please='sudo'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
#alias quickfind='find -iname "*$1*"'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias tm='ps -ef | grep'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias y='echo "why not?"';
alias gitrmdeleted='git rm $(git ls-files --deleted)'
alias diffdir='diff  -x "*.git*" -r -u'
alias rgrep='grep -Rin'

PATH=$PATH:$HOME/profile/scripts

