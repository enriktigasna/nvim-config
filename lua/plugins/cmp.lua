return {
    'hrsh7th/nvim-cmp',
    config = function()
        local import_cmp, cmp = pcall(require, 'cmp')
        if not import_cmp then return end

        local import_luasnip, luasnip = pcall(require, 'luasnip')
        if not import_luasnip then return end
        
        require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets" }
        
        cmp.setup({
            snippet = {
                expand = function (args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function (fallback)
                    if luasnip.expandable() then
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'})
            },
            sources = {
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'buffer' },
                { name = 'path' },
            }
        })
    end
}
