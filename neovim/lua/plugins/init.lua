-- plugins/init.lua
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', lazypath,
	})
	end
	vim.opt.rtp:prepend(lazypath)

	require('lazy').setup({
		-- Theme
		require('plugins.catppuccin'),

						  -- Org‑mode & Roam
						  require('plugins.orgmode'),

						  -- Treesitter
						  require('plugins.treesitter'),

						  -- Which‑key
						  require('plugins.whichkey'),

						  -- Lualine
						  require('plugins.lualine'),

						  -- Headlines
						  require('plugins.headlines'),

						  -- Telescope (org‑only)
	require('plugins.telescope'),

						  --nui
						  require('plugins.nui'),

						  --Neo-Tree
						  require('plugins.file_explorer'),
	})
