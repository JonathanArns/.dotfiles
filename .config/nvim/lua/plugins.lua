return require('lazy').setup({
    'folke/lazy.nvim',
    'mbbill/undotree',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'Darazaki/indent-o-matic',
    'jghauser/mkdir.nvim',
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {"rust_analyzer", "lua_ls"}
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            { "mason-org/mason.nvim", opts = {} },
        }
    },
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
        config = function()
            require'gitsigns'.setup {
                current_line_blame = true
            }
        end
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        -- use a release tag to download pre-built binaries
        version = '1.*',
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<S-CR>'] = { 'cancel', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = { enabled = true }
        },
        opts_extend = { "sources.default" }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function() require'plugins.treesitter' end
    },
    {
        'windwp/nvim-autopairs',
        after = 'nvim-treesitter',
        config = function() require'plugins.autopairs' end
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
