#export PS1="\\u@\W\\$ "
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export GOPATH=$HOME/Dev/go
export RBENV_ROOT=/usr/local/var/rbenv

alias vi='vim'

alias git='hub'
alias ga='git add'
alias gs='git status'
alias gkm='git checkout master'
alias gpm='git pull parent master'
alias gl='git lg'
alias gra='git remote add'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gbl='git branch --list'
alias gbc='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias vu='vagrant up --provider=virtualbox'
alias vs='vagrant ssh'
alias vd='vagrant destroy --force'
alias vh='vagrant halt'
alias vgs='vagrant global-status'

alias ppv='puppet parser validate'

alias be='bundle exec'
alias bers='bundle exec rake spec'
alias bert='bundle exec rake test'

alias lpi='bundle exec librarian-puppet install'
alias lpiv='bundle exec librarian-puppet install --verbose'

alias tmux="TERM=screen-256color-bce tmux"

cg() {
    cd $GOPATH/src/github.com/$1;
}

tunnel() {
  ssh -D 1337 -f -C -q -N lbennett@86.14.255.54 -p 22
}

setTerminalText () {
  # echo works in bash & zsh
	local mode=$1 ; shift
	echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# added by travis gem
[ -f /Users/liamjbennett/.travis/travis.sh ] && source /Users/liamjbennett/.travis/travis.sh
