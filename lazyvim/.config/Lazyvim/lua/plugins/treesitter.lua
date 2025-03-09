return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add css
      vim.list_extend(opts.ensure_installed, {
        "css",
      })
    end,
  },
}
