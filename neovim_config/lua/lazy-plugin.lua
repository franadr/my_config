

require('lazy').setup({

    require 'plugins.telescope',
    require 'plugins.lspconfig',
    require 'plugins.completion',
    -- require 'plugins.catppuccin',
    require 'plugins.nvimtree',
    require 'plugins.undotree',
    require 'plugins.treesitter',
    require 'plugins.colors'

},
    {
        ui = {
            icons = {}
        }
    })
