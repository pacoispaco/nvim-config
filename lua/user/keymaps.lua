-- print("Sourcing lua/user/keymaps.lua")

-- set leader key to space
vim.g.mapleader = " "

-- if hlsearch enabled (by other plugin) ensure that we can nohlsearch easily
vim.keymap.set('n', 'nh', ':noh<CR>')
