return {
	-- Plugin Neogen avec dépendance nvim-treesitter
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({
				enabled = true,
				languages = {
					python = {
						template = {
							annotation_convention = "google_docstrings",
						},
					},
					lua = {
						template = {
							annotation_convention = "emmylua",
						},
					},
					-- Ajoute d'autres langages ici
				},
			})

			-- Mappage de touche pour appeler Neogen avec Leader + ds
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>ds",
				':lua require("neogen").generate()<CR>',
				{ noremap = true, silent = true }
			)
		end,
	},
}
