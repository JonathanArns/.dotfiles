local M = {}
local vimp = require('vimp')
vimp.always_override = true

vimp.nnoremap('<leader>e', ':e ~/.config/nvim/init.lua<CR>')

-- clear search
vimp.nnoremap({'silent'}, ',/', ':nohlsearch<CR>')

-- swap : and ;
vimp.nnoremap(';', ':')
vimp.nnoremap(':', ';')

-- keep cursor position on J
vimp.nnoremap('J', 'mzJ`z')

-- make . and , undo points
vimp.inoremap('.', '.<C-g>u')
vimp.inoremap(',', ',<C-g>u')

-- move around lines in visual mode
vimp.vnoremap('J', [[:m '>+1<CR>gv=gv]])
vimp.vnoremap('K', [[:m '<-2<CR>gv=gv]])

-- windows
vimp.nnoremap('<leader>w', ':close<CR>')
vimp.nnoremap('<leader>/', ':vsplit<CR><C-w>l')
vimp.nnoremap('<leader>-', ':split<CR><C-w>j')
vimp.nnoremap('<C-h>', '<C-w>h')
vimp.nnoremap('<C-j>', '<C-w>j')
vimp.nnoremap('<C-k>', '<C-w>k')
vimp.nnoremap('<C-l>', '<C-w>l')

-- buffers
vimp.vnoremap('P', 'p')
vimp.vnoremap('p', '"_dP') -- don't yank replaced text after paste in visual mode

-- comments
vimp.nnoremap('<C-_>', ":CommentToggle<CR>")
vimp.vnoremap('<C-_>', ":CommentToggle<CR>")

-- undotree
vimp.nnoremap('<leader>u', ':UndotreeToggle<CR>')

-- quickfix list & location list
vimp.nnoremap('<leader>cn', ':cnext<CR>zzzv')
vimp.nnoremap('<leader>cp', ':cprev<CR>zzzv')
vimp.nnoremap('<leader>co', ':copen<CR>')
vimp.nnoremap('<leader>ln', ':lnext<CR>zzzv')
vimp.nnoremap('<leader>lp', ':lprev<CR>zzzv')
vimp.nnoremap('<leader>lo', ':lopen<CR>')

-- fuzzy finder (telescope)
vimp.nnoremap('<leader>f', require'telescope.builtin'.find_files)
vimp.nnoremap('<leader>b', require'telescope.builtin'.buffers)
vimp.nnoremap('<leader>g', require'telescope.builtin'.live_grep)
vimp.nnoremap('<leader>h', require'telescope.builtin'.help_tags)
vimp.nnoremap('<leader>t', require'telescope.builtin'.file_browser)

-- LSP
M.on_attach_lsp = function(client, bufid)
	vimp.add_buffer_maps(bufid, function()
	end)
end
vimp.nnoremap({'silent'}, ',,', vim.lsp.buf.hover)
vimp.nnoremap({'silent'}, ',d', vim.lsp.buf.definition)
vimp.nnoremap({'silent'}, ',r', vim.lsp.buf.references)
vimp.nnoremap({'silent'}, ',i', vim.lsp.buf.implementation)
vimp.nnoremap({'silent'}, ',n', vim.lsp.diagnostic.goto_next)
vimp.nnoremap({'silent'}, ',p', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap({'silent'}, ',c', vim.lsp.buf.rename)
vimp.nnoremap({'silent'}, ',f', vim.lsp.buf.formatting)

-- completion
vimp.inoremap({'expr'}, '<Tab>', require'completion'.tab_complete)
vimp.snoremap({'expr'}, '<Tab>', require'completion'.tab_complete)
vimp.inoremap({'expr'}, '<S-Tab>', require'completion'.s_tab_complete)
vimp.snoremap({'expr'}, '<S-Tab>', require'completion'.s_tab_complete)
-- vimp.inoremap({'expr'}, '<CR>', 'compe#confirm("<CR>")') -- this is taken care of by nvim-autopairs
vimp.inoremap({'expr'}, '<C-space>', 'compe#complete()')

return M
