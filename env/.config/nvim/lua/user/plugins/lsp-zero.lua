return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        "neovim/nvim-lspconfig", -- Required
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocomplete
        "hrsh7th/nvim-cmp", -- Required
        "hrsh7th/cmp-nvim-lsp", -- Required
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",

        -- Snippets
        "L3MON4D3/LuaSnip", -- Required
        "rafamadriz/friendly-snippets",
    },
}

