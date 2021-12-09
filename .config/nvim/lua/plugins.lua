-- disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- auto update plugins on saving this file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- this declares all of our plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer manages itself
	use 'svermeulen/vimpeccable' -- used for key mappings
	use 'mbbill/undotree'
	use 'ggandor/lightspeed.nvim'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require'gitsigns'.setup()
		end
	}
	use {
	    'echasnovski/mini.nvim', -- a ton of cool shit, all in one
        config = function()
            require'mini.pairs'.setup{}
            require'mini.completion'.setup{}
        end
    }
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
				-- 'snippy',
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
    	'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
		    'JoosepAlviste/nvim-ts-context-commentstring',
		    'RRethy/nvim-treesitter-textsubjects',
		},
		config = function()
			require'nvim-treesitter.configs'.setup{
				ensure_installed = {"go","html","vue","python","rust","lua","css","javascript","fish"},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {enable = true},
				context_commentstring = {enable = true},
				autopairs = { enable = true },
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
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- use {
	-- 	'dcampos/nvim-snippy',
	-- 	config = function() require'snippy'.setup{ hl_group = 'search' } end,
	-- 	requires = { 'honza/vim-snippets' }
	-- }
	use 'Darazaki/indent-o-matic'
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
		config = function()
		    
		end
	}
end)
