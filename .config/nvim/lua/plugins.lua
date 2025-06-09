return require('lazy').setup({
    'folke/lazy.nvim',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'jghauser/mkdir.nvim',
    {
        "mason-org/mason-lspconfig.nvim",
        config = function () require'plugins.lsp' end,
        dependencies = {
            "neovim/nvim-lspconfig",
            { "mason-org/mason.nvim", opts = {} },
        }
    },
    { 'nvim-mini/mini.completion', version='*', opts = {} },
    { 'j-hui/fidget.nvim', opts = {} },
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
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function() require'plugins.treesitter' end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        main = 'ibl',
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        after = 'nvim-treesitter',
        opts = { check_ts = true }
    },
    {
        'airblade/vim-rooter',
        config = function()
            vim.g.rooter_targets = { '/', '*' }
            vim.g.rooter_patterns = { '.git', '>workspace', '>.config' }
            vim.g.rooter_buftypes = { '' }
        end
    },
})
