return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require("lspconfig").lua_ls.setup {}
            require('lspconfig').gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            unusedimports = true, -- Enable unused imports analysis
                        },
                        gofumpt = true,
                        usePlaceholders = true,
                        goimports = true,
                        importShortcut = "Both", -- Enable both auto-import and organize imports
                    },
                },
                on_attach = function(_, bufnr)
                    -- Create autocommand group for Go
                    local group = vim.api.nvim_create_augroup("GoImports", { clear = true })

                    -- Auto-format and organize imports on InsertLeave
                    vim.api.nvim_create_autocmd("InsertLeave", {
                        group = group,
                        pattern = "*.go",
                        callback = function()
                            -- First format the buffer
                            vim.lsp.buf.format({ async = false })

                            -- Then organize imports
                            local params = vim.lsp.util.make_range_params()
                            params.context = { only = { "source.organizeImports" } }

                            -- Synchronously organize imports
                            local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 3000)
                            for _, res in pairs(result or {}) do
                                for _, r in pairs(res.result or {}) do
                                    if r.edit then
                                        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
                                    else
                                        vim.lsp.buf.execute_command(r.command)
                                    end
                                end
                            end
                        end,
                    })
                end,
            })
            require("lspconfig").pyright.setup {}

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })

            -- Manual import organization
            vim.keymap.set('n', '<leader>gi', function()
                vim.lsp.buf.code_action({ context = { diagnostics = {}, only = { "source.organizeImports" } }, apply = true })
            end, { noremap = true, silent = true, desc = "Organize Imports" })
        end,
    }
}
