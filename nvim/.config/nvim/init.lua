--                       ______     ______________
--                      |######|   |#############W
--                      |######|   |############W
--                      |######|   |###########'
--                      |######|   |###### ¯¯¯
--                      |#####################|
--                      |#####################|
--                      |######|   |######|
--                      |######|   |######|
--                      |######|   |######|
--                      |######|   |######|
--                       ¯¯¯¯¯¯     ¯¯¯¯¯¯
--
--
-------------------------------------------------------------------

pcall(require, "impatient")

if require "taloud.first_load"() then
  return
end

-- Leader key
vim.g.mapleader = " "

vim.g.snippets = "luasnip"

--  See `./lua/tj/globals/*.lua` for more information.
require "taloud.globals"

-- Turn off builtin plugins I do not use.
require "taloud.disable_builtin"

-- load my plugins
require "taloud.plugins"

-- Neovim builtin LSP configuration
require "taloud.lsp"

-- Telescope BTW
require "taloud.telescope.setup"
require "taloud.telescope.mappings"
