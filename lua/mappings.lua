require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.api.nvim_set_keymap("i", "<C-k>", "p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", ":qa!<CR>", { noremap = true, silent = true })
-- now add the key mappings
vim.api.nvim_set_keymap("i", "<M-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<M-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-bs>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
