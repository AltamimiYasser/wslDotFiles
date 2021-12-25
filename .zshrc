
# Path to your oh-my-zsh installation.
export ZSH="/home/yasser/.oh-my-zsh"

export PATH=~/.swift/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-12-07-a-ubuntu20.04/usr/bin:$PATH
export DENO_INSTALL="/home/yasser/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	colorize
	zsh-autosuggestions
	you-should-use
    vi-mode
)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
bindkey -v

source $ZSH/oh-my-zsh.sh

alias install="sudo apt install"
alias zshrc="nvim ~/.zshrc"
alias python="python3"
alias s.="source ~/.zshrc"
alias ls="exa -a"
alias cat="batcat"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias v="nvim"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias config='/usr/bin/git --git-dir=/home/yasser/.cfg/ --work-tree=/home/yasser'
alias listconfig='config ls-tree --full-tree -r --name-only HEAD'

neofetch

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' file-sort access
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/yasser/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

