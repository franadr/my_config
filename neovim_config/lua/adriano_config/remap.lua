
vim.g.mapleader = ","

-- allow to move higlighted block up and down with J, K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- With J you can append the line bellow to the end of the current line without moving the cursor 
vim.keymap.set('n','J', "mzJ`z")

-- Remar C-d and C-u to move half page down/up without moving the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Allow to keep the search term in the middle of the page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allow to paste with <leader>p without replacing the register value for the subsequent pastes(keeping the initialy copied value)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Set <leader>y to yank to the system register (system clipboard)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- <leader>s Will spawn a command to replace the word selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set the current file with execution permission
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- shortcut to source current config
vim.keymap.set("n", "<leader><leader>", function ()
	vim.cmd("so")
end)

-- Show/hide the nvim tree pane
vim.keymap.set('n', "<leader>pv","<cmd>NvimTreeToggle<CR>")

-- for the real hardcore vimers: disable the arrow keys
vim.keymap.set("n","<up>","<nop>")
vim.keymap.set("n","<down>","<nop>")
vim.keymap.set("n","<left>","<nop>")
vim.keymap.set("n","<right>","<nop>")
