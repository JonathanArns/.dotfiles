-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/var/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/var/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/var/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/var/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/var/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bubbly.nvim"] = {
    config = { "\27LJ\2\2ô\2\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\n\0\0\tmode\tpath\rtruncate\vbranch builtinlsp.diagnostic_count\24lsp_status.messages\fdivisor\rfiletype\rprogress\22bubbly_statusline\1\0\f\tcyan\f#5dbbc1\ngreen\f#a0c980\tblue\f#6cb6eb\14lightgrey\f#57595e\vyellow\f#deb974\15foreground\f#c5cdd9\rdarkgrey\f#404247\15background\f#34343c\bred\f#ec7279\nwhite\f#c5cdd9\nblack\f#3e4249\vpurple\f#d38aea\19bubbly_palette\6g\bvim\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/bubbly.nvim",
    url = "https://github.com/datwaft/bubbly.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-o-matic"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/indent-o-matic",
    url = "https://github.com/Darazaki/indent-o-matic"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\2d\0\0\2\0\4\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\20mini.completion\nsetup\15mini.pairs\frequire\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\20create_mappings\1\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2 \3\0\0\4\0\18\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0005\3\15\0=\3\16\2=\2\17\1B\0\2\1K\0\1\0\17textsubjects\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\14autopairs\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\n\0\0\ago\thtml\bvue\vpython\trust\blua\bcss\15javascript\tfish\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["srcery-vim"] = {
    config = { "\27LJ\2\2V\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\1\4\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\18srcery_italic\6g\bvim\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/srcery-vim",
    url = "https://github.com/srcery-colors/srcery-vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\2½\1\0\0\3\0\t\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\21cycle_navigation\1\31enable_default_keybindings\2\14copy_sync\1\0\0\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  undotree = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\2\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\6\0\0\vgo.mod\t.git\rMakefile\15>workspace\r>.config\20rooter_patterns\b/,*\19rooter_targets\6g\bvim\0" },
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  vimpeccable = {
    loaded = true,
    path = "/var/home/jonathan/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bubbly.nvim
time([[Config for bubbly.nvim]], true)
try_loadstring("\27LJ\2\2ô\2\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\n\0\0\tmode\tpath\rtruncate\vbranch builtinlsp.diagnostic_count\24lsp_status.messages\fdivisor\rfiletype\rprogress\22bubbly_statusline\1\0\f\tcyan\f#5dbbc1\ngreen\f#a0c980\tblue\f#6cb6eb\14lightgrey\f#57595e\vyellow\f#deb974\15foreground\f#c5cdd9\rdarkgrey\f#404247\15background\f#34343c\bred\f#ec7279\nwhite\f#c5cdd9\nblack\f#3e4249\vpurple\f#d38aea\19bubbly_palette\6g\bvim\0", "config", "bubbly.nvim")
time([[Config for bubbly.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\20create_mappings\1\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\2d\0\0\2\0\4\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\20mini.completion\nsetup\15mini.pairs\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\2½\1\0\0\3\0\t\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\21cycle_navigation\1\31enable_default_keybindings\2\14copy_sync\1\0\0\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: srcery-vim
time([[Config for srcery-vim]], true)
try_loadstring("\27LJ\2\2V\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\1\4\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\18srcery_italic\6g\bvim\0", "config", "srcery-vim")
time([[Config for srcery-vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2 \3\0\0\4\0\18\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0005\3\15\0=\3\16\2=\2\17\1B\0\2\1K\0\1\0\17textsubjects\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\14autopairs\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\n\0\0\ago\thtml\bvue\vpython\trust\blua\bcss\15javascript\tfish\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\2\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\6\0\0\vgo.mod\t.git\rMakefile\15>workspace\r>.config\20rooter_patterns\b/,*\19rooter_targets\6g\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
