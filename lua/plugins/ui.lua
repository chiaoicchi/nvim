return {
  -- color scheme
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "darker"
      }
      require("onedark").load()
    end,
  },

  -- render markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
      "nvim-mini/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  -- preview markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
}
