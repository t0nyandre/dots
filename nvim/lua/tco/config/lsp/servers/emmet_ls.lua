return {
  setup = function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require('lspconfig').emmet_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      },
      settings = {
        emmet = {
          showExpandedAbbreviation = "always",
          showSuggestionsAsSnippets = true,
        },
      },
    }
  end
}
