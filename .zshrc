# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git vi-mode zsh-syntax-highlighting)

# vi-mode
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=3

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.local/bin:$PATH"
