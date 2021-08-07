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

-- format and organize imports on save for *.go files
function formatAndOrgImports(wait_ms)
	vim.lsp.buf.formatting_sync(nil, wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit)
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end
vim.cmd([[autocmd BufwritePre *.go lua formatAndOrgImports(nil, 200)]])
