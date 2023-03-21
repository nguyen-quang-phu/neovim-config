local present, null_ls = pcall(require, "null-ls")
local ruby_code_actions = require "ruby-code-actions"
if not present then
  return
end

local diagnostics = require("null-ls").builtins.diagnostics
local formatting = require("null-ls").builtins.formatting
local code_actions = require("null-ls").builtins.code_actions

local sources = {
  -- check spell
  diagnostics.cspell.with {
    diagnostics_format = "[cspell] #{m}\n(#{c})",
  },
  code_actions.cspell,

  -- js,ts
  code_actions.eslint_d,
  formatting.prettierd,
  formatting.eslint_d,
  diagnostics.eslint_d.with {
    diagnostics_format = "[eslint] #{m}\n(#{c})",
    filetypes = { "js", "jsx", "ts", "tsx" },
  },

  -- ruby
  diagnostics.rubocop.with {
    command = "bundle",
    args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),

    diagnostics_format = "[rubocop] #{m}\n(#{c})",
  },
  formatting.rubocop.with {
    command = "bundle",
    args = vim.list_extend({ "exec", "rubocop" }, formatting.rubocop._opts.args),
  },
  ruby_code_actions.insert_frozen_string_literal,
  ruby_code_actions.autocorrect_with_rubocop,
  --lua
  formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
