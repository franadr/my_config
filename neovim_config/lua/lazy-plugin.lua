function SetColorScheme(color)
    -- local defaultColor = "catppuccin"
    -- color = color or defaultColor
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Lazy loading of plugins

require("lazy").setup({
    require("plugins.telescope"),
    require("plugins.lspconfig"),
    require("plugins.completion"),
    require("plugins.nvimtree"),
    require("plugins.undotree"),
    require("plugins.treesitter"),
    require("plugins.colors"),
    require("plugins.lualine"),
    require("plugins.fugitive"),
    -- require("plugins.vim_gutter"),
    -- require("plugins.copilot"),
    require("plugins.gitsigns"),
    require("plugins.autopairs"),
    require("plugins.indent_line"),
})

-- Array of available schemes
AvailableColorSchemes = {
    "catppuccin",
    "tokyonight",
    "github_light_colorblind",
    "github_light_default"
}
-- Selection of the scheme
local selectedScheme = AvailableColorSchemes[3]
SetColorScheme(selectedScheme)
