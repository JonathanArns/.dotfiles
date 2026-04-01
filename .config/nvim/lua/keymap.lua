-- edit the neovim config
vim.keymap.set('n', '<leader>e', ':e ~/.config/nvim/init.lua<CR>')

-- keep cursor position on J
vim.keymap.set('n', 'J', 'mzJ`z')

-- move around lines in visual mode
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- windows
vim.keymap.set('n', '<leader>w', ':close<CR>')
vim.keymap.set('n', '<leader>/', ':vsplit<CR><C-w>l')
vim.keymap.set('n', '<leader>-', ':split<CR><C-w>j')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-,>', '<C-w><')
vim.keymap.set('n', '<A-->', '<C-w>-')
vim.keymap.set('n', '<A-=>', '<C-w>+')
vim.keymap.set('n', '<A-.>', '<C-w>>')

-- buffers
vim.keymap.set('v', 'P', 'p')
vim.keymap.set('v', 'p', '"_dP') -- don't yank replaced text after paste in visual mode

-- undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')

-- quickfix & location list
vim.keymap.set('n', '<leader>cn', ':cnext<CR>zzzv')
vim.keymap.set('n', '<leader>cp', ':cprev<CR>zzzv')
vim.keymap.set('n', '<leader>cc', ':cwindow<CR>')

-- fuzzy finder (fzf-lua)
vim.keymap.set('n', '<leader><leader>', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>f', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>r', ':FzfLua resume<CR>')

-- git
vim.keymap.set('n', '<leader>gg', ':Git<CR>')
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>')

-- LSP
vim.keymap.set('n', ',,', vim.lsp.buf.hover)
vim.keymap.set('n', ',d', vim.lsp.buf.definition)
vim.keymap.set('n', ',t', vim.lsp.buf.type_definition)
vim.keymap.set('n', ',i', vim.lsp.buf.implementation)
vim.keymap.set('n', ',r', vim.lsp.buf.references)
vim.keymap.set('n', ',R', vim.lsp.buf.rename)
vim.keymap.set('n', ',f', function() vim.lsp.buf.format({async = true}) end)

-- diagnostics
vim.keymap.set('n', ',n', vim.diagnostic.goto_next)
vim.keymap.set('n', ',p', vim.diagnostic.goto_prev)
vim.keymap.set('n', ',D', vim.diagnostic.open_float)

-- completion
vim.keymap.set('i', '<C-j>', [[pumvisible() ? '<C-n>' : '<C-j>']], { expr = true })
vim.keymap.set('i', '<C-k>', [[pumvisible() ? '<C-p>' : '<C-k>']], { expr = true })
