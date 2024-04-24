local cmp = require("cmp")
local ls = require("luasnip")

-- This is here to work with Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Custome Snippets with LuaSnips
-- how-to: make all.lua for global snips and rust.lua for rust snips
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/snippets/"
})

cmp.setup({
    completion = {
        autocomplete = false
    },
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
        ["<C-j>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                cmp.complete()
            end
        end),
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
