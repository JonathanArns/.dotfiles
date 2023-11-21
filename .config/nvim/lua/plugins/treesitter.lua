local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

nvim_treesitter.setup {
    ensure_installed = {'go','html','vue','python','rust','lua','css','javascript','bash','erlang','markdown'},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    matchup = {
        enable = true,
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    commentstring = {
        enable = true
    }
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
