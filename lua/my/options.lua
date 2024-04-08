--[[
    VIM OPTIONS   :help options
]]

local opt = vim.opt

-- Indentation and tabing
opt.expandtab      = true
opt.shiftwidth     = 4
opt.softtabstop    = 4
opt.tabstop        = 4
opt.smartindent    = true

-- Searching
opt.incsearch      = true
opt.hlsearch       = false

-- Appearance
opt.signcolumn     = "yes:1"
opt.colorcolumn    = { "81", "101" }
opt.cmdheight      = 1
opt.termguicolors  = true
opt.showmode       = false
opt.number         = true
opt.relativenumber = true
opt.wildmenu       = true

-- Behavior
opt.splitright     = true
opt.splitbelow     = true
--opt.sidescrolloff  = 8
opt.cursorline     = true
opt.mouse          = "a"
opt.updatetime     = 250
opt.wrap           = false
opt.textwidth      = 100

-- Files
--opt.fileformat     = "unix"
--vim.cmd [[ set ff=unix fixeol ]]
opt.backup         = false
opt.writebackup    = false
opt.autoread       = true

-- CMP
opt.completeopt    = { "menu", "menuone", "noselect" }

vim.cmd [[ set path=$PWD/** ]]

-- New Stuff ------------------------------------------------------------------
--vim.g.netrw_liststyle = 3 -- Tree Style Netrw
