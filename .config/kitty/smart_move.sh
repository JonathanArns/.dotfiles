#!/bin/bash

# This script does some magic to seamlessly move between
# kitty and (neo)vim windows, using only stock vim commands.
#
# It should be bound in kitty.conf like this:
#
#   action_alias move launch --type background --allow-remote-control ~/.config/kitty/smart_move.sh @active-kitty-window-id
#   map ctrl+h move left
#   map ctrl+j move bottom
#   map ctrl+k move top
#   map ctrl+l move right
#   map ctrl+, move narrower
#   map ctrl+- move shorter
#   map ctrl+= move taller
#   map ctrl+. move wider
#
# The script depends on the three referenced kittens being available
# but should work out of the box with vim and neovim.
# It does this by first passing the movement command to the editor.
# If the cursor does not change inside the editor,
# then a kitty movement is performed instead.

window_id=$1
direction=$2

case $direction in
	left)
		kitty_action="neighboring_window $direction"
		vim_action=":wincmd h\n"
		fingerprint_kitten="get_window_cursor_position.py";;
	bottom)
		kitty_action="neighboring_window $direction"
		vim_action=":wincmd j\n"
		fingerprint_kitten="get_window_cursor_position.py";;
	top)
		kitty_action="neighboring_window $direction"
		vim_action=":wincmd k\n"
		fingerprint_kitten="get_window_cursor_position.py";;
	right)
		kitty_action="neighboring_window $direction"
		vim_action=":wincmd l\n"
		fingerprint_kitten="get_window_cursor_position.py";;
	taller)
		kitty_action="resize_window $direction 2"
		vim_action=":resize +1\n"
		fingerprint_kitten="get_hashed_window_text.py";;
	shorter)
		kitty_action="resize_window $direction 2"
		vim_action=":resize -1\n"
		fingerprint_kitten="get_hashed_window_text.py";;
	wider)
		kitty_action="resize_window $direction 2"
		vim_action=":vertical resize +1\n"
		fingerprint_kitten="get_hashed_window_text.py";;
	narrower)
		kitty_action="resize_window $direction 2"
		vim_action=":vertical resize -1\n"
		fingerprint_kitten="get_hashed_window_text.py";;
esac

function perform_vim_action {
	kitten @ send-text --match id:$window_id "$1:echon ''\n"
}

function get_fingerprint {
	kitten @ kitten $fingerprint_kitten $window_id
}

window_type=$(kitten @ kitten get_window_type.py $window_id)
if [[ $window_type != "vim" ]]; then
	kitten @ action $kitty_action
	exit 0
fi

fingerprint=$(get_fingerprint)
perform_vim_action "$vim_action"
sleep 0.01
new_fingerprint=$(get_fingerprint)
if [[ $fingerprint == $new_fingerprint ]]; then
	kitten @ action $kitty_action
	exit 0
fi
sleep 0.1
new_fingerprint=$(get_fingerprint)
if [[ $fingerprint == $new_fingerprint ]]; then
	kitten @ action $kitty_action
	exit 0
fi
