local M = {}

function M.setup()
    require("neodev").setup()

    local lsp = require("tco.config.lsp.zero").lsp

    require("tco.config.lsp.mason").setup()
    require("tco.config.lsp.cmp").setup()

    lsp.setup()

    require("tco.config.lsp.null-ls").setup()
end

return M
