vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- this declares all of our plugins
return require('packer').startup(function(use)
	use '~/workspace/neovimplugin'
	use 'wbthomason/packer.nvim' -- packer manages itself
	use 'svermeulen/vimpeccable' -- used for key mappings
	use 'mbbill/undotree'
	use 'tpope/vim-eunuch'
	use {
		'srcery-colors/srcery-vim',
		config = function()
			vim.g.srcery_italic = 1
			vim.cmd('colorscheme srcery')
		end
	}
	use {
		'datwaft/bubbly.nvim',
		requires = { 'nvim-lua/lsp-status.nvim' },
		config = function()
			-- Here you can add the configuration for the plugin
			vim.g.bubbly_palette = {
				background = "#34343c",
				foreground = "#c5cdd9",
				black = "#3e4249",
				red = "#ec7279",
				green = "#a0c980",
				yellow = "#deb974",
				blue = "#6cb6eb",
				purple = "#d38aea",
				cyan = "#5dbbc1",
				white = "#c5cdd9",
				lightgrey = "#57595e",
				darkgrey = "#404247",
			}
			vim.g.bubbly_statusline = {
				'mode',
				'path',
				'truncate',
				'branch',
				'builtinlsp.diagnostic_count',
				'lsp_status.messages',
				'divisor',
				'filetype',
				'progress',
			}
		end
	}
	use {
		'aserowy/tmux.nvim',
		config = function()
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
		end
	}
	use {
		'karb94/neoscroll.nvim',
		config = function()
			require'neoscroll'.setup{}
		end
	}
	-- use {
	-- 	'NTBBloodbath/rest.nvim',
	-- 	requires = { 'nvim-lua/plenary.nvim' }
	-- }
	-- use { 'nicwest/vim-http' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup{
				ensure_installed = "all",
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {enable = true},
				context_commentstring = {enable = true},
			}
		end
	}
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use {
		'RRethy/nvim-treesitter-textsubjects',
		config = function()
			require'nvim-treesitter.configs'.setup {
				textsubjects = {
					enable = true,
					keymaps = {
						['.'] = 'textsubjects-smart',
						[';'] = 'textsubjects-container-outer',
					}
				},
			}
		end
	}
	use { 'neovim/nvim-lspconfig' }
	use { 'kabouzeid/nvim-lspinstall' }
	use { 'hrsh7th/nvim-compe' }
	use {
		'ray-x/lsp_signature.nvim',
		config = function()
			require'lsp_signature'.setup{
				hint_enable = false,
			}
		end
	}
	use {
		'kosayoda/nvim-lightbulb',
		config = function()
			vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
		end
	}
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
	use {
		'mattn/emmet-vim',
		config = function()
			vim.g.user_emmet_mode = 'inv'
			vim.g.user_emmet_leader_key = '<C-,>'
		end
	}
end)
