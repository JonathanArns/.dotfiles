local vimp = require'vimp'
vimp.always_override = true

-- edit the neovim config
vimp.nnoremap('<leader>e', ':e ~/.config/nvim/init.lua<CR>')

-- clear search
vimp.nnoremap({'silent'}, ',/', ':nohlsearch<CR>')

-- swap : and ;
vimp.nnoremap(';', ':')
vimp.nnoremap(':', ';')

-- make H and L jump to start and end of line
vimp.nnoremap('H', '0')
vimp.vnoremap('H', '0')
vimp.nnoremap('L', '$')
vimp.vnoremap('L', '$')

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

-- quickfix & location list
vimp.nnoremap('<leader>cn', ':cnext<CR>zzzv')
vimp.nnoremap('<leader>cp', ':cprev<CR>zzzv')
vimp.nnoremap('<leader>cc', ':cwindow<CR>')
vimp.nnoremap('<leader>ln', ':lnext<CR>zzzv')
vimp.nnoremap('<leader>lp', ':lprev<CR>zzzv')
vimp.nnoremap('<leader>ll', ':lwindow<CR>')

-- fuzzy finder (telescope)
vimp.nnoremap('<leader><leader>', require'telescope.builtin'.git_files)
vimp.nnoremap('<leader>b', require'telescope.builtin'.buffers)
vimp.nnoremap('<leader>f', require'telescope.builtin'.live_grep)

-- fugitive
vimp.nnoremap('<leader>g', ':Git<CR>')

-- LSP
vimp.nnoremap({'silent'}, ',,', vim.lsp.buf.hover)
vimp.nnoremap({'silent'}, ',d', vim.lsp.buf.definition)
vimp.nnoremap({'silent'}, ',t', vim.lsp.buf.type_definition)
vimp.nnoremap({'silent'}, ',i', vim.lsp.buf.implementation)
vimp.nnoremap({'silent'}, ',r', vim.lsp.buf.references)
vimp.nnoremap({'silent'}, ',n', vim.lsp.diagnostic.goto_next)
vimp.nnoremap({'silent'}, ',p', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap({'silent'}, ',D', vim.lsp.diagnostic.show_line_diagnostics)
vimp.nnoremap({'silent'}, ',R', vim.lsp.buf.rename)
vimp.nnoremap({'silent'}, ',f', vim.lsp.buf.formatting)
vimp.nnoremap({'silent'}, ',a', require'telescope.builtin'.lsp_code_actions)

-- completion
vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
