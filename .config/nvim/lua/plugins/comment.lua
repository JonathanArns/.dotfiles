require'Comment'.setup{
	ignore = '^$', -- ignore empty lines
	mappings = {
		basic = true,
		extra = false,
		extended = false,
	},
}

-- set custom comment strings per filetype, {'line', 'block'}
local comment_ft = require'Comment.ft'
comment_ft.set('lua', {'--%s', '--[[%s]]'})
comment_ft.set('java', {'//%s', '/*%s*/'})

