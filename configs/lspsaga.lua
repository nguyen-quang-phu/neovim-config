local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup {
  debug = true,
  finder_action_keys = {
    open = "<cr>",
  },
}
