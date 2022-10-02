-- We need to put `local` below as o/w variable is global.
local options = {

  -- Can play with these options live (in neovim) by doing, for example: `set cmdheight=1`
  -- Learn more about them by doing: `:help options`

  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },
  --[[
    In vim, we have `ins-completion` (standing for "insert completion").
    `menuone`:  Use the popup menu also when there is only one match.    
                Useful when there is additional information about the
                match, e.g., what file it comes from.
    `noselect`: Do not select a match in the menu, force the user to
                select one from the menu. Only works in combination with
                "menu" or "menuone". 
  --]]
  fileencoding = "utf-8",                  -- the encoding written to a file
  ignorecase = true,                       -- ignore case in search patterns.
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- maximum number of items to show in the popup menu.
  showtabline = 2,                         -- always show tabs
  smartcase = true,
  --[[
    Override the 'ignorecase' option if the search pattern contains upper
    case characters. Only used when the search pattern is typed and  
    'ignorecase' option is on. Used for the commands "/", "?", "n", "N",
    ":g" and ":s". Not used for "*", "#", "gd", tag search, etc. After
    "*" and "#" you can make 'smartcase' used by doing a "/" command,
    recalling the search pattern from history and hitting <Enter>.
  --]]
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  hlsearch = false,                        -- when we sesarch for something, after finding a match, nvim still highlight other matches. This setting disables that. Else, you can leave it at default, and type `:noh`
  scrolloff = 999,                         -- This is very important as usually when you change buffers, (neo)vim tries to put your cursor at center, which is disturbing when trying to compare documents. With this that issue doesn't happen as it as such keeps cursor at center. Also, when you reach at end or near beginning of file, your cursor can't be at center but still neovim doesn't give issue when changing buffer. BTW, I learned about this from here: https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers.
  signcolumn = "number",                   -- This is an important setting. Suppose you are editing and LSP discovers some issue on your line then it will insert its icon in sign column, making sign column thicker and your text shifting rightwards, I don't like this jankiness. One of the solution would be to do something like "yes:2" but I have set it to "number", learning from: https://www.reddit.com/r/neovim/comments/neaeej/only_just_discovered_set_signcolumnnumber_i_like/. One thing to note though, that in case their are multiple competing signs, only one will be shown.

}

for k, v in pairs(options) do
  vim.opt[k] = v  -- this is how we set options in neovim
end
