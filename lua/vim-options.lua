
-- Basic indentation settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set smartindent")


-- Enable file type detection, plugins, and indent settings
vim.cmd("filetype plugin indent on")

-- Set the leader key
vim.g.mapleader = " "

-- entirely format a file
vim.api.nvim_set_keymap('n', '<leader>f', 'gg=G', { noremap = true, silent = true })

-- set shortcut for buffer navigation
-- shortcut for closing a tab with tc+number
function CloseTab()
  local tabnum = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd('tabclose ' .. tabnum)
end

vim.api.nvim_set_keymap('n', 'tc', ':lua CloseTab()<CR>', { noremap = true, silent = true })
