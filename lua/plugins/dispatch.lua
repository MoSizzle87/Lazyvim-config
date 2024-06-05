-- ~/.config/nvim/lua/plugins/dispatch.lua
return {
    "tpope/vim-dispatch",
    config = function()
        -- Fonction pour exécuter une commande dans une fenêtre split de terminal
        function ExecuteInTerminal(cmd)
            -- Ouvrir une fenêtre split en bas
            vim.cmd("belowright split | resize 15 | terminal")
            -- Exécuter la commande dans le terminal après une petite pause pour s'assurer que le terminal est prêt
            vim.defer_fn(function()
                vim.fn.chansend(vim.b.terminal_job_id, cmd .. "\n")
            end, 100)
        end

        -- Fonction pour exécuter le code sélectionné dans une fenêtre split de terminal
        function ExecuteSelectionInTerminal()
            -- Sauvegarder la sélection courante
            local start_pos = vim.fn.getpos("'<")
            local end_pos = vim.fn.getpos("'>")
            local lines = vim.fn.getline(start_pos[2], end_pos[2])
            local selection = table.concat(lines, "\n")

            -- Ouvrir une fenêtre split en bas
            vim.cmd("belowright split | resize 15 | terminal")
            -- Exécuter le code sélectionné dans le terminal après une petite pause pour s'assurer que le terminal est prêt
            vim.defer_fn(function()
                vim.fn.chansend(vim.b.terminal_job_id, selection .. "\n")
            end, 100)
        end

        -- Raccourci pour exécuter le fichier Python actuel dans une fenêtre split
        vim.api.nvim_set_keymap(
            "n",
            "DD",
            ':lua ExecuteInTerminal("python3 " .. vim.fn.expand("%:p"))<CR>',
            { noremap = true, silent = true }
        )

        -- Raccourci pour exécuter la sélection courante dans une fenêtre split
        vim.api.nvim_set_keymap(
            "v",
            "DS",
            ":<C-u>lua ExecuteSelectionInTerminal()<CR>",
            { noremap = true, silent = true }
        )
    end,
}
