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
      -- conf.filters.enable = false
      conf.filters.git_ignored = false
      conf.filters.dotfiles = false
      conf.filters.git_clean = false
      conf.filters.no_buffer = false
      conf.filters.no_bookmark = false
      conf.filters.custom = {}
      conf.filters.exclude = {}

      return conf
    end
  },

  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  -- }
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("configs.nvim-cmp")
    end
  },

  {
    "windwp/nvim-autopairs",
    enabled = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = "Trouble",
    opts = {
      auto_close = false,
      win = {
        type = "split",
        position = "bottom",
      },
      focus = true,
      warn_no_results = false,
      modes = {
        -- diagnostics = {
        --   auto_open = true,
        --   -- filter = {
        --   --   range = 1,
        --   -- },
        --   follow = true
        -- },
        quickfix = {
          auto_open = true,
          focus = true,
        },
        qflist = {
          auto_open = true,
          focus = true,
        },

      },
    },
    keys = {
      -- {
      --   "<leader>xx",
      --   "<cmd>Trouble diagnostics toggle<cr>",
      --   desc = "Diagnostics (Trouble)",
      -- },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics open filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols open focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      -- {
      --   "<leader>cl",
      --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      --   desc = "LSP Definitions / references / ... (Trouble)",
      -- },
      {
        "<leader>tr",
        "<cmd>Trouble lsp_references open<cr>",
        desc = "Show references (Trouble)",
      },
      {
        "<leader>tD",
        "<cmd>Trouble lsp_declarations open<cr>",
        desc = "Show declarations (Trouble)",
      },
      {
        "<leader>td",
        "<cmd>Trouble lsp_definitions open<cr>",
        desc = "Show definitions (Trouble)",
      },
    },
  }
}
