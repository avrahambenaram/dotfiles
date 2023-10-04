#!/bin/bash

entries="Baskerville Dracula Miasma Nord Rose-Pine"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')

case $selected in
  baskerville)
	python3 $HOME/.config/hypr/scripts/theme.py baskerville;;
  dracula)
	python3 $HOME/.config/hypr/scripts/theme.py dracula;;
  miasma)
	python3 $HOME/.config/hypr/scripts/theme.py miasma;;
  nord)
	python3 $HOME/.config/hypr/scripts/theme.py nord;;
  rose-pine)
	python3 $HOME/.config/hypr/scripts/theme.py rose-pine;;
esac
