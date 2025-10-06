--------------------------------------------------------------------
--  Neovim init.lua – Catppuccin (Mocha) using lazy.nvim ----------
--------------------------------------------------------------------

-- Use the space bar as the leader key
vim.g.mapleader = " "      -- <leader> = Space
vim.g.maplocalleader = " " -- optional, for buffer‑local leader


-- 1. Bootstrap lazy.nvim ------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop and not vim.loop.fs_stat(lazypath) then
	-- Fallback for very old Neovim versions
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
	else
		if not vim.loop.fs_stat(lazypath) then
			vim.fn.system({
				'git',
				'clone',
				'--filter=blob:none',
				'https://github.com/folke/lazy.nvim.git',
				'--branch=stable',
				lazypath,
			})
			end
			end
			vim.opt.rtp:prepend(lazypath)

			-- 2. Plugin specification ------------------------------------------------
			require('lazy').setup({
				{
					'catppuccin/nvim',
					name = 'catppuccin',          -- optional, makes the plugin name explicit
					lazy = false,                 -- load immediately
					priority = 1000,              -- load before other plugins
					config = function()
					require('catppuccin').setup({
						flavour = 'mocha',         -- choose: latte, frappe, macchiato, mocha
						-- optional customisations
						background = {             -- set background for light/dark
							light = 'latte',
							dark  = 'mocha',
						},
						transparent_background = false,
						term_colors = true,
						integrations = {
							telescope = true,
							which_key = true,
							nvimtree = true,
							lsp_trouble = true,
							cmp = true,
							-- add more integrations as you like
						},
					})
					vim.cmd('colorscheme catppuccin')
					end,
				},

				-- (Optional) add other plugins here, e.g.:
				-- { 'nvim-treesitter/nvim-treesitter', config = function() ... end },
								  -- { 'nvim-lualine/lualine.nvim', opts = {} },
				{
					"nvim-orgmode/orgmode",
					ft = { "org" },                     -- load only for .org files
					config = function()
					require("orgmode").setup({
						org_agenda_files      = { "~/orgfiles/**/*" },   -- agenda files
						org_default_notes_file = "~/orgfiles/refile.org", -- quick‑capture file
					})
					end,
				},

				{
					"nvim-treesitter/nvim-treesitter",
					build = ":TSUpdate",
					opts = {
						ensure_installed = { "lua", "vim", "org", "bash", "python" }, -- add others you need
						highlight = { enable = true },
						indent = { enable = true },
					},
				},

				-- Which‑key for shortcut hints
				{ "folke/which-key.nvim", config = true },

				-- Lualine status line (optional Org component)
				{
					"nvim-lualine/lualine.nvim",
					opts = {
						sections = {
							lualine_c = { "filename", "branch", "diagnostics", "orgmode" },
						},
					},
				},

				-- Headline folding (nice visual hierarchy)
				{ "lukas-reineke/headlines.nvim", config = true },

				-- (optional) Telescope for Org navigation
				{
					"nvim-telescope/telescope.nvim",
					dependencies = { "nvim-lua/plenary.nvim" },
					ft = { "org" },
					config = function() require("telescope").setup() end,
					},

				-- org roam
				{
					"chipsenkbeil/org-roam.nvim",
						tag = "0.2.0",
						dependencies = {
							{
								"nvim-orgmode/orgmode",
						tag = "0.7.0",
							},
						},
						config = function()
						require("org-roam").setup({
							directory = "~/org_roam_files",
							-- optional
							org_files = {
								"~/another_org_dir",
								"~/some/folder/*.org",
								"~/a/single/org_file.org",
							}
						})
					end
				}
	})

			-- 3. General Neovim options ---------------------------------------------
			vim.o.termguicolors   = true   -- true‑color support
			vim.o.number          = true   -- absolute line numbers
			vim.o.relativenumber  = true   -- relative numbers
			vim.o.mouse           = 'a'    -- mouse in all modes
			vim.o.clipboard       = 'unnamedplus' -- system clipboard
			vim.o.expandtab       = true
			vim.o.shiftwidth      = 2
			vim.o.tabstop         = 2
			vim.o.smartindent     = true
			vim.o.wrap            = false
			vim.o.scrolloff       = 8
			vim.o.signcolumn      = 'yes'  -- always show gutter

			--------------------------------------------------------------------
			-- End of init.lua ---------------------------------------------------
			--------------------------------------------------------------------
