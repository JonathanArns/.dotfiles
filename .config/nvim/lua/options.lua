-- this file contains general options

local opt = vim.opt
local g = vim.g

g.mapleader = ' '

opt.guifont = 'Cascadia Code'
opt.number = true
opt.wrap = false
opt.scrolloff = 5
opt.termguicolors = true
opt.title = true
opt.mouse = 'a'
opt.textwidth = 130

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.smarttab = true
-- opt.autoindent = true
-- opt.copyindent = true
-- opt.smartindent = true

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = true

-- buffers
opt.hidden = true
opt.autowrite = true
opt.autowriteall = true
opt.autoread = true
opt.undofile = true
