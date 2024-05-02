require("my.plugins.lazy")

require("my.colors")
require("my.options")
require("my.keymaps")
require("my.autocmds")
require("my.treesitter")
require("my.debugging")

require("my.lsp.mason")
require("my.lsp.servers")
require("my.lsp.main")
require("my.lsp.formatter")
require("my.lsp.linter")
require("my.lsp.completions")
require("my.lsp.symbols_outline")

require("my.plugins.telescope")
require("my.plugins.nerdtree")
require("my.plugins.lualine")
require("my.plugins.autopairs")
require("my.plugins.surround")
require("my.plugins.tcomment")
require("my.plugins.sneak")
require("my.plugins.emmet")
require("my.plugins.oil")

if vim.g.neovide then
    require("my.neovide")
end
