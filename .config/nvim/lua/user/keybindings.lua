local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<ESC>", ":nohlsearch<ESC>:<BS>", {})
