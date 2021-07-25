local export = {}
local vimp = require('vimp')
vimp.always_override = true

-- windows
vimp.nnoremap('<leader>/', ':vsplit<CR><C-w>l')
vimp.nnoremap('<leader>-', ':split<CR><C-w>j')
vimp.nnoremap('<C-h>', '<C-w>h')
vimp.nnoremap('<C-j>', '<C-w>j')
vimp.nnoremap('<C-k>', '<C-w>k')
vimp.nnoremap('<C-l>', '<C-w>l')

-- buffers
vimp.nnoremap('<leader>b', [[:buffers<CR>:buffer<Space>]]) -- show buffers and select one
vimp.vnoremap('P', 'p')
vimp.vnoremap('p', '"_dP') -- don't yank replaced text after paste in visual mode

-- comments
vimp.nnoremap('<C-_>', ":CommentToggle<CR>")
vimp.vnoremap('<C-_>', ":CommentToggle<CR>")
vimp.nnoremap('<leader>c', ":CommentToggle<CR>")

-- fuzzy finder (telescope)
vimp.nnoremap('<leader>ff', require'telescope.builtin'.find_files)
vimp.nnoremap('<leader>fb', require'telescope.builtin'.buffers)
vimp.nnoremap('<leader>fg', require'telescope.builtin'.live_grep)
vimp.nnoremap('<leader>fh', require'telescope.builtin'.help_tags)

-- LSP
export.on_attach_lsp = function(client, bufid)
	vimp.add_buffer_maps(bufid, function()
		vimp.nnoremap({'silent'}, 'K', vim.lsp.buf.hover)
		vimp.nnoremap({'silent'}, '<leader>gd', vim.lsp.buf.definition)
		vimp.nnoremap({'silent'}, '<leader>gr', vim.lsp.buf.references)
		vimp.nnoremap({'silent'}, '<leader>gi', vim.lsp.buf.implementation)
		vimp.nnoremap({'silent'}, '<leader>n', vim.lsp.diagnostic.goto_next)
		vimp.nnoremap({'silent'}, '<leader>p', vim.lsp.diagnostic.goto_prev)
		vimp.nnoremap({'silent'}, '<leader>rn', vim.lsp.buf.rename)
		vimp.nnoremap({'silent'}, '<leader>F', vim.lsp.buf.formatting)
	end)
end


-- completion
vimp.inoremap({'expr'}, '<Tab>', require'completion'.tab_complete)
vimp.snoremap({'expr'}, '<Tab>', require'completion'.tab_complete)
vimp.inoremap({'expr'}, '<S-Tab>', require'completion'.s_tab_complete)
vimp.snoremap({'expr'}, '<S-Tab>', require'completion'.s_tab_complete)
vimp.inoremap({'expr'}, '<CR>', 'compe#confirm("<CR>")') -- this line is important for auto-import
vimp.inoremap({'expr'}, '<C-space>', 'compe#complete()')

return export
