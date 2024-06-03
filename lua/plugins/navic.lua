return {
	"SmiteshP/nvim-navic",
	requires = "neovim/nvim-lspconfig",
	config = function()
		local navic = require("nvim-navic")

		require("lspconfig").clangd.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})

		-- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").pyright.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})

		-- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").lua_ls.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})

        -- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").sqlls.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})
		
        -- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").jsonls.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})
		
        -- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").tsserver.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})
		
        -- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").bashls.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})
		
        -- Répétez pour d'autres serveurs LSP si nécessaire
		require("lspconfig").pyright.setup({
			on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end,
		})
	end,
}
