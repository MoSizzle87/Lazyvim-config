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
                    "lua_ls", -- lua
                    "sqlls", -- sql
                    "bashls", -- bash
                    "jsonls", -- json
                    "pyright", -- python
                    "tsserver", -- javascript
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})  -- lua
            lspconfig.sqlls.setup({}) -- sql
            lspconfig.bashls.setup({}) -- bash
            lspconfig.jsonls.setup({}) -- json
            lspconfig.pyright.setup({}) -- python
            lspconfig.tsserver.setup({}) -- javascript

            -- options
            -- get some help for functions
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

            -- go to definition
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition , {})

            -- code actions
             vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
