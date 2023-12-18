#!/bin/bash

entries="Cava Cmatrix Pipes"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')

case $selected in
  cava)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/pipes.sh;;
  cmatrix)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/cmatrix.sh;;
  pipes)
	alacritty --class="alacritty-bg" -e ~/.config/hypr/pipes.sh;;
esac
