#!/bin/bash

entries="Cava Pipes Unimatrix Close"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')

case $selected in
  cava)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/cava.sh;;
  pipes)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/pipes.sh;;
  unimatrix)
	alacritty --config-file ~/.config/alacritty/alacritty-bg.toml --class="alacritty-bg" -e ~/.config/hypr/unimatrix.sh;;
  close)
	pid=$(python3 ~/.config/hypr/scripts/alacritty-kill.py)
	kill $pid
esac
