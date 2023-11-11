vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = unnamedplus
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
status, lazy = pcall(require, "lazy")
if status then
  lazy.setup({
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
  })
  vim.cmd[[colorscheme tokyonight-night]]
end

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})
