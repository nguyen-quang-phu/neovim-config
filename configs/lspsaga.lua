local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup {
  debug = true,
  finder = {
    keys = {
      expand_or_jump = "<cr>",
    },
  },
}
