
require'tmux'.setup{
	copy_sync = {
		-- enable = true,
	},
	navigation = {
		cycle_navigation = false,
		enable_default_keybindings = true, -- C-hjkl
	},
	resize = {
		enable_default_keybindings = true, -- A-hjkl
	}
}
