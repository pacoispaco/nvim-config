return {
    -- nvim-cmp is a completion engine plugin for neovim written in Lua. 
    -- Completion sources are provided by other plugins, nvim-cmp itself 
    -- provides no sources. So we need to install other plugins which will
    -- provide the sources for completion. Sources for completions can be
    -- words in the current buffer, file paths in our local environment,
    -- symbols from LSP-servers, predefined snippets of code, etc.
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-buffer",
                     "hrsh7th/cmp-path",
                     "hrsh7th/cmp-nvim-lsp",
                     "saadparwaiz1/cmp_luasnip",
                     "L3MON4D3/LuaSnip"},
--                     "hrsh7th/cmp-vsnip",
--                     "hrsh7th/vim-vsnip"},
    config = function()
        -- Once 'nvim-cmp' is installed, Neovim recognizes it under the name
        -- of 'cmp', not 'nvim-cmp'.
        local cmp = require("cmp")
        cmp.setup({
            sources = cmp.config.sources({
                { name = "buffer", keyword_length = 3 },
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
 --               { name = "vsnip" },
            }),
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                 -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                 -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                 -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
        })
    end
}
