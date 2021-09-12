-- this file contains general options

local opt = vim.opt
local g = vim.g

g.mapleader = ' '

opt.number = true
opt.wrap = false
opt.scrolloff = 5
opt.termguicolors = true
opt.title = true
opt.mouse = 'a'

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.smarttab = true
opt.autoindent = true
opt.copyindent = true
opt.smartindent = true

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = true

-- buffers
opt.hidden = true
opt.autowriteall = true
opt.autoread = true


-- disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
