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
        "RRethy/nvim-treesitter-endwise",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor", ".history", ".git", "tags", ".tags", "tmp", "log", "dist" },
        mappings = {
          i = {
            ["<esc>"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

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
      { "RRethy/nvim-treesitter-textsubjects" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
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
    keys = {
      {
        "<D-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<D-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
    },
    config = function()
      require "custom.configs.dial"
    end,
  },
  {
    "michaeljsmith/vim-indent-object",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "semanticart/ruby-code-actions.nvim",
  },
  {
    "kana/vim-textobj-entire",
    lazy = false,
    dependencies = { { "kana/vim-textobj-user" } },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "kdheepak/lazygit.nvim",
    init = require("core.utils").load_mappings "lazy_git",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
  },
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    opts = {},
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp = require "cmp"
      local handlers = require "nvim-autopairs.completion.handlers"
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"

      require("cmp").event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done {
          filetypes = {
            ["*"] = {
              ["("] = {
                kind = {
                  cmp.lsp.CompletionItemKind.Function,
                  cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"],
              },
            },
            ruby = false,
          },
        }
      )
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "bkad/CamelCaseMotion",
    lazy = false,
  },
  {
    "tpope/vim-abolish",
    lazy = false,
  },
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.move").setup {}
    end,
  },
  {
    "ggandor/leap.nvim",
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    config = function()
      vim.g.VM_maps["Find Under"] = "<C-d>"
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    keys = {
      {
        "<leader>w",
        "<cmd>HopWord<cr>",
      },
    },
    config = function()
      local hop = require "hop"
      hop.setup {
        keys = "etovxqpdygfblzhckisuran",
      }
    end,
    init = require("core.utils").load_mappings "hop",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    init = require("core.utils").load_mappings "comment",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {
        keymaps = {
          close = { "" },
          toggle_preview = "gh",
        },
      }
    end,
    lazy = false,
    keyss = {
      {
        "<S-D-o>",
        "<cmd>SymbolsOutline<cr>",
      },
    },
  },
}

return plugins
