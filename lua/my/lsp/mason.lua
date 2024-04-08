require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",               -- C/C++
        "cssls",                -- CSS
        "html",                 -- HTML
        "lua_ls",               -- Lua
        "pyright",              -- Python
        "tsserver",             -- Typescript/Javascript
    }

    --"omnisharp",            -- CSharp
    --"jdtls",                -- Java (Eclipse)
    --"elixirls",             -- Elixir
    --"hls",                  -- Haskell
    --"rust_analyzer",        -- Rust

    --"java_language_server", -- Java
})
