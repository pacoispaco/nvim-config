return {
    -- Telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Telescope: [?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Telescope: [ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Telescope: [S]earch [F]iles in cwd' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Telescope: [S]earch by [G]rep in cwd' })
        vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = 'Telescope: [S]earch existing [k]eymaps' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Telescope: [S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Telescope: [S]earch [H]elp' })

        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = 'Telescope: [/] Fuzzily search in current buffer' })

    end
}
