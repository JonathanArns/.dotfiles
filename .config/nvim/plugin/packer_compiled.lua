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
local package_path_str = "/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/bubbly.nvim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\2a\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\n<C-,>\26user_emmet_leader_key\binv\20user_emmet_mode\6g\bvim\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\2O\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\16hint_enable\1\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  neovimplugin = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/neovimplugin"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2û\1\0\0\3\0\n\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\0\0'\1\4\0B\0\2\0029\0\2\0005\1\6\0005\2\5\0=\2\a\1B\0\2\0016\0\0\0'\1\b\0B\0\2\0029\0\2\0005\1\t\0B\0\2\1K\0\1\0\1\0\3\17map_complete\2\vmap_cr\2\16auto_select\1$nvim-autopairs.completion.compe\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\20create_mappings\1\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\2s\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2ä\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\1B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    config = { "\27LJ\2\2³\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\17textsubjects\1\0\0\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["srcery-vim"] = {
    config = { "\27LJ\2\2V\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\1\4\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\18srcery_italic\6g\bvim\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/srcery-vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\2½\1\0\0\3\0\t\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\21cycle_navigation\1\31enable_default_keybindings\2\14copy_sync\1\0\0\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/tmux.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\2\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\6\0\0\vgo.mod\t.git\rMakefile\15>workspace\r>.config\20rooter_patterns\b/,*\19rooter_targets\6g\bvim\0" },
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/jonathan/.local/share/nvim/site/pack/packer/start/vimpeccable"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bubbly.nvim
time([[Config for bubbly.nvim]], true)
try_loadstring("\27LJ\2\2ô\2\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\n\0\0\tmode\tpath\rtruncate\vbranch builtinlsp.diagnostic_count\24lsp_status.messages\fdivisor\rfiletype\rprogress\22bubbly_statusline\1\0\f\tcyan\f#5dbbc1\ngreen\f#a0c980\tblue\f#6cb6eb\14lightgrey\f#57595e\vyellow\f#deb974\15foreground\f#c5cdd9\rdarkgrey\f#404247\15background\f#34343c\bred\f#ec7279\nwhite\f#c5cdd9\nblack\f#3e4249\vpurple\f#d38aea\19bubbly_palette\6g\bvim\0", "config", "bubbly.nvim")
time([[Config for bubbly.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\2R\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\20create_mappings\1\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: nvim-treesitter-textsubjects
time([[Config for nvim-treesitter-textsubjects]], true)
try_loadstring("\27LJ\2\2³\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\17textsubjects\1\0\0\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textsubjects")
time([[Config for nvim-treesitter-textsubjects]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\2s\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\2½\1\0\0\3\0\t\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\21cycle_navigation\1\31enable_default_keybindings\2\14copy_sync\1\0\0\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: srcery-vim
time([[Config for srcery-vim]], true)
try_loadstring("\27LJ\2\2V\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\1\4\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\18srcery_italic\6g\bvim\0", "config", "srcery-vim")
time([[Config for srcery-vim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2û\1\0\0\3\0\n\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\0\0'\1\4\0B\0\2\0029\0\2\0005\1\6\0005\2\5\0=\2\a\1B\0\2\0016\0\0\0'\1\b\0B\0\2\0029\0\2\0005\1\t\0B\0\2\1K\0\1\0\1\0\3\17map_complete\2\vmap_cr\2\16auto_select\1$nvim-autopairs.completion.compe\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\2O\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\16hint_enable\1\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\2a\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\n<C-,>\26user_emmet_leader_key\binv\20user_emmet_mode\6g\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2ä\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\1B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
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
