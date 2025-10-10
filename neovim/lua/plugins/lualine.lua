-- plugins/lualine.lua
return {
	'nvim-lualine/lualine.nvim',
	opts = {
		sections = {
			lualine_c = { 'filename', 'branch', 'diagnostics', 'orgmode' },
		},
	},
}
