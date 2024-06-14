return {
    "kdheepak/tabline.nvim",
    requires = {
        { "hoob3rt/lualine.nvim",         opt = true },
        { "kyazdani42/nvim-web-devicons", opt = true },
    },
    config = function()
        require("tabline").setup({
            enable = true,
            options = {
                section_separators = { "", "" },
                component_separators = { "", "" },
                max_bufferline_percent = 66, -- set to 0 to always show tabline
                show_tabs_always = false,
                show_devicons = true, -- this option requires nvim-web-devicons
                show_bufnr = false,
                show_filename_only = true,
                modified_icon = "+ ",
                modified_italic = false,
                show_tabs_only = false,
            },
        })
        vim.cmd([[
            set guioptions-=e " Use showtabline in gui vim
            set sessionoptions+=tabpages,globals " store tabpages and globals in session
            ]])
    end,
}
