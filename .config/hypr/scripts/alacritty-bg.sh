#!/bin/bash

entries="Cava Cmatrix Pipes Close"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')

case $selected in
  cava)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/cava.sh;;
  cmatrix)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/cmatrix.sh;;
  pipes)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/pipes.sh;;
  close)
	pid=$(python3 ~/.config/hypr/scripts/alacritty-kill.py)
	kill $pid
esac
