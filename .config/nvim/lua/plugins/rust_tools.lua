local rust_tools = require'rust-tools'

rust_tools.setup{
	cmd = { "rustup run nightly rust-analyzer" }
}
