local function clock()
  return " " .. os.date "%H:%M"
end

require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {clock, 'filetype'}
  }
}
