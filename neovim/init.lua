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
      vim.o.cursorline = true   -- Highlight the current line
      
      -- Customize Line Number Colors
      vim.cmd([[highlight LineNr guifg=#CBA6F7]])      -- Absolute line numbers
      vim.cmd([[highlight CursorLineNr guifg=#CDD6F4]]) -- Current line number

      -- Enable netrw by default
      vim.g.netrw_banner = 0     -- Hide the banner
      vim.g.netrw_browse_split = 4  -- Open files in previous window
      vim.g.netrw_altv = 1       -- Open vertical splits in the same window
      vim.g.netrw_liststyle = 3  -- Use a tree-like view

      -- 4. Key Mappings options ------------------------------------------------

      -- Key Mappings for Tab Management
      vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabnext<CR>', { noremap = true, silent = true })  -- Next Tab
      vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabprevious<CR>', { noremap = true, silent = true })  -- Previous Tab
      vim.api.nvim_set_keymap('n', '<Leader>tc', ':tabclose<CR>', { noremap = true, silent = true })  -- Close Tab
      vim.api.nvim_set_keymap('n', '<Leader>tN', ':tabnew<CR>', { noremap = true, silent = true })  -- New Tab

      -- Split Window Management Key Mappings
      vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>', { noremap = true, silent = true })  -- Horizontal Split
      vim.api.nvim_set_keymap('n', '<Leader>sv', ':vsplit<CR>', { noremap = true, silent = true })  -- Vertical Split
      vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })  -- Move to left window
      vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })  -- Move to down window
      vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })  -- Move to up window
      vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })  -- Move to right window
      vim.api.nvim_set_keymap('n', '<Leader>sc', '<C-w>c', { noremap = true, silent = true })  -- Close current split

      -- File Management Key Mappings
      vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })  --Save the current file
      vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', { noremap = true, silent = true })  --Quit Neovim
      vim.api.nvim_set_keymap('n', '<Space>e', ':Explore<CR>', { noremap = true, silent = true })  --Open the file explorer (e.g., netrw etc)

			--------------------------------------------------------------------
			-- End of init.lua ---------------------------------------------------
			--------------------------------------------------------------------
