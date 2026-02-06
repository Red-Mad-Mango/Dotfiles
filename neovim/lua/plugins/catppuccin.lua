-- plugins/catppuccin.lua
return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	priority = 1000,
	config = function()
	require('catppuccin').setup({
		flavour = 'mocha',
		background = { light = 'latte', dark = 'mocha' },
		transparent_background = true,
		term_colors = true,
		integrations = {
			telescope = true,
			which_key = true,
			nvimtree = true,
			lsp_trouble = true,
			cmp = true,
			orgmode = true,
		},
	})
--	vim.cmd('colorscheme catppuccin')

	-- Customize Line Number Colors
	vim.cmd([[highlight LineNr guifg=#CBA6F7]])      -- Absolute line numbers
	vim.cmd([[highlight CursorLineNr guifg=#CDD6F4]]) -- Current line number
 end,
}
