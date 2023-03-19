local overrides = require "custom.configs.overrides"

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

  -- override plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
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
  {
    "glepnir/lspsaga.nvim",
    opts = overrides.lspsaga,
    init = require("core.utils").load_mappings "lspsaga",
    event = "BufRead",
    lazy = false,
    config = function()
      require "custom.configs.lspsaga"
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    config = function()
      require "plugins.configs.cmp"
      require "custom.configs.cmp"
    end,
  },
  {
    "vim-scripts/ReplaceWithRegister",
    lazy = false,
  },
  {
    "tpope/vim-rails",
    lazy = false,
    ft = "ruby",
  },
  {
    "gbprod/yanky.nvim",
    init = require("core.utils").load_mappings "yanky",
    event = "BufReadPost",
    config = function()
      require "custom.configs.yanky"
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require "custom.configs.dressing"
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {}
    end,
  },
  -- better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<D-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<D-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      require("custom.configs.dial")
    end,
  },
}

return plugins
