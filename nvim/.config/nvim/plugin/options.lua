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

-- Tjs ones
opt.inccommand = "split"
opt.splitbelow = true
opt.splitright = true
opt.shada = { "'10", "<0", "s10", "h" }

-- Don't have `o` add a comment
opt.formatoptions:remove "o"
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
opt.undodir = vim.fn.stdpath "cache" .. "/undo"
opt.undofile = true
opt.hlsearch = false -- remove color after searching
opt.incsearch = true -- Makes search act like search in modern browsers

opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.showmode = false
opt.signcolumn = "yes:1"
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
opt.updatetime = 4001 -- Make updates happen faster
opt.redrawtime = 10000
opt.belloff = "all" -- Just turn the dang bell off
opt.exrc = true
opt.secure = true
