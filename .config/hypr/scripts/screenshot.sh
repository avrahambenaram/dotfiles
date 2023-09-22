#!/bin/bash
 
entries="Active Screen Output Area Window"
 
selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
 
case $selected in
  active)
    ~/.config/hypr/scripts/grimshot --notify save active;;
  screen)
    ~/.config/hypr/scripts/grimshot --notify save screen;;
  output)
    ~/.config/hypr/scripts/grimshot --notify save output;;
  area)
    ~/.config/hypr/scripts/grimshot --notify save area;;
  window)
    ~/.config/hypr/scripts/grimshot --notify save window;;
esac
