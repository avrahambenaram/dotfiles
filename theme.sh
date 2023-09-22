#!/bin/zsh
# Sway themes
THEME=$1

rm ~/.config/waybar/style.css
cp ~/.config/waybar/base.css ~/.config/waybar/style.css

rm ~/.config/wofi/style.css
rm ~/.config/wofi/style.widgets.css
cp ~/.config/wofi/style-base.css ~/.config/wofi/style.css
cp ~/.config/wofi/style.widgets-base.css ~/.config/wofi/style.widgets.css

if [ "$THEME" = "miasma" ]; then
	ln -sf ~/.config/hypr/themes/miasma.conf ~/.config/hypr/theme.conf

	# Waybar style
	echo "@define-color highlight #c9a554 ;\n@define-color base1  #222222 ;\n@define-color border1 #222222;" >> ~/.config/waybar/style.css

	# Alacritty
	echo "import = [\"~/.config/alacritty/window.toml\", \"~/.config/alacritty/themes/miasma.toml\"]" > ~/.config/alacritty/alacritty.toml

	# Wofi
	echo "@define-color highlight #c9a554;\n@define-color base1  #444;\n@define-color base2 #222222;\n@define-color base3  #555;" >> ~/.config/wofi/style.css
	echo "@define-color highlight #c9a554;\n@define-color base1  #444;\n@define-color base2 #222222;\n@define-color base3  #555;" >> ~/.config/wofi/style.widgets.css

	# NVIM
	echo "export NVIM_THEME=\"miasma\"" > ~/.zshenv

	# Cava
	ln -sf ~/.config/cava/themes/miasma ~/.config/cava/config

	# Swaylock
	ln -sf ~/.config/hypr/scripts/lock/miasma.sh ~/.config/hypr/scripts/lock.sh
fi
if [ "$THEME" = "rose-pine" ]; then
	ln -sf ~/.config/hypr/themes/rose-pine.conf ~/.config/hypr/theme.conf

	# Waybar style
	echo "@define-color highlight #9ccfd8 ;\n@define-color base1  #232136 ;\n@define-color border1 #393552;" >> ~/.config/waybar/style.css

	# Alacritty
	echo "import = [\"~/.config/alacritty/window.toml\", \"~/.config/alacritty/themes/rose-pine.toml\"]" > ~/.config/alacritty/alacritty.toml

	# Wofi
	echo "@define-color highlight #c4a7e7;\n@define-color base1  #444;\n@define-color base2 #232136;\n@define-color base3  #555;" >> ~/.config/wofi/style.css
	echo "@define-color highlight #c4a7e7;\n@define-color base1  #444;\n@define-color base2 #232136;\n@define-color base3  #555;" >> ~/.config/wofi/style.widgets.css

	# NVIM
	echo "export NVIM_THEME=\"rose-pine\"" > ~/.zshenv

	# Cava
	ln -sf ~/.config/cava/themes/rose-pine ~/.config/cava/config

	# Swaylock
	ln -sf ~/.config/hypr/scripts/lock/rose-pine.sh ~/.config/hypr/scripts/lock.sh
fi
if [ "$THEME" = "dracula" ]; then
	ln -sf ~/.config/hypr/themes/dracula.conf ~/.config/hypr/theme.conf

	# Waybar style
	echo "@define-color highlight #bd93f9 ;\n@define-color base1  #282a36 ;\n@define-color border1 #44475a;" >> ~/.config/waybar/style.css

	# Alacritty
	echo "import = [\"~/.config/alacritty/window.toml\", \"~/.config/alacritty/themes/dracula.toml\"]" > ~/.config/alacritty/alacritty.toml

	# Wofi
	echo "@define-color highlight #bd93f9;\n@define-color base1  #444;\n@define-color base2 #282a36;\n@define-color base3  #555;" >> ~/.config/wofi/style.css
	echo "@define-color highlight #bd93f9;\n@define-color base1  #444;\n@define-color base2 #282a36;\n@define-color base3  #555;" >> ~/.config/wofi/style.widgets.css

	# NVIM
	echo "export NVIM_THEME=\"dracula\"" > ~/.zshenv

	# Cava
	ln -sf ~/.config/cava/themes/dracula ~/.config/cava/config

	# Swaylock
	ln -sf ~/.config/hypr/scripts/lock/dracula.sh ~/.config/hypr/scripts/lock.sh
fi
if [ "$THEME" = "nord" ]; then
	ln -sf ~/.config/hypr/themes/nord.conf ~/.config/hypr/theme.conf

	# Waybar style
	echo "@define-color highlight #81a1c1 ;\n@define-color base1  #3b4252 ;\n@define-color border1 #44475a;" >> ~/.config/waybar/style.css

	# Alacritty
	echo "import = [\"~/.config/alacritty/window.toml\", \"~/.config/alacritty/themes/nord.toml\"]" > ~/.config/alacritty/alacritty.toml

	# Wofi
	echo "@define-color highlight #81a1c1;\n@define-color base1  #2e3440;\n@define-color base2 #3b4252;\n@define-color base3  #2f3441;" >> ~/.config/wofi/style.css
	echo "@define-color highlight #81a1c1;\n@define-color base1  #2e3440;\n@define-color base2 #3b4252;\n@define-color base3  #2f3441;" >> ~/.config/wofi/style.widgets.css

	# NVIM
	echo "export NVIM_THEME=\"nord\"" > ~/.zshenv

	# Cava
	ln -sf ~/.config/cava/themes/nord ~/.config/cava/config

	# Swaylock
	ln -sf ~/.config/hypr/scripts/lock/nord.sh ~/.config/hypr/scripts/lock.sh
fi


pkill hyprpaper
pkill waybar
sleep 5s && wait
