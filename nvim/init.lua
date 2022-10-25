require "bliss.options"
require "bliss.keymaps"
require "bliss.plugins"

-- Theme (colorscheme) settings
require('nightfox').setup({
  options = {
    transparent = false, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false, -- Non focused panes set to alternative background
    styles = {
      comments = "italic",
      keywords = "italic",
      types = "italic",
      conditionals = "italic",
      constants = "italic",
      functions = "italic",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      variables = "NONE",
    }
  }
})

vim.cmd [[colorscheme duskfox]]

require "bliss.cmp"
require "bliss.lsp"
require "bliss.telescope"
require "bliss.treesitter"
require "bliss.comment"
require "bliss.nvim-tree"
require "bliss.bufferline"
require "bliss.toggleterm"
require('hologram').setup {
  auto_display = false -- WIP automatic markdown image display, may be prone to breaking
}
require "bliss.indent-blankline"
require "bliss.clipboard-image"
require "bliss.lualine"
require "bliss.mini"
