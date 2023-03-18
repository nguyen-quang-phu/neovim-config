-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Neovide
local g = vim.g
g.neovide_transparency = 0.24
g.neovide_transparency_point = 0.8
g.neovide_cursor_antialiasing = false
g.neovide_cursor_animation_length = 0
g.neovide_background_color = '1e1e1e'
