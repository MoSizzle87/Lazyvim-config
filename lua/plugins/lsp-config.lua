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
            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })  -- lua
            lspconfig.sqlls.setup({ capabilities = capabilities }) -- sql
            lspconfig.bashls.setup({ capabilities = capabilities }) -- bash
            lspconfig.jsonls.setup({ capabilities = capabilities }) -- json
            lspconfig.pyright.setup({ capabilities = capabilities }) -- python
            lspconfig.tsserver.setup({ capabilities = capabilities }) -- javascript

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
