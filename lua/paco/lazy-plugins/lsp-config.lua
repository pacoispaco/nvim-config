return {
    {
        -- The Neovim plugin for installing LSP-servers, linters, formatters etc.
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        -- The configuration of which LSP-servers that mason should install,
        -- so we don't have to do it manually in the mason UI.
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup(
                {
                    ensure_installed = {
                        "lua_ls",
                        "pylsp",
                        "html",
                    },
                }
            )
        end

    },
    {
        -- This is where we configure the LSP-servers, linters, formatters etc and
        -- where we configure Neovim to use them.
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global so we don't
                            -- get warnings for that.
                            globals = {
                                'vim',
                            },
                        },
                    },
                },
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            	settings = {
		            pylsp = {
            			plugins = {
                            -- No formatters, thank you very much
                            -- Linters
                            pyflakes = { enabled = false},
                            pycodestyle = { enabled = false},
                            flake8 = { enabled = true,
                                       maxLineLength = 100 },
			            },
		            },
            	},
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                init_options = {
                    configurationSection = { "html", "css", "javascript" },
                    embeddedLanguages = {
                        css = true,
                        javascript = true,
                    },
                    provideFormatter = true,
                },
            })

            -- EVERYTHING BELOW IS IS BASED ON https://github.com/neovim/nvim-lspconfig#suggested-configuration
            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'LSP: Goto previous diagnostic' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'LSP: Goto next diagnostic' } )
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'LSP: Show diagnostics in floating window'} )
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'LSP: Add buffer diagnostics to the location list' })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buffer,
                                                                     desc = 'LSP: [g]oto [D]eclaration of symbol under cursor' })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buffer,
                                                                    desc = 'LSP: [g]oto [d]efinition of symbol under cursor' })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buffer,
                                                                    desc = 'LSP: [g]oto [r]eferences to symbol under cursor' })
                vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = ev.buffer,
                                                                         desc = 'LSP: [g]oto [t]ype definition of symbol under cursor' })
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buffer,
                                                                        desc = 'LSP: [g]oto to implementation of symbol under cursor' })
                vim.keymap.set('n', 'hi', vim.lsp.buf.hover, { buffer = ev.buffer,
                                                              desc = 'LSP: [h]over info on symbol under cursor' })
                vim.keymap.set('n', 'hs', vim.lsp.buf.signature_help, { buffer = ev.buffer,
                                                                        desc = 'LSP: [h]over signature for symbol under cursor' })
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buffer,
                                                                       desc = 'LSP: [r]e[n]ame symbol under cursor and all references to it' })
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buffer,
                                                                                     desc = 'LSP: Show [c]ode [a]ctions available at the current cursor position' })
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, { buffer = ev.buffer,
                       desc = 'LSP: [f]ormat entire buffer according to attached LSP server' })
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buffer,
                                                                                     desc = 'LSP: [h]over signature for symbol under cursor' })
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
              end,
            })

        end
    }
}
