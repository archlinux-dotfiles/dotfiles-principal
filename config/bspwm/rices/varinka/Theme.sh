#!/usr/bin/env bash
#  ██╗   ██╗ █████╗ ██████╗ ██╗███╗   ██╗██╗  ██╗ █████╗ 
#  ██║   ██║██╔══██╗██╔══██╗██║████╗  ██║██║ ██╔╝██╔══██╗
#  ██║   ██║███████║██████╔╝██║██╔██╗ ██║█████╔╝ ███████║
#  ╚██╗ ██╔╝██╔══██║██╔══██╗██║██║╚██╗██║██╔═██╗ ██╔══██║
#   ╚████╔╝ ██║  ██║██║  ██║██║██║ ╚████║██║  ██╗██║  ██║
#    ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Varinka
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 43
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#ced4da"
	bspc config active_border_color "#ced4da"
	bspc config focused_border_color "#f8f9fa"
	bspc config presel_feedback_color "#495057"
}

# Set alacritty colorscheme
set_alacritty_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# (Monochrome) Color scheme for Varinka Rice

# Default colors
[colors.primary]
background = "#212529"
foreground = "#f8f9fa"

# Cursor colors
[colors.cursor]
cursor = "#f8f9fa"
text = "#212529"

# Normal colors
[colors.normal]
black = "#343a40"
blue = "#495057"
cyan = "#6c757d"
green = "#adb5bd"
magenta = "#ced4da"
red = "#dee2e6"
white = "#f8f9fa"
yellow = "#e9ecef"

# Bright colors
[colors.bright]
black = "#343a40"
blue = "#495057"
cyan = "#6c757d"
green = "#adb5bd"
magenta = "#ced4da"
red = "#dee2e6"
white = "#f8f9fa"
yellow = "#e9ecef"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## Monochrome Color scheme for Varinka Rice


# The basic colors
foreground              #f8f9fa
background              #212529
selection_foreground    #495057
selection_background    #f8f9fa

# Cursor colors
cursor                  #f8f9fa
cursor_text_color       #212529

# URL underline color when hovering with mouse
url_color               #495057

# Kitty window border colors
active_border_color     #ced4da
inactive_border_color   #343a40
bell_border_color       #e9ecef

# Tab bar colors
active_tab_foreground   #212529
active_tab_background   #ced4da
inactive_tab_foreground #f8f9fa
inactive_tab_background #343a40
tab_bar_background      #212529

# The 16 terminal colors

# black
color0 #343a40
color8 #343a40

# red
color1 #dee2e6
color9 #dee2e6

# green
color2  #adb5bd
color10 #adb5bd

# yellow
color3  #e9ecef
color11 #e9ecef

# blue
color4  #495057
color12 #495057

# magenta
color5  #ced4da
color13 #ced4da

# cyan
color6  #6c757d
color14 #6c757d

# white
color7  #f8f9fa
color15 #f8f9fa
EOF

killall -USR1 kitty
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#212529\"/g" \
		-e "s/separator_color = .*/separator_color = \"#f8f9fa\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#e9ecef'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "#212529"
		foreground = "#f8f9fa"

		[urgency_normal]
		timeout = 6
		background = "#212529"
		foreground = "#f8f9fa"

		[urgency_critical]
		timeout = 0
		background = "#212529"
		foreground = "#f8f9fa"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors for Varinka rice
\$bg: #212529;
\$bg-alt: #343a40;
\$fg: #dee2e6;
\$black: #495057;
\$lightblack: #262831;
\$red: #dee2e6;
\$blue: #495057;
\$cyan: #6c757d;
\$magenta: #ced4da;
\$green: #adb5bd;
\$yellow: #e9ecef;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Varinka
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #212529/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #f8f9fa/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #ced4da/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #212529/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #343a40/'
}

# Set rofi colors
set_launcher_config() {
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Varinka

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #212529;
    background-alt: #212529E0;
    foreground: #f8f9fa;
    selected: #ced4da;
    active: #adb5bd;
    urgent: #dee2e6;
    
    img-background: url("~/.config/bspwm/rices/varinka/rofi.webp", width);
}
EOF
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q varinka-bar -c "${rice_dir}"/config.ini &
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_alacritty_config
set_kitty_config
set_picom_config
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
launch_bars
