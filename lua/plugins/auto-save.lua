return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			-- your config goes here
			-- or just leave it empty :)
		})
		-- Additionally you may want to set up a key mapping to toggle auto-save
		vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
	end,
}
