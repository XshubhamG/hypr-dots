-- Keymaps
local keymap = vim.keymap -- for consciseness

-- replaces selected text WITHOUT losing what you yanked
keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Scroll up/down and center
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Next/Previous search cursor centered
keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

keymap.set("n", "<leader>fi", ":set filetype=ini<CR>", { desc = "Set filetype to ini" })

keymap.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" }
)

-- toggle copilot plugin
keymap.set("n", "<leader>gc", ":Copilot disable<CR>", { desc = "Disable Copilot" })

-- close current Buffer
keymap.set("n", "<M-x>", ":bp | bd #<CR>", { desc = "Close current Buffer" })

-- general keymaps
keymap.set("n", "<leader>qa", ":qa!<CR>") -- closing all files & neovim

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- escaping into normal mode
keymap.set("i", "<C-c>", "<ESC>")

-- Buffer Previous
keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- Buffer Next
keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- neovide
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "railgun"

  keymap.set("n", "<C-s>", ":w<CR>") -- Save
  keymap.set("v", "<C-c>", '"+y') -- Copy
  keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
  keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
  keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
  keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
