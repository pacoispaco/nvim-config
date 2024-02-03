return {
    {
        -- We need to install friendly-snippets as a dependency of LuaSnip according
        -- to the documentation at https://github.com/rafamadriz/friendly-snippets
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    {
        -- nvim-cmp is a completion engine plugin for neovim written in Lua. 
        -- Completion sources are provided by other plugins, nvim-cmp itself 
        -- provides no sources. So we need to install other plugins which will
        -- provide the sources for completion. Sources for completions can be
        -- words in the current buffer, file paths in our local environment,
        -- symbols from LSP-servers, predefined snippets of code, etc.
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            -- Once 'nvim-cmp' is installed, Neovim recognizes it under the name
            -- of 'cmp', not 'nvim-cmp'. The same pattern applies to other plugins.
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
               sources = cmp.config.sources({
                    { name = "buffer", keyword_length = 3 },
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            path = "[Path]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            luasnip = "[LuaSnip]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
           })
        end
    },
}
