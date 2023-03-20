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
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'kyazdani42/nvim-web-devicons'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'Darazaki/indent-o-matic'
    use 'rktjmp/lush.nvim'
    -- use {
    --     'simrat39/rust-tools.nvim',
    --     config = function() require'plugins.rust_tools' end
    -- }
	use {
		'srcery-colors/srcery-vim',
		config = function()
			vim.g.srcery_italic = 1
            vim.g.srcery_italic_types = 1
            vim.cmd[[colorscheme srcery]]
		end
	}
	use {
        'windwp/windline.nvim',
        config = function() require'wlsample.airline' end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require'plugins.gitsigns' end
	}
    use {
        'hrsh7th/nvim-cmp',
        requires = { 'onsails/lspkind-nvim', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua', 'dcampos/nvim-snippy', 'dcampos/cmp-snippy' },
        config = function() require'plugins.cmp' end
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require'plugins.null_ls' end
    }
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require'plugins.lsp_signature' end
    }
	use {
        'nvim-telescope/telescope.nvim',
        run = 'make',
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim' },
		config = function() require 'plugins.telescope' end
	}
	use {
    	'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require'plugins.treesitter' end
	}
    use {
        'windwp/nvim-autopairs',
        after = 'nvim-treesitter',
        config = function() require'plugins.autopairs' end
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require'plugins.comment' end
    }
    use {
        'jghauser/mkdir.nvim',
        config = function() require'mkdir' end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require'plugins.indent_blankline' end
    }
	use {
		'airblade/vim-rooter',
		config = function()
			vim.g.rooter_targets = '/,*'
			vim.g.rooter_patterns = { 'Cargo.toml', 'go.mod', '.git', 'Makefile', '>workspace', '>.config' }
            vim.g.rooter_buftypes = { '' }
		end
	}
    -- bootstrap a new install
    if PACKER_BOOTSTRAP then
        require'packer'.sync()
    end
end)
