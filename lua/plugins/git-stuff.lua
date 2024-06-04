return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})

			-- Activer blame ligne actuelle pour tous les fichiers dans un dépôt Git
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*",
				callback = function()
					if vim.fn.system("git rev-parse --is-inside-work-tree") == "true\n" then
						require("gitsigns").toggle_current_line_blame()
					end
				end,
				group = vim.api.nvim_create_augroup("GitBlame", { clear = true }),
			})
		end,
	},
}
