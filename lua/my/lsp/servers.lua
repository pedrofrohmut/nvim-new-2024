local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Servers ---------------------------------------------------------------------

-- Link to consult on configurations
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Lua/Lua_LS
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
        },
    },
    capabilities = capabilities,
})

-- CSharp/Omnisharp
require("lspconfig").omnisharp.setup({
    -- cmd = { "dotnet", "/home/pedro/opt/omnisharp/OmniSharp.dll" }, -- From ref link above
    cmd = { "/home/pedro/opt/omnisharp/OmniSharp", "-lsp" },
    capabilities = capabilities,
})
-- TODO: Config csharp with: Omnisharp-Extended-Lsp. at: https://github.com/Hoffs/omnisharp-extended-lsp.nvim

-- Typescript
require("lspconfig").tsserver.setup({ capabilities = capabilities })

-- C / C++
require("lspconfig").clangd.setup({ capabilities = capabilities })

-- Java
local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])

require("lspconfig").jdtls.setup({
    root_dir = root_dir,
    capabilities = capabilities,
})
-- require("lspconfig").java_language_server.setup({ capabilities = capabilities })
