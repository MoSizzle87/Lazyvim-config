
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

-- Show the line numbers (shown off because modicator handle it)
vim.opt.number = true             -- Afficher les numéros de ligne
-- vim.opt.relativenumber = true     -- Afficher les numéros de ligne relatifs (optionnel)

-- Activer la surbrillance de la ligne du curseur
vim.opt.cursorline = true

-- Ajouter une ligne verticale au curseur
vim.opt.cursorcolumn = true

-- Afficher les numéros de ligne relatifs
vim.opt.relativenumber = true
