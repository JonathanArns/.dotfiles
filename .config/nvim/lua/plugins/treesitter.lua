local file_types = {'go','html','python','rust','lua','css','javascript','bash','erlang','markdown'}
require('nvim-treesitter').install(file_types)

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.api.nvim_create_autocmd('FileType', { 
    pattern = file_types,
    callback = function() 
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
    end, 
})
