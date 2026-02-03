export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ls='ls --color=tty'
alias ll='ls -Al'   # show long listing of all except ".."
alias l='ls -l'   # show long listing but no hidden dotfiles except "."
alias ee='exa -al'   # show long listing of all except ".."
alias e='exa -l'   # show long listing but no hidden dotfiles except "."
alias weather='curl http://wttr.in'
alias mkdir='mkdir -pv'
alias ff='fastfetch'
alias vi='nvim'
alias scrcpym='scrcpy -w --keyboard=uhid --print-fps --max-fps=40 -S'
alias scrcpyo='scrcpy --otg'

# Waydroid aliases
alias waydroidStart='sudo modprobe binder_linux && sudo waydroid container start && waydroid session start'
alias waydroidStop='waydroid session stop && sudo waydroid container stop'
alias waydroidRotation='sudo waydroid shell wm set-user-rotation lock'
alias waydroidWidth='waydroid prop set persist.waydroid.width'
alias waydroidHeight='waydroid prop set persist.waydroid.height'

export BROWSER=librewolf
export EDITOR=nvim

# PFetch config
export PF_INFO="ascii title os kernel de wm editor shell uptime pkgs memory palette"
SHELL="zsh"
fastfetch
