return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
        vim.keymap.set("n", "<leader>tt", vim.cmd.TailwindSort);
    } -- your configuration
}
