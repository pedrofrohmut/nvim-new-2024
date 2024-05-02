vim.g.NERDTreeIgnore      = {
    "node_modules",
    "obj",
    "bin",
    "target",
    "__pycache__",
    ".git",
    ".dist",
    ".next",
    "dist",
    "deps",
    "_build",
    ".elixir_ls",
    "\\.out$",
    "\\.exe$",
    ".lock",
    "package-lock.json",
    ".expo",
    "build/",
    ".gradle",
    "gradle",
    ".settings",
}
vim.g.NERDTreeWinSize     = 36
vim.g.NERDTreeHijackNetrw = false
vim.g.NERDTreeShowHidden  = true
vim.g.NERDTreeMinimalUI   = true
vim.g.NERDTreeMinimalMenu = true

vim.keymap.set("n", "<leader>ft",
    "<cmd>NERDTreeFind<Enter><cmd>NERDTreeRefreshRoot<Enter>")
vim.keymap.set("n", "<A-8>",
    "<cmd>NERDTreeToggle<Enter><cmd>NERDTreeRefreshRoot<Enter>")
