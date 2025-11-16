return {
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup()
                end
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = {
                                        "lua_ls", "rust_analyzer", "arduino_language_server",
                                        "clangd", "pyright"
                                },
                        automatic_enable = false,
                        })
                end,
        },
        {
                "neovim/nvim-lspconfig",
                lazy = false,
                config = function()
                        local capabilities = require('cmp_nvim_lsp').default_capabilities()

                        vim.lsp.config("arduino_language_server", {
                                capabilities = capabilities
                        })
                        vim.lsp.enable("arduino_language_server")

                        vim.lsp.config("lua_ls", {
                                capabilities = capabilities
                        })
                        vim.lsp.enable("lua_ls")

                        vim.lsp.config("pyright", {
                                on_attach = function(client , bufnr)
                                        lsp_keymap(bufnr)
                                end,
                                capabilities = capabilities,
                                cmd = { "pyright-langserver", "--stdio" },
                                filetypes = { "python" },
                                settings = {
                                        python = {
                                                analysis = {
                                                        autoSearchPaths = true,
                                                        diagnosticMode = "openFilesOnly",
                                                        useLibraryCodeForTypes = true
                                                }
                                        }
                                },
                                single_file_support = true
                        })
                        vim.lsp.enable("pyright")

                        vim.lsp.config("clangd", {
                                on_attach = function(client , bufnr)
                                        lsp_keymap(bufnr)
                                end,
                                capabilities = capabilities,
                                cmd = {
                                        "clangd",
                                        "--offset-encoding=utf-16",
                                        "--header-insertion=never",
                                        "--include-cleaner-stdlib=false",
                                },
                        })
                        vim.lsp.enable("clangd")

                        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                        -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
                        -- vim.keymap.set("n", "<leader>gc", vim.lsp.buf.imlementation, {})
                        -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
                        -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

                        function lsp_keymap(bufnr)
                                local bufopts = { noremap=true, silent=true, buffer=bufnr }
                                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
                                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                                vim.keymap.set("n", "[g", vim.diagnostic.goto_next)
                                vim.keymap.set("n", "]g", vim.diagnostic.goto_prev)
                        end
                end,
        },
}
