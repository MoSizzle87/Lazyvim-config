return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set("i", "<C-a>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true })
        vim.keymap.set("i", "<c-s>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true, silent = true })
        vim.keymap.set("i", "<c-r>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true })
        vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true })

        -- Add the following to trigger completion automatically
        vim.cmd([[
      augroup codeium_settings
      autocmd!
      autocmd InsertCharPre * call codeium#Complete()
      augroup END
      ]])
    end,
}
