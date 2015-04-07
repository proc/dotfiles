export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias l='ls -GFh'
shopt -s autocd
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Downloads/adt/sdk/platform-tools:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/src/go
export GOBIN=$HOME/src/go/bin
export PATH=$PATH:$GOBIN
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/proc/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
alias ctags="`brew --prefix`/bin/ctags"

alias rb='rbenv exec bundle exec'

eval "$(rbenv init -)"

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

alias m='mvim'

export EDITOR=vim
export PS1="\[\033[0;36m\]\u@\h\[\033[1;35m\] \w\n\[\033[1;33m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split('\n').grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

alias spec='spec --color'
cd() { builtin cd "$@" && ls; }

export AUTOLS_OPTIONS="-c 'ls -F'"
function launch_autols {
  if [ ! x$AUTOLS_LAST_DIR = x$PWD ]
  then
    AUTOLS_LAST_DIR=$PWD
    eval autols $AUTOLS_OPTIONS
  fi
}

AUTOLS_LAST_DIR=$PWD
PROMPT_COMMAND="launch_autols;$PROMPT_COMMAND"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /Users/proc/src/autols/shell/bashrc
alias emacs='open -a /Applications/Emacs.app $1'
alias python=/usr/local/Cellar/python/2.7.9/bin/python

export NVM_DIR="/Users/proc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.nvm/nvm.sh
