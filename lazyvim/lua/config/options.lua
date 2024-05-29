vim.g.loaded_matchparen = 1

local opt = vim.opt

-- Ignore compiled files
-- test message
opt.wildignore = opt.wildignore
  + { "*~", "*.pyc", "*pycache*", "*_build/*", "**/coverage/*", "**/node_modules/*", "**/.git/*" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full:full"
opt.wildmenu = true
opt.wildoptions = "pum"

opt.relativenumber = true -- Show line numbers
opt.hlsearch = false -- I wouldn't use this without my DoNoHL function
opt.hidden = true -- I like having buffers stay around
opt.errorbells = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.termguicolors = true
opt.smartindent = true
opt.nu = true
opt.wrap = false
opt.swapfile = false -- Living on the edge
opt.backup = false
opt.undodir = vim.fn.stdpath("cache") .. "/undo"
opt.undofile = true
opt.hlsearch = false -- remove color after searching
opt.incsearch = true -- Makes search act like search in modern browsers
opt.clipboard = ""
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.showmode = false
opt.signcolumn = "yes:2"
opt.mouse = "a"
opt.mousemoveevent = true
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unles there is a capital letter in the query
opt.list = true
opt.listchars = "tab:▸ ,eol:↴,trail:·" -- set joinspaces
opt.completeopt = "menuone,longest,preview"
opt.joinspaces = false -- Two spaces and grade school, we're done
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.number = true -- But show the actual number for the line we're on
opt.cursorline = true -- Highlight the current line
opt.updatetime = 200 -- Make updates happen faster
opt.redrawtime = 10000
opt.belloff = "all" -- Just turn the dang bell off
opt.exrc = true
opt.secure = true

-- opt.formatoptions = opt.formatoptions
--   - "a" -- Auto formatting is BAD.
--   - "t" -- Don't auto format my code. I got linters for that.
--   + "c" -- In general, I like it when comments respect textwidth
--   + "q" -- Allow formatting comments w/ gq
--   - "o" -- O and o, don't continue comments
--   + "r" -- But do continue when pressing enter.
--   + "n" -- Indent past the formatlistpat, not underneath it.
--   + "j" -- Auto-remove comments if possible.
--   - "2" -- I'm not in gradeschool anymore
