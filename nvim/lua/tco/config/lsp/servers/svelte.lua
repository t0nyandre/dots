return {
  setup = function(on_attach, capabilities)
    require("lspconfig").svelte.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
