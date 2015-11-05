# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
ZSH_THEME="af-magic"

zstyle ':completion:*' special-dirs true

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

RBENV
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

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

#Other aliases
source $HOME/.shell/aliases

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
export RUBY_GC_HEAP_FREE_SLOTS=200000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="/usr/local/sbin:$PATH"
