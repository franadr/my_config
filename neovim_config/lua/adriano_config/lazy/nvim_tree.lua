return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"
            vim.keymap.set('n', "<leader>pv","<cmd>NvimTreeToggle<CR>")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
        end
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            modified = {
                enable = true,
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
                highlight_modified= 'all',
                icons = {
                    modified_placement = 'before',
                }
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        })    end
}
