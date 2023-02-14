local fn = vim.fn

-- Automatically install packer if not already
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "folke/tokyonight.nvim" }
  use "EdenEast/nightfox.nvim"
  use 'Mofiqul/dracula.nvim'

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-lua/popup.nvim" })  -- putting it here as I am only using it for telescope's "telescope-media-files" extension
  use({ "nvim-telescope/telescope-media-files.nvim" })

  -- Treesitter
  -- It is used for better syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  })
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup {} end
  }
  use({ "p00f/nvim-ts-rainbow" })  -- rainbow parentheses for neovim using tree-sitter
  use({ "nvim-treesitter/playground" })

  use "lukas-reineke/indent-blankline.nvim"

  -- Powerful comment engine. See its usage here: https://github.com/numToStr/Comment.nvim#-usage.
  use {
    'numToStr/Comment.nvim',
  }
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })  -- now in the case of embedded language like in case of JSX, we use this with our comment plugin above.

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons'}

  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Now comes lsp & completion part
  use {
      'junnplus/lsp-setup.nvim',
      requires = {
          'neovim/nvim-lspconfig',  -- nvim has inbuilt lsp, this plugin allows for its easy configuration
          'williamboman/mason.nvim', -- allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface. i to install, u to update, X to uninstall. :LspInfo to see lsp client attached to a buffer. See default configuration at: https://github.com/williamboman/mason.nvim#default-configuration
          'williamboman/mason-lspconfig.nvim', -- mason-lspconfig.nvim closes some gaps that exist between mason.nvim and lspconfig.
      }
  }
  -- use {"mfussenegger/nvim-dap"}  -- is a Debug Adapter Protocol client
  -- use {"jose-elias-alvarez/null-ls.nvim"}  -- help in linting & formatting


  -- completion part:
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- buffer
  use 'hrsh7th/cmp-path' -- path
  use 'hrsh7th/cmp-cmdline' -- cmdline
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp. It's actual description reads that it is LuaSnip's (the below written package) completion source for `nvim-cmp`.
  use 'L3MON4D3/LuaSnip' -- Our snippet engine.
  use "rafamadriz/friendly-snippets"  -- includes snippets for many languages.


  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }


  use 'ekickx/clipboard-image.nvim'  -- to paste images in your markdown file. Use `PasteImg`

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup =
    function()
      local g = vim.g
      g.mkdp_page_title = "${name}.md"
      g.mkdp_filetypes = { "markdown" }
      g.mkdp_browser = '/usr/bin/brave'
      g.mkdp_auto_close = 0
    end, ft = { "markdown" }, })

  use {'edluffy/hologram.nvim'}
  use {"ellisonleao/glow.nvim"}
  use {"jbyuki/nabla.nvim"}
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
        require('neorg').setup {
          load = {
            ["core.defaults"] = {},
            ["core.norg.concealer"] = {
              config = { -- Note that this table is optional and doesn't need to be provided
                  -- Configuration here
              }
            },
            ["core.norg.completion"] = {
              config = { -- Note that this table is optional and doesn't need to be provided
                engine = "nvim-cmp",
              }
            },
            ["core.export"] = {
              config = { -- Note that this table is optional and doesn't need to be provided
              }
            },
            ["core.presenter"] = {
              config = {
                zen_mode = "zen-mode"
              }
            }
          }
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  -- Following is required by neorg-presenter
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
