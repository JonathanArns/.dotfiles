local vimp = require'vimp'
vimp.always_override = true

-- edit the neovim config
vimp.nnoremap('<leader>e', ':e ~/.config/nvim/init.lua<CR>')

-- clear search
vimp.nnoremap({'silent'}, ',/', ':nohlsearch<CR>')

-- make H and L jump to start and end of line
-- vimp.nmap('H', '^')
-- vimp.vmap('H', '^')
-- vimp.nmap('L', '$')
-- vimp.vmap('L', '$')

-- keep cursor position on J
vimp.nnoremap('J', 'mzJ`z')

-- move around lines in visual mode
vimp.vnoremap('J', [[:m '>+1<CR>gv=gv]])
vimp.vnoremap('K', [[:m '<-2<CR>gv=gv]])

-- windows
vimp.nnoremap('<leader>w', ':close<CR>')
vimp.nnoremap('<leader>/', ':vsplit<CR><C-w>l')
vimp.nnoremap('<leader>-', ':split<CR><C-w>j')
vimp.nnoremap('<C-h>', function() require'kitty'.window_command('h') end)
vimp.nnoremap('<C-j>', function() require'kitty'.window_command('j') end)
vimp.nnoremap('<C-k>', function() require'kitty'.window_command('k') end)
vimp.nnoremap('<C-l>', function() require'kitty'.window_command('l') end)
vimp.nnoremap('<A-h>', function() require'kitty'.window_command('<') end) 
vimp.nnoremap('<A-j>', function() require'kitty'.window_command('-') end) 
vimp.nnoremap('<A-k>', function() require'kitty'.window_command('+') end) 
vimp.nnoremap('<A-l>', function() require'kitty'.window_command('>') end) 


-- buffers
vimp.vnoremap('P', 'p')
vimp.vnoremap('p', '"_dP') -- don't yank replaced text after paste in visual mode

-- undotree
vimp.nnoremap('<leader>u', ':UndotreeToggle<CR>')

-- quickfix & location list
vimp.nnoremap('<leader>cn', ':cnext<CR>zzzv')
vimp.nnoremap('<leader>cp', ':cprev<CR>zzzv')
vimp.nnoremap('<leader>cc', ':cwindow<CR>')

-- fuzzy finder (telescope)
vimp.nnoremap('<leader><leader>', require'telescope.builtin'.find_files)
vimp.nnoremap('<leader>b', require'telescope.builtin'.buffers)
vimp.nnoremap('<leader>f', require'telescope.builtin'.live_grep)

-- git
vimp.nnoremap('<leader>gg', ':Git<CR>')
vimp.nnoremap('<leader>gp', ':Gitsigns preview_hunk<CR>')
vimp.nnoremap('<leader>gr', ':Gitsigns reset_hunk<CR>')
vimp.nnoremap('<leader>gs', ':Gitsigns stage_hunk<CR>')
vimp.nnoremap('<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
vimp.nnoremap('<leader>gd', ':Gitsigns diffthis<CR>')

-- LSP
vimp.nnoremap({'silent'}, ',,', vim.lsp.buf.hover)
vimp.nnoremap({'silent'}, ',d', vim.lsp.buf.definition)
vimp.nnoremap({'silent'}, ',t', vim.lsp.buf.type_definition)
vimp.nnoremap({'silent'}, ',i', vim.lsp.buf.implementation)
vimp.nnoremap({'silent'}, ',r', vim.lsp.buf.references)
vimp.nnoremap({'silent'}, ',R', vim.lsp.buf.rename)
vimp.nnoremap({'silent'}, ',f', vim.lsp.buf.formatting)
vimp.nnoremap({'silent'}, ',a', require'telescope.builtin'.lsp_code_actions)
-- diagnostics
vimp.nnoremap({'silent'}, ',n', vim.diagnostic.goto_next)
vimp.nnoremap({'silent'}, ',p', vim.diagnostic.goto_prev)
vimp.nnoremap({'silent'}, ',D', vim.diagnostic.open_float)

-- completion
vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
