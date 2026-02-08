-- print("Sourcing lua/user/options.lua")

-- Basic Neovim configuration options

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Make linenumbers stand out a bit more (with dark gruvbox-material)
vim.cmd("highlight LineNr guibg=#111111 guifg=#888888")
vim.cmd("highlight CursorLineNr guibg=#444444 guifg=#cccccc")

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = true         -- No line wraps
opt.linebreak = true    -- Break lines at words

-- Search settings
opt.ignorecase = true -- When searching with lowercase ignore case
opt.smartcase = true  -- When searching with uppercase match uppercase

-- Cursorline
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- This adds the gray vertical bar to the left. It is used by plugins to add info on the current line, eg git status.
--vim.cmd("highlight SignColumn guibg=#222222")

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitting windows
opt.splitright = true
opt.splitbelow = true

-- Consider dashes '-' to be part of words. so <dw> on "foo-bar" will delete "foo-bar".
opt.iskeyword:append("-")

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- This is for showing diagnostics in popup windows.
-- I define the shortcut "<leader>d" in "lsp-config.lua" to bring up the windows
vim.diagnostic.config({
  virtual_text = false, -- Disables inline messages completely
  signs = true,         -- Keep E/W icons in the gutter
  underline = true,     -- Underline the problem text
  update_in_insert = false,
  float = {
    border = "rounded",
    source = "if_many",
    wrap = true,
  },
})
