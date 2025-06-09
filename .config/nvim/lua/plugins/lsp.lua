require'mason-lspconfig'.setup {
	ensure_installed = {},
	automatic_enable = true
}

-- manually configued servers
vim.lsp.config('elp', {
	cmd = {
		-- 'elp',
		'/home/eonnraj/.local/share/nvim/mason/packages/elp-25-07-21/elp',
		-- '/home/eonnraj/workspace/erlang-language-platform/target/debug/elp',
		'server'
	},
	settings = {
		elp = {
			eqwalizer = {
				all = false,
				maxTasks = 0
			},
			diagnostics = {
				-- W0038: edoc syntax deprecation warning
				disabled = { "W0038" }
			}
		}
	}
})
vim.lsp.enable("elp")
