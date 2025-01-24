-- iiset leader key to space
-- Set leader key
vim.g.mapleader = " "

-- Key mappings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<C-w>", ":close<CR>", opts)
-- Force quit Neovim
keymap("n", "<C-q>", ":qa!<CR>", opts)

keymap("i", "<C-BS>", "<C-w>", opts) -- Insert mode
keymap("c", "<C-BS>", "<C-w>", opts) -- Command-line mode
-- Telescope key mappings
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

keymap("i", "<C-BS>", "<C-w>", opts) -- Insert mode
keymap("c", "<C-BS>", "<C-w>", opts) -- Command-line mode
-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Ctrl+Backspace to delete the previous word
keymap("i", "<C-BS>", "<C-w>", opts)
keymap("c", "<C-BS>", "<C-w>", opts)

-- Ctrl+W to close the current window
keymap("n", "<C-w>", ":close<CR>", opts)

-- Ctrl+Enter to insert a newline
keymap("i", "<C-CR>", "<C-o>o", opts)
keymap("n", "<C-CR>", "o<Esc>", opts)

-- Ctrl+A to select all text
keymap("n", "<C-a>", "ggVG", opts)

-- Alt+Down to copy the current line down
keymap("n", "<A-Down>", ":t.<CR>", opts)

-- Alt+Up to copy the current line up
keymap("n", "<A-Up>", ":t-1<CR>", opts)

-- Select all and copy to clipboard
vim.api.nvim_set_keymap("n", "<C-a>", 'ggVG"+y', { noremap = true, silent = true })
-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy.nvim and plugins
require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvchad/nvchad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, require "configs.lazy")

-- Base46 cache
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load options, autocmds, and mappings
require "options"
require "nvchad.autocmds"
vim.schedule(function()
  require "mappings"
end)
