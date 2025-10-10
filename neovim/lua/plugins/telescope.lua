-- plugins/telescope.lua
return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	ft = { 'org' },
	config = function()
	require('telescope').setup()
	end,
}
