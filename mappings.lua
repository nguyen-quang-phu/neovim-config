---@type MappingsTable
local M = {}
M.disabled = {
  n = {
    ["gr"] = "",
    ["<C-c>"] = "",
  },
  v = {
    ["gr"] = "",
  },
}
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- switch between windows
    ["<left>"] = { "<C-w>h", "window left" },
    ["<right>"] = { "<C-w>l", "window right" },
    ["<down>"] = { "<C-w>j", "window down" },
    ["<up>"] = { "<C-w>k", "window up" },
    ["<D-w>v"] = { "<C-w>v", "split vertical" },
    ["<D-w>s"] = { "<C-w>s", "split horizontal" },
    ["<D-w>o"] = { "<C-w>o", "only window" },
    ["<D-w>q"] = { "<C-w>q", "close window" },

    -- save
    ["<D-s>"] = { "<cmd> w <CR>", "save file" },

    -- Copy all
    ["<D-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
    ["<D-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr><cmd> w <CR>", " ", opts = { nowait = true } },
  },
  i = {

    ["<D-v>"] = { "<c-r>+", " ", opts = { nowait = true } },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<D-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

-- more keybinds!
M.nvimtree = {
  n = {
    ["<D-b>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<S-D-e>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<D-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<S-D-f>"] = { "<cmd> Telescope live_grep <CR>", "live grep" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.lspconfig = {}

M.replace_with_register = {
  n = {
    ["gr"] = { "<Plug>ReplaceWithRegisterOperator", "ReplaceWithRegisterOperator" },
    ["grr"] = { "<Plug>ReplaceWithRegisterLine", "ReplaceWithRegisterLine" },
  },
  v = {
    ["gr"] = { "<Plug>ReplaceWithRegisterVisual", "ReplaceWithRegisterVisual" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<D-`>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<D-`>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.lspsaga = {
  n = {
    ["gd"] = { "<Cmd>Lspsaga lsp_finder<CR>", "Lspsaga lsp_finder" },
    ["<D-.>"] = { "<Cmd>Lspsaga code_action<Cr>", "Lspsaga code_action" },
    ["<F2>"] = { "<Cmd>Lspsaga rename<CR>", "Lspsaga rename" },
  },
}

M.yanky = {
  n = {
    ["y"] = { "<Plug>(YankyYank)", "YankyYank" },
    ["p"] = { "<Plug>(YankyPutAfter)", "YankyPutAfter" },
    ["P"] = { "<Plug>(YankyPutBefore)", "YankyPutBefore" },
  },
}
return M
