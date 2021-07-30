local lspconfig = require'lspconfig'

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
    	on_attach = require'keymap'.on_attach_lsp
    }
  end
end

setup_servers()

-- automatically setup servers again after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- makes sure the new server is setup in lspconfig
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- auto put diagnostics into location list
vim.cmd([[autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({open_loclist=false})]])
