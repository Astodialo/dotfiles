require('lsp-setup').setup({
  default_mappings = false,

  servers = {
    hls = {
      settings = {
        haskell = {
          formattingProvider = "stylish-haskell"
        }
      }
    }
  }
})
