return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            -- Open Nvim tree with //
            vim.keymap.set('n', "\\", "<cmd>NvimTreeToggle<CR>", { desc = "Open Nvim-tree" })

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'), { desc = "Toggle nvim tree help" })
        end

        require("nvim-tree").setup({
            on_attach = my_on_attach,
            modified = {
                -- Mark files modifed while buffer not saved yet
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
                highlight_modified = 'all',
                icons = {
                    modified_placement = 'before',
                }
            },
            filters = {
                -- show all (hidden and git ignored)
                dotfiles = false,
                git_ignored = false,
            },
        })
    end
}
