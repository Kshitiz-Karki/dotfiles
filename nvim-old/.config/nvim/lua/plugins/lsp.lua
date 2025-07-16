-- https://www.youtube.com/watch?v=V070Zmvx9AM&t=97s
-- https://github.com/JazzyGrim/dotfiles/blob/master/.config/nvim/lua/plugins/lsp.lua
return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "html-lsp",
        "mypy",
        "black",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        cssls = {},
        html = {},
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },
}
