local M = {}

local kitty_directions = {
	h = 'switch left',
	j = 'switch bottom',
	k = 'switch top',
	l = 'switch right',
	['<'] = 'resize narrower',
	['>'] = 'resize wider',
	['-'] = 'resize shorter',
	['+'] = 'resize taller',
}

M.window_command = function(direction)
	local win_height = vim.api.nvim_win_get_height(0)
	local win_width = vim.api.nvim_win_get_width(0)
	local cmd_height = vim.o.cmdheight
	local screen_height = vim.o.lines
	local screen_width = vim.o.columns

	if ("h" == direction or "j" == direction or "k" == direction or "l" == direction) then
		local pos = vim.api.nvim_win_get_number(0)
		vim.api.nvim_command('wincmd '..direction)
		if pos == vim.api.nvim_win_get_number(0) then
			vim.api.nvim_command('silent !kitty @ kitten window_command.py '..kitty_directions[direction])
		end
	else
		if 
			(("<" == direction or ">" == direction) and win_width == screen_width)
			or (("-" == direction or "+" == direction) and (1 + win_height + cmd_height) == screen_height)
		then
			vim.api.nvim_command('silent !kitty @ kitten window_command.py '..kitty_directions[direction])
		else
			vim.api.nvim_command('wincmd '..direction)
		end
	end
end

return M
