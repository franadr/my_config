return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end

    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({})
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<leader>ff', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            -- declare vim as global var to not have all warnings when editing vim lua's
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
            -- configure golang lsp
            require('lspconfig').gopls.setup({
                settings = {
                    gopls = {
                        gofumpt = true
                    }
                }
            })

            local configs = require 'lspconfig/configs'

            if not configs.golangcilsp then
                configs.golangcilsp = {
                    default_config = {
                        cmd = { 'golangci-lint-langserver' },
                        root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
                        init_options = {
                            command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
                        }
                    },
                }
            end


            lspconfig.golangci_lint_ls.setup {}

            -- configure python lsp
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            -- formatter options
                            black = { enabled = true },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            -- linter options, ignores E501:Line too long
                            flake8 = { enabled = true, ignore = { "E501" } },
                            pylint = { enabled = false, executable = "pylint" },
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                            -- type checker
                            pylsp_mypy = { enabled = false },
                            -- auto-completion options
                            jedi_completion = { fuzzy = true },
                            -- import sorting
                            pyls_isort = { enabled = true },
                        },
                    },
                }
            })
            lspconfig.terraformls.setup {}
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                pattern = { "*.tf", "*.tfvars" },
                callback = function()
                    vim.lsp.buf.format()
                end,
            })


            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require('cmp_nvim_lsp').default_capabilities()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require('cmp').setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = require('cmp').mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ['<CR>'] = require('cmp').mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = require('cmp').mapping.complete(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = require('cmp').mapping.scroll_docs(-4),
                    ['<C-d>'] = require('cmp').mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    }
}
