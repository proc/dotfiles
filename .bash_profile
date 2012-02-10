alias ls='ls -GFh'

#export RUBY_HEAP_MIN_SLOTS=1000000
#export RUBY_HEAP_SLOTS_INCREMENT=1000000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_HEAP_FREE_MIN=500000

export PATH="/usr/local/bin:/usr/local/mysql/bin:$HOME/.rbenv/bin:$PATH"

alias rb='rbenv exec bundle exec'

eval "$(rbenv init -)"

alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

export PS1="\[\033[38m\]\u@\h\[\033[01;34m\] \w\n\[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "
