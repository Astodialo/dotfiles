-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require('lsp-setup').setup({
  default_mappings = false,

  servers = {
    hls = {
      settings = {
        haskell = {
          formattingProvider = "stylish-haskell"
        }
      }
    },
    sumneko_lua = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        }
      }
    },
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
