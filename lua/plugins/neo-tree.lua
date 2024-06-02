return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

		-- Launch neotree automatically
		vim.api.nvim_create_augroup("neotree", {})
		vim.api.nvim_create_autocmd("UiEnter", {
			desc = "Open Neotree automatically",
			group = "neotree",
			callback = function()
				if vim.fn.argc() == 0 then
					vim.cmd("Neotree toggle")
				end
			end,
		})
	end,
}
