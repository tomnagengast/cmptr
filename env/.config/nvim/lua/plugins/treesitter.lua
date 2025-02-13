return {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",

    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
        { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            opts = {
                custom_calculation = function (_, language_tree)
                    if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' then
                        return '{{-- %s --}}'
                    end
                end,
            },
        },
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "query", "sql", "go", "javascript", "typescript", "rust", "html", "css", "php" },
            auto_install = true,
            ignore_install = {},
            sync_install = false,
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            modules = {},
            ts_context_commentstring = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['if'] = '@function.inner',
                        ['af'] = '@function.outer',
                        ['ia'] = '@parameter.inner',
                        ['aa'] = '@parameter.outer',
                    },
                },
            },
        })
    end
}

