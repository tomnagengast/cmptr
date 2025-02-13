
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- if vim.lsp.inlay_hint then
--   nmap("<leader>L",
--   function() if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(false, { bufnr }) else vim.lsp.inlay_hint.enable(true, { bufnr }) end end, "Toggle Inlay Hints")
-- end

-- Ensure that there is always a newline at the end of the file
_G.add_new_line = function()
  local n_lines = vim.api.nvim_buf_line_count(0)
  local last_nonblank = vim.fn.prevnonblank(n_lines)
  if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' }) end
end

vim.cmd([[
  augroup AddNewlineOnSave
    autocmd!
    autocmd BufWritePre * lua _G.add_new_line()
  augroup END
]])

