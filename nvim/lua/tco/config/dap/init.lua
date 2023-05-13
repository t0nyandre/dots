local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, dap_ui = pcall(require, "dapui")
if not (dap_ok and dap_ui_ok) then
  vim.api.nvim_err_writeln("DAP is not installed")
  return
end

local utils = require("tco.utils")

local go_config = require("tco.config.dap.config.go")

go_config.setup(dap)

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Start debugging session
utils.map("n", "<leader>ds", function()
  dap.continue()
  dap_ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
utils.map("n", "<leader>dl", require("dap.ui.widgets").hover)
utils.map("n", "<leader>dc", dap.continue)
utils.map("n", "<leader>db", dap.toggle_breakpoint)
utils.map("n", "<leader>dn", dap.step_over)
utils.map("n", "<leader>di", dap.step_into)
utils.map("n", "<leader>do", dap.step_out)
utils.map("n", "<leader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
utils.map("n", "<leader>de", function()
  dap.clear_breakpoints()
  dap_ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end)

dap_ui.setup({
  icons = {
    expanded = "▾",
    collapsed = "▸",
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
  expand_lines = vim.fn.has("nvim-0.7"),
  sidebar = {
    elements = {
      -- You can change the order of elements in the sidebar
      "scopes",
      "breakpoints",
      "stacks",
      "watches",
    },
    size = 40,
    position = "left", -- Can be "left" or "right"
  },
  tray = {
    elements = {
      "repl",
    },
    size = 10,
    position = "bottom", -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil,  -- Floats will be treated as percentage of your screen.
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})
