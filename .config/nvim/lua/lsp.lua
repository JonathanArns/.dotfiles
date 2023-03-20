local special_configs = {
	lua_ls = {
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
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					disabled = {"unresolved-proc-macro"},
				}
			}
		}
	}
}

vim.cmd[[autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({open_loclist=false, workspace=true})]]

require'nvim-lsp-installer'.on_server_ready(function(server)
	local config = {
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	}
	if special_configs[server.name] ~= nil then
		for k,v in pairs(special_configs[server.name]) do config[k] = v end
	end
	server:setup(config)
end)
