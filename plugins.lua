local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  { "glepnir/lspsaga.nvim",
    opts = overrides.lspsaga,
    init = require("core.utils").load_mappings "lspsaga",
    event = "BufRead",
    lazy = false,
    config = function()
      require('lspsaga').setup({
        debug = true,
        finder_action_keys = {
          open = "<cr>"
        },
      })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },
  {
    "vim-scripts/ReplaceWithRegister",
    lazy = false
  },
  {
    "tpope/vim-rails",
    lazy = false,
    ft = "ruby"
  },
  {
"gbprod/yanky.nvim",
    init = require("core.utils").load_mappings "yanky",
    event = "BufReadPost",
    config = function()
      require("yanky").setup({
        highlight = {
          timer = 150,
        }
      })
    end,
  }
}

return plugins
