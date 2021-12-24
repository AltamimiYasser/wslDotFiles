
# Path to your oh-my-zsh installation.
export ZSH="/home/yasser/.oh-my-zsh"

# path+=('~/.swift/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-12-07-a-ubuntu20.04/usr/bin')
# If you come from bash you might have to change your $PATH.
export PATH=~/.swift/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-12-07-a-ubuntu20.04/usr/bin:$PATH
export DENO_INSTALL="/home/yasser/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
)

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

neofetch
