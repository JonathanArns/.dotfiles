return require('lazy').setup({
    'folke/lazy.nvim',
    'mbbill/undotree',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'Darazaki/indent-o-matic',
    'jghauser/mkdir.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'simrat39/rust-tools.nvim', lazy = true },
    { 'kyazdani42/nvim-web-devicons', lazy = true },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
    {
        'srcery-colors/srcery-vim',
        config = function()
            vim.g.srcery_italic = 1
            vim.g.srcery_italic_types = 1
            vim.cmd[[colorscheme srcery]]
        end
    },
    {
        'windwp/windline.nvim',
        config = function() require'wlsample.airline' end
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require'plugins.gitsigns' end
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua', 'dcampos/nvim-snippy', 'dcampos/cmp-snippy' },
        config = function() require'plugins.cmp' end,
    },
    {
        'ray-x/lsp_signature.nvim',
        config = function() require'plugins.lsp_signature' end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function() require'plugins.treesitter' end
    },
    {
        'windwp/nvim-autopairs',
        after = 'nvim-treesitter',
        config = function() require'plugins.autopairs' end
    },
    {
        'numToStr/Comment.nvim',
        config = function() require'plugins.comment' end
    },
    {
        'airblade/vim-rooter',
        config = function()
            vim.g.rooter_targets = '/,*'
            vim.g.rooter_patterns = { 'Cargo.toml', 'go.mod', '.git', '>workspace', 'Makefile', '>.config' }
            vim.g.rooter_buftypes = { '' }
        end
    },
})
