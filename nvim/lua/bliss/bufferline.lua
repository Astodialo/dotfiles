local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

require("bufferline").setup{
  options = {
    -- `offset` is being used so that if I open my `Tree`, bufferline should shift accordingly.
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",  -- The text to show above `Tree`.
        padding = 1
      }
    },
    tab_size = 10,
    separator_style = "slant"  -- So as to have trapezium shape tab.
  }
}
