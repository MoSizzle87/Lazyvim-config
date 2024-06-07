return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		-- Configuration de outline.nvim
		require("outline").setup({
			-- Configuration spécifique des options
			auto_close = false, -- Ne pas fermer automatiquement le volet
		})
	end,
}
