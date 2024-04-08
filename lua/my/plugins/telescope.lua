local map = vim.keymap.set
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "bin/", "obj/", "%.o", "%.out", "node_modules/", ".git/", "target/",
            "_build", ".elixir_ls", "deps", "%.lock", "package-lock.json", "dist/",
            ".next",
        },
        mappings = {
            i = {
                ["<C-s>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
            },
            n = {
                ["<C-s>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
            }
        },
    },
    pickers = {},
    extensions = {}
})
require("telescope").load_extension("fzf")

map("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fb", builtin.buffers)
map("n", "<leader>fh", builtin.help_tags)
map("n", "<leader>fk", builtin.keymaps)

local no_preview = function()
    return require("telescope.themes").get_dropdown({
        borderchars = {
                      { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
            prompt  = { "─",  "│", " ", "│", "┌", "┐", "│", "│"},
            results = { "─",  "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
        },
        width = 0.8,
        previewer = false,
        prompt_title = false
    })
end

-- Find files with hidden and gitignored
map("n", "<leader>fa", function()
    builtin.find_files({ no_ignore = true, hidden = true })
end)

local grep_search = function()
    local ok_grep, err = pcall(function ()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    if not ok_grep and err ~= "Keyboard interrupt" then -- Dont error on Ctrl-C
        error(err)
    end

    vim.cmd.echo("''")
end

map("n", "<leader>fs", grep_search)
map("n", "<C-s>", grep_search)

map("n", "<C-f>", builtin.current_buffer_fuzzy_find)

map("n", "<C-q>", function() builtin.find_files(no_preview()) end)

-- LSP Mappings
--vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions)
--vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
--vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
--vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions)
--
--vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
--vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols)
--
--vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols)
--vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols)
