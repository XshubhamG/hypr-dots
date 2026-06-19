-- open help files in a vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
  end,
})

-- no auto comment on new line
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", { clear = true }),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
