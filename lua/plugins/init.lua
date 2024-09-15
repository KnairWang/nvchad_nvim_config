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
    "folke/trouble.nvim",
    version = "*",
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
        symbols = {
          auto_open = true,
          auto_close = true,
          focus = false,
          win = {
            type = "split",
            position = "right",
            size = 30,
          }
        },
        lsp_references = {
          auto_open = false,
          auto_close = true,
          focus = true,
          win = {
            type = "split",
            position = "bottom",
            size = 10,
          }
        }
      },
    },
    keys = {
      {
        "<leader>tdg",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tr",
        "<cmd>Trouble lsp_references toggle<cr>",
        desc = "Show references (Trouble)",
      },
      {
        "<leader>tdc",
        "<cmd>Trouble lsp_declarations toggle<cr>",
        desc = "Show declarations (Trouble)",
      },
      {
        "<leader>tdf",
        "<cmd>Trouble lsp_definitions toggle<cr>",
        desc = "Show definitions (Trouble)",
      },
    },
  }
}
