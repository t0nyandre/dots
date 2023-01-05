import({ "dap", "dapui" }, function(modules)
    local dap = modules["dap"]
    local dapui = modules["dapui"]
    local icons = require("settings.icons")
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapStopped", {
        text = icons.ui.TriangleShortArrowRight,
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
    })

    keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
    keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
    keymap("n", "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
    keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
    keymap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", opts)
    keymap("n", "<leader>dg", "<cmd>lua require'dap'.session()<cr>", opts)
    keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
    keymap("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", opts)
    keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
    keymap("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", opts)
    keymap("n", "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", opts)
    keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
    keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
    keymap("n", "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", opts)

    dapui.setup({
        expand_lines = true,
        icons = {
            expanded = icons.ui.TriangleShortArrowDown,
            collapsed = icons.ui.TriangleShortArrowRight,
            circular = icons.ui.Circular,
        },
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
        },
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.33 },
                    { id = "breakpoints", size = 0.17 },
                    { id = "stacks", size = 0.25 },
                    { id = "watches", size = 0.25 },
                },
                size = 0.33,
                position = "right",
            },
            {
                elements = {
                    { id = "repl", size = 0.45 },
                    { id = "console", size = 0.55 },
                },
                size = 0.27,
                position = "bottom",
            },
        },
        floating = {
            max_height = 0.9,
            max_width = 0.5, -- Floats will be treated as percentage of your screen.
            border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dapui.close()
    end
end)
