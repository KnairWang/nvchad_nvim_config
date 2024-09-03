return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- "all",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "dockerfile",
        "elixir",
        "gleam",
        "go",
        "heex",
        "helm",
        "html",
        "hurl",
        "javascript",
        "json",
        "json5",
        "just",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "scss",
        "sql",
        "toml",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"

      conf.view.width = 45

      return conf
    end
  },

  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  -- }
}
