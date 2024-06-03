return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		-- Définir les couleurs de l'indentation arc-en-ciel pour 10 niveaux
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
			"RainbowMagenta",
			"RainbowPink",
			"RainbowBrown",
		}

		local hooks = require("ibl.hooks")
		-- Créer les groupes de surbrillance dans le hook de configuration des surbrillances
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowMagenta", { fg = "#FF00FF", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF69B4", nocombine = true })
			vim.api.nvim_set_hl(0, "RainbowBrown", { fg = "#8B4513", nocombine = true })
		end)

		-- Configurer `indent-blankline` avec les couleurs arc-en-ciel pour 10 niveaux
		require("ibl").setup({
			indent = {
				char = "│",
				highlight = highlight,
			},
			scope = {
				enabled = true,
				highlight = highlight,
			},
		})

		-- Utiliser le hook pour la surbrillance du scope
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
}
