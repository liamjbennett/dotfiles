# Path to your oh-my-zsh installation.
export ZSH=/Users/liamjbennett/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

plugins=(brew bundler docker gas gem git git-extras gradle mercurial mvn npm osx pip pyenv pylint python redis-cli ruby sbt scala svn tmux tmuxinator vagrant  )

export PATH="/Users/liamjbennett/.rbenv/shims:/Users/liamjbennett/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/liamjbennett/.rbenv/shims"

source $HOME/.bashrc
source $ZSH/oh-my-zsh.sh

alias rake="noglob rake"

# added by travis gem
[ -f /Users/liamjbennett/.travis/travis.sh ] && source /Users/liamjbennett/.travis/travis.sh

export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"
