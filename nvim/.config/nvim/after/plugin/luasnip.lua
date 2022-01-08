if vim.g.snippets ~= "luasnip" then
  return
end

local ok, luasnip = pcall(require, "luansip")
if not ok then
  return
end

luasnip.config.set_config {
  -- I have this on, but might not be necessary
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  region_check_events = nil,

  -- Autosnippets??
  enable_autosnippets = nil,

  -- Crazy highlights!!
  ext_opts = nil,
}
