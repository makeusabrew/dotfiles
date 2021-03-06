# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
#ZSH_THEME="itchy"
#ZSH_THEME="norm"
#ZSH_THEME="pygmalion"
ZSH_THEME="dieter"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rezsh="source ~/.zshrc"

alias tma='tmux attach -d -t'
alias git-tmux='tmux new -s $(basename $(pwd))'

alias deckdev='~/code/node/node-decking/bin/decking'

setopt interactivecomments

# docker helpers
#alias -g remove-containers="rm `docker ps -a -q`"
#alias -g kill-containers="kill `docker ps -q`"
#alias -g stop-containers="stop `docker ps -q`"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_CORRECTION="true"
setopt nocorrectall

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras zsh-syntax-highlighting coffee vagrant web-search docker grunt git-flow)

source $ZSH/oh-my-zsh.sh

# Golang stuff
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/bin

export EDITOR=vim

# mac only
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/np/.boot2docker/certs/boot2docker-vm
export DOCKER_HOST=tcp://192.168.59.103:2376

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

cdpath=($HOME/code $HOME/code/web $HOME/code/node $HOME/code/go $HOME .)
