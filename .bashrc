source /opt/boxen/env.sh

alias vi='vim'

alias ga='git add'
alias gs='git status'
alias gkm='git checkout master'
alias gpm='git pull parent master'
alias gl='git lg'
alias gra='git remote add'
alias gcb='git checkout -b'

alias vu='vagrant up'
alias vs='vagrant ssh'
alias vd='vagrant destroy --force'

alias ppv='puppet parser validate'
alias pmg='~/Dev/pmg.sh'

alias tb='time ./build.sh'
alias bers='bundle exec rake spec'
alias bert='bundle exec rake test'

setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }
