export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias l='ls -GFh'
shopt -s autocd

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

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

export EDITOR=vim
export PS1="\[\033[0;36m\]\u@\h\[\033[1;35m\] \w\n\[\033[1;33m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split('\n').grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias spec='spec --color'

