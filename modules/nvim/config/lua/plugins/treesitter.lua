return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 100,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "bash",
        "javascript",
        "json",
        "python",
        "rust",
        "yaml",
        "zig",
        "zsh",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      multiline_threshold = 1,
    },
  },
}
