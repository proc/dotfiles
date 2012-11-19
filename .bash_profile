#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"

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

#ssh tunnel
alias tunnel='ssh vagrant@10.10.10.10 -L 3306:127.0.0.1:3306 -N'

export EDITOR=vim
export PS1="\[\033[0;36m\]\u@\h\[\033[1;35m\] \w\n\[\033[1;33m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split('\n').grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "
eval "$(rbenv init -)"

if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
fi

alias spec='spec --color'
