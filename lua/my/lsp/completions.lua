local cmp = require("cmp")
local ls = require("luasnip")

-- This is here to work with Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Custome Snippets with LuaSnips
-- how-to: make all.lua for global snips and rust.lua for rust snips
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/snippets/",
})

local lsp_completion = {
    config = {
        sources = cmp.config.sources({ { name = "nvim_lsp" } }),
    },
}

local path_completion = {
    config = {
        sources = cmp.config.sources({ { name = "path" } }),
    },
}

local snip_completion = {
    config = {
        sources = cmp.config.sources({ { name = "luasnip" } }),
    },
}

cmp.setup({
    completion = {
        autocomplete = false,
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
        ["<Enter>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(function()
            if not cmp.visible() then
                cmp.complete(lsp_completion)
            else
                cmp.confirm({ select = true })
            end
        end),
        ["<C-k>"] = cmp.mapping.abort(),

        -- File path
        ["<C-f>"] = cmp.mapping(function()
            if not cmp.visible() then
                cmp.complete(path_completion)
            end
        end),

        -- Snippets
        ["<C-o>"] = cmp.mapping(function()
            if not cmp.visible() then
                cmp.complete(snip_completion)
            end
        end),

        -- Snippets jumping
        ["<A-n>"] = cmp.mapping(function() ls.jump(1) end, { "i", "s" }),
        ["<A-p>"] = cmp.mapping(function() ls.jump(-1) end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

-- vim.keymap.set("i", "<CR>", function()
--     if cmp.visible() then
--         return cmp.confirm({ select = true })
--     else
--         return "<CR>"
--     end
-- end, { expr = true, replace_keycodes = true })
