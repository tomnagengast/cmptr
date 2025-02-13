-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Color scheme
    { import = 'user.plugins.rose-pine' },

    -- Useful commands like :Rename and :SudoWrite
    { 'tpope/vim-eunuch' },

    -- Git commands.
    { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },

    -- Indent autodetection with editorconfig support
    { 'tpope/vim-sleuth' },

    -- Add, change, and delete surrounding text
    { 'tpope/vim-surround' },

    -- Allow plugins to enable repeating of commands
    { 'tpope/vim-repeat' },

    -- Navigate seamlessly between Vim windows and Tmux panes
    { 'christoomey/vim-tmux-navigator' },

    -- Jump to the last location when opening a file
    { 'farmergreg/vim-lastplace' },

    -- Automatically create parent dirs when saving
    { 'jessarcher/vim-heritage' },

    -- Automatically add closing brackets, quotes, etc
    { 'windwp/nvim-autopairs', config = true },

    -- Add smooth scrolling to avoid jarring jumps
    { 'karb94/neoscroll.nvim', config = true },

    -- Show file and LSP context in a bar at the top of the screen
    { import = 'user.plugins.barbecue' },

    -- Colorize Hex Codes
    { import = 'user.plugins.colorizer' },

    -- GitHub Copilot
    { import = 'user.plugins.copilot' },

    -- Quick file navigation
    { import = 'user.plugins.harpoon' },

    -- LSP support
    -- { import = 'user.plugins.lsp-zero' },
    { import = 'user.plugins.nvim-lspconfig' },
    { import = 'user.plugins.blink-cmp' },

    -- A Status line.
    { import = 'user.plugins.lualine' },

    -- Fuzzy finder
    { import = 'user.plugins.telescope' },

    -- Improved syntax highlighting
    { import = 'user.plugins.treesitter' },

    -- Split arrays and methods onto multiple lines, or join them back up
    { import = 'user.plugins.treesj' },

    -- Commenting support
    { import = 'user.plugins.vim-commentary' },

    -- Automatically fix indentation when pasting code
    { import = 'user.plugins.vim-pasta' },

    -- Automatically set the working directory to the project root
    { import = 'user.plugins.vim-rooter' },

    { import = 'user.plugins.which-key' },

}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    install = {
        colorscheme = { "rose-pine" },
    },
})

