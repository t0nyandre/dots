local mason_nvim_dap_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not (mason_nvim_dap_ok) then
  vim.api.nvim_err_writeln("mason-nvim-dap is not installed")
  return
end

mason_nvim_dap.setup({
  ensure_installed = {
    "delve",
  },
  automatic_installation = true,
})
