local clipI_status_ok, clipI = pcall(require, "clipboard-image")
if not clipI_status_ok then
  return
end

clipI.setup {
  default = {
    img_dir = "images",
    img_dir_txt = "images",
    img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      if name == nil or name == '' then
        return os.date('%y-%m-%d-%H-%M-%S')
      end
      return name
    end,
  },
}
