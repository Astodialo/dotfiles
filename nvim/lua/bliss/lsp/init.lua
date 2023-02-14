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

-- UI customization --
-- See more information, here: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization.

-- Modifying the signs for sign column. By default it shows like `E` for `Error`.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
