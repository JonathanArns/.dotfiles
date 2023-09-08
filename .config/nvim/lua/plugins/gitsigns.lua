require('gitsigns').setup {
	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	current_line_blame = false,
	attach_to_untracked = true,
	sign_priority = 1,
	update_debounce = 100,
	max_file_length = 40000,
}