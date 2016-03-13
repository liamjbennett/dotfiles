#export PS1="\\u@\W\\$ "
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

export EDITOR='nvim'
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export GOPATH=$HOME/development/go_code
export RBENV_ROOT=/usr/local/var/rbenv
export JENV_ROOT=/usr/local/opt/jenv
export PYTHON_27=$HOME/Library/Python/2.7
export PATH="$PATH:$GOPATH/bin:$PYTHON_27/bin"

powerline-daemon -q
. $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

alias vi='vim'
alias vim='nvim'

alias rake="noglob rake"

alias ga='git add'
alias gs='git status'
alias gkm='git checkout master'
alias gpm='git pull parent master'
alias glp='git log --pretty=oneline --abbrev-commit'
alias gra='git remote add'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gbls='git branch --list'
alias gmc='git status | grep "modified:" | wc -l'
gbp() {
  cb=`git branch | grep '*' | awk '{ print $2 }'`
  git push --set-upstream origin $cb
  open "https://github.com/opentable/puppet-modules/compare/master...liamjbennett:$cb"
}
gbc() {
  array=($(git branch --merged | grep -v "\*"))
  for branch in "${array[@]}"
  do
    if [[ "$branch" == "master" || "$branch" == "production" ]]; then
      echo "ignoring $branch because it is protected"
    else
      git push origin --delete $branch
      git branch -d $branch
    fi
  done
}

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

#alias tmux="TERM=screen-256color-bce tmux"
tm() {
  tmux new-session -s $1
}

alias fix_mic='sudo killall coreaudiod'
alias vpn_start='scutil --nc start "VPN (otra)"'
alias vpn_stop='scutil --nc stop "VPN (otra)"'

cg() {
    cd $GOPATH/src/github.com/$1;
}

wifi() {
  networksetup -setairportpower en1 $1
}

alias tunnel='ssh -D 1337 -f -C -q -N lbennett@86.14.255.54 -p 22'

setTerminalText () {
	if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    local mode=$1 ; shift
	  echo -ne "\033]$mode;$@\007"
  else
    
  fi
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# added by travis gem
[ -f /Users/liamjbennett/.travis/travis.sh ] && source /Users/liamjbennett/.travis/travis.sh
