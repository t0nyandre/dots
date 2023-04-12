return {
  setup = function(on_attach, capabilities)
    require('lspconfig').gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            fillstruct = true,
          },
          staticcheck = true,
        },
      },
    }
  end
}
