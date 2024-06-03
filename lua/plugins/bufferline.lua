return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
		"neovim/nvim-lspconfig",
	},
	config = function()
		vim.opt.termguicolors = true

		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				separator_style = "padded_slope",
				numbers = function(opts)
					return string.format("%s|%s", opts.ordinal, opts.raise(opts.id))
				end,
				--- count is an integer representing total count of errors
				--- level is a string "error" | "warning"
				--- this should return a string
				--- Don't get too fancy as this function will be executed a lot
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				diagnostics = "nvim_lsp",
				show_close_icon = true,
				show_buffer_close_icons = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})

		-- Fonction pour fermer l'onglet courant et son buffer associé
		function CloseTabAndBuffer()
			local current_buf = vim.api.nvim_get_current_buf()
			vim.cmd("tabclose")
			vim.cmd("bdelete " .. current_buf)
		end

		-- Fonction pour fermer un onglet basé sur son ordinal
		function CloseTabByOrdinal(ordinal)
			local tabnr = tonumber(ordinal)
			if tabnr then
				local tabpages = vim.api.nvim_list_tabpages() -- Obtention de la liste des onglets
				if tabnr > 0 and tabnr <= #tabpages then
					vim.api.nvim_set_current_tabpage(tabpages[tabnr]) -- Changement vers l'onglet spécifié
					local bufnr = vim.api.nvim_get_current_buf()
					vim.cmd("tabclose")
					vim.cmd("bdelete " .. bufnr) -- Fermeture de l'onglet et suppression du buffer associé
				else
					print("Tab " .. tabnr .. " does not exist")
				end
			else
				print("Invalid tab number: " .. ordinal)
			end
		end

		-- Mappings pour fermer les onglets
		vim.api.nvim_set_keymap("n", "<leader>tc", ":lua CloseTabAndBuffer()<CR>", { noremap = true, silent = true })

		-- Mappings pour ouvrir un nouvel onglet
		vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })

		-- Mappings pour fermer les onglets par numéro
		for i = 1, 9 do
			vim.api.nvim_set_keymap(
				"n",
				"<leader>tc" .. i,
				":lua CloseTabByOrdinal(" .. i .. ")<CR>",
				{ noremap = true, silent = true }
			)
		end
	end,
}
