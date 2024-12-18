return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local folders_to_ignore = {
            "venv"
        }

        require('telescope').setup({

            defaults = {
                file_ignore_patterns = folders_to_ignore
            }
        })


        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ no_ignore = true })
        end, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
