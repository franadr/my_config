--[[
=====================================================================
=========================INSPIRED KICKSTART REMAPS===================
https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file
=====================================================================
]]--

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- for the real hardcore vimers: disable the arrow keys
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et

--[[
=====================================================================
=========================CUSTOM REMAPS===============================
=====================================================================
]]--


-- allow to move higlighted block up and down with J, K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{desc = "Allow to move highlighted block (visual) up"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = "Allow to move highlighted block (visual) down"})

-- With J you can append the line bellow to the end of the current line without moving the cursor
vim.keymap.set('n', 'J', "mzJ`z",{desc="Append the line bellow to the end of current line while keeping cursor position"})

-- Remar C-d and C-u to move half page down/up without moving the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz",{desc="move down 1/2 page without moving cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz",{desc="move up 1/2 page without moving cursor"})

-- Allow to keep the search term in the middle of the page
vim.keymap.set("n", "n", "nzzzv",{desc="keep search term in mid page"})
vim.keymap.set("n", "N", "Nzzzv",{desc="keep search term in mid page"})

-- Allow to paste with <leader>p without replacing the register value for the subsequent pastes(keeping the initialy copied value)
vim.keymap.set("x", "<leader>p", [["_dP]],{desc="Paste without replacing reg value for the subsequent paste"})

-- Set <leader>y to yank to the system register (system clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]],{desc="yank to system reg"})
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- <leader>s Will spawn a command to replace the word selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc="replace selected word"})

