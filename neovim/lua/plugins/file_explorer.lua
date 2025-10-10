-- lua/plugins/file_explorer.lua
return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
	require('neo-tree').setup({
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
		window = { width = 30 },
	})
	end,
}
