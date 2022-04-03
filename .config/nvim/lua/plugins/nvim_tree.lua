local present, nvimtree = pcall(require, 'nvim-tree')
if not present then
    return
end
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

nvimtree.setup {
	update_cwd = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = '15%',
		side = 'left',
		mappings = {
			custom_only = false
		}
	}
}
