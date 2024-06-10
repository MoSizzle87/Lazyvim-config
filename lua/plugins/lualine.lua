return {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                    {
                        "diff",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_x = {
                    {
                        "encoding",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                    {
                        "fileformat",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                    {
                        "filetype",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_y = {
                    {
                        "progress",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_z = {
                    {
                        "location",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {}, -- Removed buffers section
            extensions = {},
        })
    end,
}

