# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/avraham/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# My settings

alias ls='ls --color=tty'
alias ll='ls -Al'   # show long listing of all except ".."
alias l='ls -l'   # show long listing but no hidden dotfiles except "."
alias weather='curl http://wttr.in'
alias mkdir='mkdir -pv'
alias nf='neofetch'
alias vim='nvim'
alias lyricstifyS='lyricstify start --highlight-markup "^m"'

# Waydroid aliases
alias waydroidStart='sudo modprobe binder_linux && sudo waydroid container start && waydroid session start'
alias waydroidStop='waydroid session stop && sudo waydroid container stop'
alias waydroidRotation='sudo waydroid shell wm set-user-rotation lock'
alias waydroidWidth='waydroid prop set persist.waydroid.width'
alias waydroidHeight='waydroid prop set persist.waydroid.height'

export BROWSER=vivaldi
export EDITOR=nvim
