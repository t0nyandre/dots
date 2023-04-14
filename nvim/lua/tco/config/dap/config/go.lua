local dap_ok, _ = pcall(require, "dap")
if not (dap_ok) then
  vim.api.nvim_err_writeln("DAP is not installed")
  return
end

return {
  setup = function(dap)
    dap.configurations = {
      go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
      },
    }
    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }
  end
}
