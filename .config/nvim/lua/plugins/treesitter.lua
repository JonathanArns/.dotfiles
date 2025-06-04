local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

nvim_treesitter.setup {
    ensure_installed = {'go','html','vue','python','rust','lua','css','javascript','bash','erlang','markdown'},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- disable on very large files
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
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
