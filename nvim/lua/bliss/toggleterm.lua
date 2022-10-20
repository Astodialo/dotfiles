local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  open_mapping = [[<C-t>]],  -- only thing I changed.
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)  -- use jk to exit from insert mode and enter normal mode, press 'i' to back to insert mode.
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
