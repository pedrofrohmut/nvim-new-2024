local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local opts = {}

local plugins = {
    -- Color Schemes (comment it out the one you like be not using)
    { "sainnhe/sonokai" },
    -- use "folke/tokyonight.nvim"
    -- use "jacoborus/tender.vim"
    -- use "mhartington/oceanic-next"
    
    -- Telescope
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6', 
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}

require("lazy").setup(plugins, opts)
