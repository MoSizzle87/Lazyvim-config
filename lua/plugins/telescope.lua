-- telescope (fuzzy finder)
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")

        -- set the shortcut for find via grep (words in files)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

        -- set the shortcut for finding files
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    end
}
