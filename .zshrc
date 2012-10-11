# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler rails3 nyan)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/Users/Alex/.rvm/gems/ruby-1.9.2-p290/bin:/Users/Alex/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/Alex/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/Alex/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

#ALIASES
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias install='brew install'
alias rh='echo Rehashed! && rbenv rehash'
alias deploy='git push heroku master'
alias tmux='TERM=screen-256color-bce tmux'
alias bundle='bundle && rh'

#FUNCTIONS
mkcd() { mkdir -p "$@" && cd "$@"; }

# TMUX
# $HOME/.zshrc
# Launch tmux by default
if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t default || tmux new-session -s default
  exit
fi

# TMUXINATOR
export EDITOR="/usr/local/bin/vim"

# RBENV
export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
