require("my.plugins.lazy")

require("my.autocmds")
require("my.colors")
require("my.debugging")
require("my.keymaps")
require("my.options")
require("my.treesitter")

require("my.lsp.completions")
require("my.lsp.formatter")
require("my.lsp.linter")
require("my.lsp.main")
require("my.lsp.mason")
require("my.lsp.servers")
require("my.lsp.symbols_outline")

require("my.plugins.autopairs")
require("my.plugins.emmet")
require("my.plugins.lualine")
require("my.plugins.nerdtree")
require("my.plugins.nvim_colorizer")
require("my.plugins.oil")
require("my.plugins.sneak")
require("my.plugins.surround")
require("my.plugins.telescope")
require("my.plugins.zen_mode")

if vim.g.neovide then
    require("my.neovide")
end
