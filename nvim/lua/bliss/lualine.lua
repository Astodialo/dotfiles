local function clock()
  return " " .. os.date "%H:%M"
end

require('lualine').setup {
  sections = {
    lualine_x = {clock, 'filetype'}
  }
}
