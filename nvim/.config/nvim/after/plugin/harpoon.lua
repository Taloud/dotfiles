local nmap = require("taloud.keymap").nmap

local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

harpoon.setup({
  nav_first_in_list = true,
  global_settings = {
    enter_on_sendcmd = true,
    tmux_autoclose_windows = true,
  },
})

nmap { "<leader>a", require("harpoon.mark").add_file }
nmap { "<leader>ca", require("harpoon.mark").clear_all }
nmap { "<C-e>", require("harpoon.ui").toggle_quick_menu }

local remapKey = { 'h', 't', 'n', 's' }

for i = 1, 4 do
  nmap {
    string.format("<C-%s>", remapKey[i]),
    function()
      require("harpoon.ui").nav_file(i)
    end,
  }
end
