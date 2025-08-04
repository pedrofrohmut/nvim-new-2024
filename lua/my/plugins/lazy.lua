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
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Tree file explorer
    { "preservim/nerdtree" },

    -- Lua line
    { "nvim-lualine/lualine.nvim" },

    -- LSP
    { "neovim/nvim-lspconfig" },

    -- Mason
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    -- Formatter
    { "stevearc/conform.nvim", opts = {} },

    -- Linter
    { "mfussenegger/nvim-lint" },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },

    -- Snippets
    {
        { "L3MON4D3/LuaSnip", version = "2.2.0" },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

    -- Debugging
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },

    -- OLD Debugging
    -- {
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "nvim-neotest/nvim-nio",
    -- "theHamsta/nvim-dap-virtual-text",
    -- },

    -- Symbols (Tagbar)
    { "hedyhli/outline.nvim" },

    -- Autopairs
    { "windwp/nvim-autopairs", event = "InsertEnter" },

    -- Dot command now works with some plugins too
    { "tpope/vim-repeat" },

    -- Surrounder for Simple Stuff
    { "tpope/vim-surround" },

    -- Aligner
    { "tommcdo/vim-lion" },

    -- Git gutter
    { "airblade/vim-gitgutter" },

    -- Jump plugin like small version of easy motion
    { "justinmk/vim-sneak" },

    -- Emmet
    { "mattn/emmet-vim" },

    -- JSX
    { "maxmellon/vim-jsx-pretty" },

    -- Oil Vim (Buffer like File Management)
    { "stevearc/oil.nvim" },

    -- Java LSP - JDTLS
    { "mfussenegger/nvim-jdtls" },
    -- { "nvim-java/nvim-java" },

    -- Navic - Statubar breadcrumbs
    { "SmiteshP/nvim-navic" },

    -- Zen mode
    { "folke/zen-mode.nvim" },

    -- Colors on text
    { "norcalli/nvim-colorizer.lua" },
}

require("lazy").setup(plugins, opts)
