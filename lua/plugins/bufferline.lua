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

        -- Ouvrir un nouveau buffer
        vim.api.nvim_set_keymap("n", "<leader>bn", ":enew<CR>", { noremap = true, silent = true })

        -- Fermer le buffer actuel
        vim.api.nvim_set_keymap("n", "<leader>bc", ":bd<CR>", { noremap = true, silent = true })

        -- Ouvrir un nouvel onglet
        vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })

        -- Fermer l'onglet actuel
        vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })

        -- Fonction pour fermer un onglet par numéro ordinal
        function CloseTabByNumber(n)
            vim.cmd(n .. "tabclose")
        end

        -- Créer des mappages pour fermer l'onglet par numéro ordinal
        for i = 1, 9 do
            local key = tostring(i) .. "tc"
            vim.api.nvim_set_keymap(
                "n",
                key,
                ":lua CloseTabByNumber(" .. i .. ")<CR>",
                { noremap = true, silent = true }
            )
        end

        -- Fonction pour fermer un buffer par numéro ordinal
        function CloseBufferByNumber(n)
            vim.cmd(n .. "bdelete")
        end

        -- Créer des mappages pour fermer le buffer par numéro ordinal
        for i = 1, 9 do
            local key = tostring(i) .. "bc"
            vim.api.nvim_set_keymap(
                "n",
                key,
                ":lua CloseBufferByNumber(" .. i .. ")<CR>",
                { noremap = true, silent = true }
            )
        end

        -- Fonction pour aller à un buffer par numéro ordinal dans la liste
        function GoToBufferByOrdinal(n)
            local buffers = vim.fn.getbufinfo({ buflisted = 1 })
            if n <= #buffers then
                local buffer_number = buffers[n].bufnr
                vim.cmd("buffer " .. buffer_number)
            else
                print("Buffer ordinal " .. n .. " does not exist")
            end
        end

        -- Créer des mappages pour aller au buffer par numéro ordinal
        for i = 1, 9 do
            local key = tostring(i) .. "b"
            vim.api.nvim_set_keymap(
                "n",
                key,
                ":lua GoToBufferByOrdinal(" .. i .. ")<CR>",
                { noremap = true, silent = true }
            )
        end
    end,
}

