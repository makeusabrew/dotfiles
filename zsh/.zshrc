# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
#ZSH_THEME="itchy"
#ZSH_THEME="norm"
ZSH_THEME="pygmalion"
#ZSH_THEME="dieter"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rezsh="source ~/.zshrc"

alias tma='tmux attach -d -t'
alias git-tmux='tmux new -s $(basename $(pwd))'

alias deckdev='~/code/node/node-decking/bin/decking'

alias trderr='ssh gueatrdlog01 "tail -f /local/lamp/logs/error.log -n 100 | grep trdrep"'

alias kubetst='kubectl --kubeconfig ~/.bpe/clusters/test/kubeconfig --namespace sportsbook'
alias canarykubetst='kubectl --kubeconfig ~/.bpe/clusters/test/kubeconfig --namespace sportsbook-canary'
alias kubetail='kubectl --kubeconfig ~/.bpe/clusters/test/kubeconfig --namespace sportsbook logs --tail=1 -f'
alias greenkube='kubectl --kubeconfig ~/.bpe/clusters/green-1/kubeconfig --namespace sportsbook'
alias canarygreenkube='kubectl --kubeconfig ~/.bpe/clusters/green-1/kubeconfig --namespace sportsbook-canary'

alias auth-test-guea='pscli kubectl auth test-app-guea nexus-sportsbook-admin'
alias auth-prod-guea='pscli kubectl auth app-guea nexus-sportsbook-admin'
alias auth-prod-nps='pscli kubectl auth app-nps nexus-sportsbook-admin'

function testk8s() {
  kubectl --context test-app-guea-gstp-sportsbook-admin -n gstp-sports1 "$@"
}

function txpk8s() {
  kubectl --context test-app-guea-gstp-sportsbook-admin -n gstp-sports-txp "$@"
}

function stagek8s() {
  kubectl --context test-app-guea-gstp-sportsbook-admin -n gstp-sports-staging "$@"
}

function localk8s() {
  kubectl --context docker-for-desktop "$@"
}

function sterntest() {
  stern --context test-app-guea-gstp-sportsbook-admin --namespace gstp-sports1 "$@"
}

function sterntxp() {
  stern --context test-app-guea-gstp-sportsbook-admin --namespace gstp-sports-txp "$@"
}

function sternstage() {
  stern --context test-app-guea-gstp-sportsbook-admin --namespace gstp-sports-staging "$@"
}

rolldeployment() {
  namespace="${1}"
  deployment="${2}"
  containerName="${3:-$2}"
  if [[ -z "${namespace}" ]] || [[ -z "${deployment}" ]]; then
    echo "Missing arguments.  Usage: rolldeployment <namespace> <deployment> [<containerName>]"
  fi
  kubectl -n "${namespace}" patch deploy "${deployment}" --patch '{"spec": {"template": {"spec": {"containers": [{"name": "'"$containerName"'", "env": [{"name": "DEPLOYMENT_ROLL_EPOCH_SECONDS", "value":"'$(date +%s)'"}]}]}}}}'
}


#function testk8s () {
#  context=$(kubectl config current-context)
#
#  if [ $context != "test-app-guea-nexus-sportsbook-admin" ]
#  then
#   echo "Wrong context: $context, attempting to switch..."
#   auth-test-guea
# else
#   kubectl api-resources > /dev/null
#   if [ "$?" -eq 1 ]
#   then
#     echo "Not authed, attempting to sign in"
#     auth-test-guea
#   fi
# fi
#
# kubectl -n sportsbook "$@"
#}

function G () {
  if [ -z "$TMUX" ]
  then
    echo "Please run within a tmux session"
    return
  fi

  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  tmux send-keys "git commit -m \"[refs ${branch_name}] \"" C-Left
}

function ssplit () {

  if [ -z "$TMUX" ]
  then
    echo "Please run within a tmux session"
    return
  fi

  if [ "$#" -lt 2 ]
  then
    echo "Not enough arguments: please supply <node> <offset>"
    return
  fi

  PANES=$(tmux list-panes | wc -l | xargs)

  if [ "$#" -eq 3 ]
  then
    tmux select-pane -t 0
    ssh $1${2}0$3
  fi

  if [ "$#" -eq 4 ]
  then
    if [ $PANES -eq 1 ]
    then
      tmux split-window -v
    fi
    tmux select-pane -t 0
    tmux send-keys " ssh $1${2}0$3" Enter
    tmux select-pane -t 1
    tmux send-keys " ssh $1${2}0$4" Enter
    tmux select-pane -t 0
  fi

  if [ "$#" -eq 5 ]
  then
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -t 0
    tmux send-keys " ssh $1${2}0$3" Enter
    tmux select-pane -t 1
    tmux send-keys " ssh $1${2}0$4" Enter
    tmux select-pane -t 2
    tmux send-keys " ssh $1${2}0$5" Enter
    tmux select-pane -t 0
  fi

  if [ "$#" -eq 6 ]
  then
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -t 0
    tmux split-window -v
    tmux select-pane -t 0
    tmux send-keys " ssh $1${2}0$3" Enter
    tmux select-pane -t 1
    tmux send-keys " ssh $1${2}0$4" Enter
    tmux select-pane -t 2
    tmux send-keys " ssh $1${2}0$5" Enter
    tmux select-pane -t 3
    tmux send-keys " ssh $1${2}0$6" Enter
    tmux select-pane -t 0
  fi
}

alias a="ssplit guea"
alias b="ssplit gueb"
alias n="ssplit nps"

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
plugins=(git git-extras zsh-syntax-highlighting coffee vagrant web-search docker grunt git-flow zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias guea="ssh payne@gueagw02.skybet.net"
alias gueb="ssh payne@guebgw02.skybet.net"
alias nps="ssh payne@npsgw02.skybet.net"

# Golang stuff
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/bin

export EDITOR=vim

export JAVA_HOME=/Users/npa30/code/jdk-16.0.2.jdk/Contents/Home

# mac only
#export DOCKER_TLS_VERIFY=1
#export DOCKER_CERT_PATH=/Users/np/.boot2docker/certs/boot2docker-vm
#export DOCKER_HOST=tcp://192.168.59.103:2376

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

cdpath=($HOME/workstation/repos $HOME/code $HOME/code/web $HOME/code/flutter $HOME/code/node $HOME/code/go $HOME .)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
