-- entirely format a file
vim.api.nvim_set_keymap("n", "<leader>f", "gg=G", { noremap = true, silent = true })

-- Quit without saving (force quit)
vim.api.nvim_set_keymap("n", "QQ", ":q!<CR>", { noremap = true, silent = true })

-- Write and quit (force write)
vim.api.nvim_set_keymap("n", "WW", ":w!<CR>", { noremap = true, silent = true })

-- Quit
vim.api.nvim_set_keymap("n", "qq", ":q<CR>", { noremap = true, silent = true })

-- Write
vim.api.nvim_set_keymap("n", "ww", ":w<CR>", { noremap = true, silent = true })

-- Write and quit all
vim.api.nvim_set_keymap("n", "wqa", ":wqa<CR>", { noremap = true, silent = true })

-- Write and quit
vim.api.nvim_set_keymap("n", "wq", ":wq<CR>", { noremap = true, silent = true })

-- Map nn to go to the next buffer
vim.api.nvim_set_keymap('n', 'nn', ':bnext<CR>', { noremap = true, silent = true })

-- Map pp to go to the previous buffer
vim.api.nvim_set_keymap('n', 'pp', ':bprevious<CR>', { noremap = true, silent = true })
