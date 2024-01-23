-- print("Sourcing lua/paco/keymaps.lua")

-- set leader key to space
vim.g.mapleader = " "

-- if hlsearch enabled (by other plugin) ensure that we can nohlsearch easily
vim.keymap.set('n', '<leader>/', ':noh<CR>')
