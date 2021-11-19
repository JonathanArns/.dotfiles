return function(inactive)
	if require'snippy'.is_active() then
		return {
			{
				data = 'snip',
				color = 'purple',
			}
		}
	end
	return {}
end
