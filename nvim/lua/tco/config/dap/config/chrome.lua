local dap_ok, _ = pcall(require, "dap")
if not (dap_ok) then
  vim.api.nvim_err_writeln("DAP is not installed")
  return
end

return {
  setup = function(dap)
    for _, lang in ipairs({ "typescript", "javascript", "svelte" }) do
      dap.configurations[lang] = {
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch Chrome",
          url = "http://localhost:5173",
          sourceMaps = true,
          webRoot = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          runtimeExecutable = "/usr/bin/google-chrome",
          enableContentValidation = false,
        }
      }
    end
  end
}
