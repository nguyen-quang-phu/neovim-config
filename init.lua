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
g.neovide_background_color = "1e1e1e"
g.neovide_remember_window_size = true
g.neovide_input_macos_alt_is_meta = true
g.camelcasemotion_key = "<leader>"

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldenable = true
vim.o.foldlevelstart = 99

vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]
