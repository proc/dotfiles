
eval "$(rbenv init -)"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias ls='ls -G'

# git aliases
alias ga='git add'
alias gp='git pull --rebase'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcl='git clone'
alias gs='git status'



export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:~/Library/Python/3.7/bin

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

autoload -U colors && colors

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%B%b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
RPROMPT='%B%{$fg[blue]%}$vcs_info_msg_0_%{$reset_color%}%b'
NEWLINE=$'\n'
PROMPT='%B%{$fg[magenta]%}${PWD/#$HOME/~}${NEWLINE}$fg[green]>%{$reset_color%}%b '
