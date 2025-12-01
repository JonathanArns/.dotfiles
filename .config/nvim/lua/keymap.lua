-- edit the neovim config
vim.keymap.set('n', '<leader>e', ':e ~/.config/nvim/init.lua<CR>', { noremap = true })

-- keep cursor position on J
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- move around lines in visual mode
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })

-- windows
vim.keymap.set('n', '<leader>w', ':close<CR>', { noremap = true })
vim.keymap.set('n', '<leader>/', ':vsplit<CR><C-w>l', { noremap = true })
vim.keymap.set('n', '<leader>-', ':split<CR><C-w>j', { noremap = true })
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<A-,>', '<C-w><', { noremap = true })
vim.keymap.set('n', '<A-->', '<C-w>-', { noremap = true })
vim.keymap.set('n', '<A-=>', '<C-w>+', { noremap = true })
vim.keymap.set('n', '<A-.>', '<C-w>>', { noremap = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })


-- buffers
vim.keymap.set('v', 'P', 'p', { noremap = true })
vim.keymap.set('v', 'p', '"_dP', { noremap = true }) -- don't yank replaced text after paste in visual mode

-- undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- quickfix & location list
vim.keymap.set('n', '<leader>cn', ':cnext<CR>zzzv', { noremap = true })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>zzzv', { noremap = true })
vim.keymap.set('n', '<leader>cc', ':cwindow<CR>', { noremap = true })

-- fuzzy finder (fzf-lua)
vim.keymap.set('n', '<leader><leader>', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>f', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>r', ':FzfLua resume<CR>')

-- git
vim.keymap.set('n', '<leader>gg', ':Git<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { noremap = true })

-- LSP
vim.keymap.set('n', ',,', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', ',d', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, { noremap = true, silent = true })
vim.keymap.set('n', ',i', vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set('n', ',r', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', ',R', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', ',f', function() vim.lsp.buf.format({async = true}) end, { noremap = true, silent = true })

-- diagnostics
vim.keymap.set('n', ',n', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ',D', vim.diagnostic.open_float, { noremap = true, silent = true })

-- completion
-- vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
-- vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
