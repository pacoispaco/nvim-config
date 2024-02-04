return {
    -- Telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = 'Telescope: [?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', telescope.buffers, { desc = 'Telescope: [ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = 'Telescope: [S]earch [F]iles in cwd' })
        vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = 'Telescope: [S]earch by [G]rep in cwd' })
        vim.keymap.set('n', '<leader>sk', telescope.keymaps, { desc = 'Telescope: [S]earch existing [k]eymaps' })
        vim.keymap.set('n', '<leader>sd', telescope.diagnostics, { desc = 'Telescope: [S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = 'Telescope: [S]earch [H]elp' })

        vim.keymap.set('n', '<leader>ss', function()
            telescope.spell_suggest(require('telescope.themes').get_dropdown {
                winblend = 20,
                previewer = false,
            })
        end, { desc = 'Telescope: [S]pell [S]uggest' })

        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
            telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 20,
                previewer = false,
            })
        end, { desc = 'Telescope: [/] Fuzzily search in current buffer' })

    end
}
