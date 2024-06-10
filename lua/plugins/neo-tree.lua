return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

        -- Launch neotree automatically
        vim.api.nvim_create_augroup("neotree", {})
        vim.api.nvim_create_autocmd("UiEnter", {
            desc = "Open Neotree automatically",
            group = "neotree",
            callback = function()
                if vim.fn.argc() == 0 then
                    vim.cmd("Neotree toggle")
                end
            end,
        })

        require("neo-tree").setup({
            close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "rounded",
            enable_git_status = true, -- Enable git status
            enable_diagnostics = false,
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 1, -- extra padding on left hand side
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "*",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        added = "✚",
                        modified = "",
                        deleted = "✖",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "left",
                width = 40, -- Increase the width of the Neo-tree window
                mappings = {
                    ["<space>"] = "toggle_node",
                    ["<cr>"] = "open",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    ["C"] = "close_node",
                    ["R"] = "refresh",
                    ["a"] = "add",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["c"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                },
            },
            nesting_rules = {},
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_hidden = true, -- only works on Windows for hidden files/directories
                },
                follow_current_file = true,
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = false,
            },
            buffers = {
                show_unloaded = true,
            },
            git_status = {
                window = {
                    position = "float",
                },
            },
        })
    end,
}

