local autopairs = require "nvim-autopairs"

autopairs.setup {
    check_ts = true
}

local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
	-- If you want insert `(` after select function or method item
	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end
