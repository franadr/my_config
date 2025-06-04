return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                show_end_of_buffer = true,
                styles = {
                    strings = { 'italic' },
                    comments = { 'altfont' }
                    -- comments = {'bold','underdouble'}
                }
            })
        end
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                options = {
                    dim_inactive = true,
                    styles = {
                        comments = 'italic',
                        keywords = 'bold',
                        types = 'bold',
                    },
                }
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = false,    -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },




}
