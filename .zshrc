# Path to your oh-my-zsh installation.
export ZSH=/Users/liamjbennett/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

plugins=(git)

export PATH="/Users/liamjbennett/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/liamjbennett/.rbenv/shims"

source $HOME/.bashrc
source $ZSH/oh-my-zsh.sh

alias rake="noglob rake"

# added by travis gem
[ -f /Users/liamjbennett/.travis/travis.sh ] && source /Users/liamjbennett/.travis/travis.sh

export PATH="/usr/local/sbin:$PATH"
