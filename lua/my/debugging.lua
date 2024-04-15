-- Dap -------------------------------------------------------------------------

local dap = require("dap")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", dap.set_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.run_last)
vim.keymap.set("n", "<leader>dq", dap.terminate)

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dap.step_over)
vim.keymap.set("n", "<F7>", dap.step_into)
vim.keymap.set("n", "<F8>", dap.step_out)

vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)

-- Dap UI ----------------------------------------------------------------------

local dapui = require("dapui")

dapui.setup()

vim.keymap.set("n", "<leader>dt", dapui.toggle)

-- Dap Virtual Text ------------------------------------------------------------

require("nvim-dap-virtual-text").setup()

-- C/C++ GDB -------------------------------------------------------------------

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
    },
}

-- CSharp NetCoreDbg -----------------------------------------------------------

dap.adapters.coreclr = {
    type = "executable",
    command = "netcoredbg",
    args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to dll => ", vim.fn.getcwd() .. "", "file")
        end,
    },
}
