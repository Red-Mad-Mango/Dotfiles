-- plugins/treesitter.lua
return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'lua', 'vim', 'org', 'bash', 'python' },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
