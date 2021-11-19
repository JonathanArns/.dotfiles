local special_configs = {
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = {'vim'}
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				}
			}
		}
	},
}

vim.cmd[[autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({open_loclist=false, workspace=true})]]

require'nvim-lsp-installer'.on_server_ready(function(server)
	local config = {}
	if special_configs[server.name] ~= nil then
		for k,v in pairs(special_configs[server.name]) do config[k] = v end
	end
	server:setup(config)
end)

-- format and organize imports on save for *.go files
function FormatAndOrgImports(wait_ms)
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
vim.cmd([[autocmd BufwritePre *.go lua FormatAndOrgImports(nil, 200)]])
