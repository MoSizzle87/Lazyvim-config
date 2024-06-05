-- lazy.nvim
return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- Ajoutez toutes les options spécifiques ici
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                config = function()
                    vim.opt.termguicolors = true
                    require("notify").setup({
                        -- Configurez les options de notification ici si nécessaire
                    })
                    vim.notify = require("notify")
                end,
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.opt.termguicolors = true
            require("notify").setup({
                -- Configurez les options de notification ici si nécessaire
            })
            vim.notify = require("notify")
        end,
    },
}
