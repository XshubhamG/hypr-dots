local opt = vim.opt

opt.laststatus = 3
opt.scrolloff = 8

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.colorcolumn = "100"
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_python_lsp = "pyrefly"
vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggle `markview` globally" })

if vim.g.neovide then
  vim.opt.linespace = 12
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14"
end
