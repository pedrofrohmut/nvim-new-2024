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
require("lspconfig").jdtls.setup({
    -- root_dir = function()
    --     return vim.fn.getcwd()
    -- end,
    root_dir = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.filereadable(cwd .. "/pom.xml") == 1 then
            return cwd
        else
            vim.notify("Error: pom.xml not found in the current working directory: " .. cwd, vim.log.levels.ERROR)
            return nil -- Or handle the case where pom.xml is not found in cwd
        end
    end,
    capabilities = capabilities,
})
-- root_dir = require'lspconfig'.util.root_pattern("./pom.xml"),
-- root_dir = function()
--     vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
-- end,
