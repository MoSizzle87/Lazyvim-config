return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "lua_ls",
                    "sqlls",
                    "bashls",
                    "jsonls",
                    "ruff_lsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.bashls.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.ruff_lsp.setup({})
        end
    }
}
