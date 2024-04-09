local cmp = require("cmp")
local ls = require("luasnip")

-- This is here to work with Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Docs scrolling
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        -- Accept and abort completions
        ["<C-j>"] = cmp.mapping.confirm({ select = false }),
        ["<C-k>"] = cmp.mapping.abort(),

        -- Snippets jumping
        ["<A-n>"] = cmp.mapping(function() ls.jump(1) end, { "i", "s" }),
        ["<A-p>"] = cmp.mapping(function() ls.jump(-1) end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
    }, {
        { name = "buffer" },
    }),
})
