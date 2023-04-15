local dap_ok, _ = pcall(require, "dap")
if not (dap_ok) then
  vim.api.nvim_err_writeln("DAP is not installed")
  return
end

return {
  setup = function(dap)
    dap.configurations = {
      chrome = {
        {
          name = "Chrome: Debug",
          type = "chrome",
          request = "attach",
          program = "${file}",
          port = 9222,
          webRoot = "${workspaceFolder}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      },
    }
    dap.adapters.chrome = {
      type = "executable",
      command = vim.fn.exepath("chrome-debug-adapter"),
    }
  end
}
