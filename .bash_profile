# color highlighting for ls
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

# cd into a dir by typing its name
shopt -s autocd

# runs ls after cd
cd() { builtin cd "$@" && ls; }

export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:~/Library/Python/3.7/bin

# displays git branch as bash prompt
export PS1="\[\033[0;36m\]\u@\h\[\033[1;35m\] \w\n\[\033[1;33m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split('\n').grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

# change terminal profile if in a vagrant ssh
function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
                                                      # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [ $# -gt 0 ] && [ "$1" == "ssh" ] ; then
        shift
        tabc SSH
        command vagrant ssh
        tabc
    fi
}

alias vagrant="colorssh"

# nvm crap
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
