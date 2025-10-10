-- plugins/orgmode.lua
return {
	-- Orgmode core
	{
		'nvim-orgmode/orgmode',
		ft = { 'org' },
		config = function()
		require('orgmode').setup({
			org_agenda_files = { '~/orgfiles/**/*' },
			org_default_notes_file = '~/orgfiles/refile.org',
		})
		end,
	},

	-- Org‑roam (depends on orgmode)
	{
		'chipsenkbeil/org-roam.nvim',
		tag = '0.2.0',
		dependencies = {
			{ 'nvim-orgmode/orgmode', tag = '0.7.0' },
		},
		config = function()
		require('org-roam').setup({
			directory = '~/org_roam_files',
			org_files = {
				'~/another_org_dir',
				'~/some/folder/*.org',
				'~/a/single/org_file.org',
			},
		})
		end,
	},
}
