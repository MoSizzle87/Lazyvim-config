return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			local api_key_path = "/Users/MoG/.DE_tools/API_key_nvim.txt"
			local api_key = ""

			-- Lire la clé API depuis le fichier
			local file = io.open(api_key_path, "r")
			if file then
				api_key = file:read("*a"):gsub("%s+", "") -- Supprimer les espaces et nouvelles lignes
				file:close()
			else
				vim.notify("Erreur : Impossible de lire le fichier API key", vim.log.levels.ERROR)
			end

			-- Définir la clé API dans une variable d'environnement
			vim.env.OPENAI_API_KEY = api_key

			require("chatgpt").setup({
				-- Vous pouvez également passer la clé directement si le plugin supporte cette méthode
				-- api_key = api_key
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
