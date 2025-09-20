return {
  -- tree sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "rust",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "lua",
          "go",
          "haskell",
          "bash",
          "sql",
          "dockerfile",
          "terraform",
          "hcl",
          "json",
          "yaml",
          "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- auto pair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      local ts_context = require("ts_context_commentstring.integrations.comment_nvim")
      require("Comment").setup({
        pre_hook = ts_context.create_pre_hook(),
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require("ts_context_commentstring").setup()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
