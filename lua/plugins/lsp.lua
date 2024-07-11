return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- Replace the language servers listed here
            -- with the ones you want to install
            ensure_installed = {
                'tsserver',
                'rust_analyzer',
                'clangd',
                'lua_ls',
                'pyright',
                'zls',
                'emmet_ls',
                'tailwindcss',
                'html',
                'cssmodules_ls',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                lua_ls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    }
                end,
                emmet_ls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.emmet_ls.setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                        flags = lsp_flags
                    }
                end,
            }
        })
    end,
}
