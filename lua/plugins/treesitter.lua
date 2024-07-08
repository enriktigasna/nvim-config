return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html",
                "zig",
                "rust",
                "python",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true,
                additional_vim_regex_highlighting = { "markdown" }
            },  
        })
    end
}
