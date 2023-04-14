local M = {}

function M.setup()
  local nls = require("null-ls")
  local mnls = require("mason-null-ls")

  mnls.setup({
    automatic_installation = true,
    ensure_installed = {
      "gofumpt",
      "goimports",
      "dotenv_linter",
      "gitsigns",
      "prettier",
      "shfmt",
      "stylua",
      "taplo",
      "yamlfmt",
    }
  })

  nls.setup()
end

return M
