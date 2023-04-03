local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<ESC>", "<Cmd>nohlsearch<CR>:<BS>", {})
keymap("n", "<leader>t", "<Cmd>NvimTreeToggle<CR>", {})
