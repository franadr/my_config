function SetColorScheme(color)
    local defaultColor = "catppuccin"
    color = color or defaultColor
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
    require("plugins.vim_gutter"),
})

-- Array of available schemes
AvailableColorSchemes = {
    "catppuccin",
    "tokyonight",
}
-- Selection of the scheme
local selectedScheme = AvailableColorSchemes[0]
SetColorScheme(selectedScheme)
