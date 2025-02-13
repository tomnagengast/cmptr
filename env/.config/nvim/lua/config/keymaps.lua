-- https://laracasts.com/series/neovim-as-a-php-ide/episodes/10

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("w")
    vim.cmd("so")
end)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- make indenting smarter again with < and >
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- leave the cursor alone after yanking
vim.keymap.set("v", "y", "myy`y")

-- Past replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')

-- -- delete into void (don't copy into the register)
-- vim.keymap.set({"n", "v"}, "d", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

-- Quickly clear search highlighting
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>")

-- Open the current file in the default program
vim.keymap.set("n", "<leader>o", ":!open %<CR><CR>")

-- Disable annoyting command line typo
vim.keymap.set("n", "q:", ":q")

-- when text is selected, J and K will move the line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- append next line to current line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle of the screen when page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle of the screen when page up
vim.keymap.set("n", "n", "nzzzv") -- keep cursor in the middle of the screen when search up
vim.keymap.set("n", "N", "Nzzzv") -- keep cursor in the middle of the screen when search down

-- This is going to get me cancelled
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>") -- disable ex mode
-- vim.keymap.set("n", "<leader>F", vim.lsp.buf.format) -- format the file
vim.keymap.set("n", "<leader>F", ":silent !tmux neww t<CR>") -- change the languages format of the file

-- quickfix list navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) 

-- Dev stuff
-- open packer.lua
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/.config/nvim/lua/tomnagengast/packer.lua<CR>"); 

-- vim.keymap.set("n", "<leader><leader>r", function()
--     -- print("reloading config")
--     R('data-tools')
--     require('data-tools')
--     vim.cmd("DTSelectStatement")
-- end)

