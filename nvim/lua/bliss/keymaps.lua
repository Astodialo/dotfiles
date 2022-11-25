-- Mappings
local M = {}

-- Remap space as leader key
vim.g.mapleader = " "

M.general = {
  -- Normal
  n = {
    -- Better window navigation
    -- So, now, <A-h / j / k / l> will take me to the left / down / up / right pane resp.
    ["<A-h>"] = { "<C-w>h", "window left" },
    ["<A-l>"] = { "<C-w>l", "window right" },
    ["<A-j>"] = { "<C-w>j", "window down" },
    ["<A-k>"] = { "<C-w>k", "window up" },

    -- Go operations.
    ["gl"] = { "'.", "go to last line where last change in current buffer happened" },

    -- Save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- File explorer, number after "Lex" denote the size of the explorer
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvim-tree" },

    -- Resize splits.
    ["<A-S-h>"] = { "<cmd> vertical resize -2<CR>", "size towards left" },
    ["<A-S-l>"] = { "<cmd> vertical resize +2<CR>", "size towards right" },
    ["<A-S-k>"] = { "<cmd> resize +2<CR>", "size towards up" },
    ["<A-S-j>"] = { "<cmd> resize -2<CR>", "size towards down" },

    -- Telescope
    -- Find files
    ["<leader>ff"] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
      "open telescope's find file" },
    -- Find grep
    ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "open telescope's grep" },
    -- Find buffers
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "search open buffers" },
    ["<leader>fm"] = { "<cmd>Telescope media_files<cr>", "search open buffers" },
    --
    -- Reload the current changed lua file.
    ["<leader><CR>"] = { "<cmd>luafile %<CR>", "reload the current lua file" },

    -- Buffer navigation
    ["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", "go to left buffer" },
    ["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", "go to right buffer" },
    ["<C-S-h>"] = { "<cmd>BufferLineMovePrev<cr>", "move this buffer to left" },
    ["<C-S-l>"] = { "<cmd>BufferLineMoveNext<cr>", "move this buffer right" },

    -- LSP
    ['<leader>lD'] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "see declaration" },
    ['<leader>ld'] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "see definition" },  -- go back to your previous buffer with <C-6>
    ['<leader>lt'] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "see type definition" },
    ['<leader>lT'] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "see signature" },
    ['<leader>li'] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "see implementation" },
    ['<leader>lr'] = { "<cmd>lua vim.lsp.buf.references()<cr>", "see references" },
    ['<leader>lR'] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
    ['<leader>le'] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "open diagnostic" },
    ['<leader>lh'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
    ['<leader>fa'] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "see code action" },
    ['<leader>r']  = { "<cmd>lua vim.lsp.buf.format()<cr>", "format the document" },
    ['[d']         = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "go to previous diagnostic" },
    [']d']         = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "go to next diagnostic" },
    ['<leader>p']  = { "<cmd>lua require('nabla').popup()<cr>", "view equation" },

    -- File operations.
    ['<leader>Fc'] = { "<cmd>bd<cr>", "close the buffer" },
    ['<leader>c'] = { "<cmd>bd<cr>", "close the buffer" },

    -- Cursor operations.
    ['gx'] = { "<cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>",
      "open file under cursor with system app" },
  },
  -- Visual
  v = {
    -- Persistant paste. In visual mode, when you press 'p' to paste, it will be deleting something which is what will get pasted next, I don't want that.
    ["p"] = { '"_dP', "persistant paste" }
  },
  -- Insert
  i = {
    -- Save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
  }
}

for mode, mode_values in pairs(M.general) do
  for keybind, mapping_info in pairs(mode_values) do
    local opts = {}
    opts.desc = mapping_info[2]
    vim.keymap.set(mode, keybind, mapping_info[1], opts)
  end
end

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Macros
--
vim.fn.setreg('t', "bi`lea`")
