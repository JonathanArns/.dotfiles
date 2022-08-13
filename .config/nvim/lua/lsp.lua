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
	local config = {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
	if special_configs[server.name] ~= nil then
		for k,v in pairs(special_configs[server.name]) do config[k] = v end
	end
	server:setup(config)
end)
