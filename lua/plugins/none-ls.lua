return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- formatting entries
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier, -- for javascript
				null_ls.builtins.formatting.isort, -- for python imports
				null_ls.builtins.formatting.black, -- for python
				null_ls.builtins.formatting.sql_formatter, -- for sql
				-- null_ls.builtins.formatting.autoflake, -- python : delete unused variables

				-- diagnostics entries
				null_ls.builtins.diagnostics.flake8, -- python : check PEP8 reco, unused variables and imports, etc...
				-- null_ls.builtins.diagnostics.eslint_d, -- for javascript
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
