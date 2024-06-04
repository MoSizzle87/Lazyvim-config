-- telescope (fuzzy finder)
return {
    {
        --telescope
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            -- set the shortcut for find via grep (words in files)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

            -- set the shortcut for finding files
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        end,
    },
    {
        -- telescope-ui-select for code action
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
