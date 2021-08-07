-- this compiles on saving this file
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- this declares all of our plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer manages itself
	use 'svermeulen/vimpeccable' -- used for key mappings
	use {
		'srcery-colors/srcery-vim',
		config = function()
			vim.g.srcery_italic = 1
			vim.cmd('colorscheme srcery')
		end
	}
	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require'lualine'.setup{
				options = { theme = 'onedark' }
			}
		end
	}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'neovim/nvim-lspconfig' }
	use { 'kabouzeid/nvim-lspinstall' }
	use { 'hrsh7th/nvim-compe' }
	use {
		'windwp/nvim-autopairs',
		config = function()
			require'nvim-autopairs'.setup{
				check_ts = true
			}
			require'nvim-treesitter.configs'.setup{
				autopairs = { enable = true }
			}
			require("nvim-autopairs.completion.compe").setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` after select function or method item
				auto_select = false,  -- auto select first item
			})
		end
	}
	use {
		'terrortylor/nvim-comment',
		config = function()
			require'nvim_comment'.setup{
				create_mappings = false
			}
		end
	}
	use {
		'airblade/vim-rooter',
		config = function()
			vim.g.rooter_targets = '/,*'
			vim.g.rooter_patterns = { 'go.mod', '.git', 'Makefile', '>workspace', '>.config' }
		end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require'gitsigns'.setup()
		end
	}
end)
