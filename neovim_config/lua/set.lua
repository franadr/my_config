--[[

KICKSTART SETTINGS
https://github.com/nvim-lua/kickstart.nvim

--]]


-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Show the mode (normal, insert, visual), might be turned off if using status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- How neovim should display tabs, trails and blackspaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

--[[

CUSTOM SETTINGS

--]]


-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- make indent size of 4 space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

-- no swap files but instead keep history of the changes in the targeted dir, i.e. for undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- no highlight of the search item but rather the incremental highlight when typing
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- never have less than 8 lines above when scrolling
vim.opt.scrolloff = 8

-- column for displaying the sign
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250

-- trick to force *.tf to be interpreted as terraform files
vim.filetype.add({
  extension = {
    tf = "terraform"
  }
})
