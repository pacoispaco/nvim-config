-- Use expression folding
vim.opt.foldmethod = "expr"

-- Default to treesitter folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Start with folds open
vim.opt.foldenable = true
vim.opt.foldlevel = 99
--vim.opt.foldlevelstart = 99

-- Show column with info on folds
vim.opt.foldcolumn = "1"

-- By setting this to an empty string, it means that the first line of the fold will be syntax
-- highlighted, rather than all be one colour.
vim.opt.foldtext = ""
vim.opt.fillchars:append({fold = " "})
