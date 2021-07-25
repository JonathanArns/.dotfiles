local opt = vim.opt
local fn = vim.fn
local g = vim.g

-- this compiles on saving this file
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- this installs packer, if it is not present
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


-- this declares all of our plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer manages itself
	use 'svermeulen/vimpeccable' -- used for key mappings
	use {
		'sonph/onehalf',
		rtp = 'vim',
		config = function()
			vim.cmd('colorscheme onehalfdark')
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
	use {
		'neovim/nvim-lspconfig',
		config = function()
			vim.cmd([[autocmd BufwritePre *.go vim.lsp.buf.formatting_sync(nil, 100)]])
		end
	}
	use { 'kabouzeid/nvim-lspinstall' }
	use { 'hrsh7th/nvim-compe' }
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
