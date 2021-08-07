local npairs = require'nvim-autopairs'

npairs.setup{
	check_ts = true,
}

require'nvim-treesitter.configs'.setup{
	autopairs = { enable = true }
}
