-- ~/.config/nvim/lua/plugins/nvim-lint.lua
return {
	"mfussenegger/nvim-lint",
	config = function()
		-- Configurer nvim-lint pour Python
		require("lint").linters_by_ft = {
			python = {
				"flake8",
				"mypy",
				"pylint",
			},
		}

		-- Fonction pour exécuter le linter lors de l'enregistrement
		local function lint_on_save()
			require("lint").try_lint()
		end

		-- Définir un autocmd pour exécuter le linter à chaque enregistrement de fichier Python
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.py",
			callback = lint_on_save,
		})
	end,
}
