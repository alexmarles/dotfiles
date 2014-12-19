# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
ZSH_THEME="af-magic"

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
plugins=(brew git bundler rails virtualenv)

# RBENV
export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#ALIASES
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tmux='TERM=screen-256color-bce tmux'
alias redis-server='redis-server ~/.redis/redis.conf&'

#Vagrant
alias vup='vagrant up'
alias vssh='vagrant ssh'
alias vinit='vup && vssh'
alias vhalt='vagrant halt'

#Git
alias gs='git gs'
alias gl='git gl'
alias gf='git fetch'
alias gc='git commit'
alias gc!='git commit --amend'

#FUNCTIONS
mkcd() { mkdir -p "$@" && cd "$@"; }

apksign() {
  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/Dropbox/Android/android.keystore "$@" alexmarles;
  zipalign -f -v 4 "$@" "aligned-$@";
  rm "$@";
  mv "aligned-$@" "$@";
}

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

# RUBY ON RAILS
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# ADT
export PATH=${PATH}:~/Android/adt-bundle/sdk/platform-tools:~/Android/adt-bundle/sdk/tools

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s /Users/alex/.nvm/nvm.sh ]] && . /Users/alex/.nvm/nvm.sh # This loads NVM
