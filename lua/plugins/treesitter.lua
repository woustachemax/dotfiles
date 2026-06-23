return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash", "css", "dockerfile", "go", "graphql", "html",
        "javascript", "json", "lua", "markdown", "markdown_inline",
        "python", "query", "regex", "rust", "scss", "sql",
        "tsx", "typescript", "vim", "vimdoc", "yaml",
      })
      opts.highlight = { enable = true }
      opts.indent = { enable = true }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    opts = { enable = true, max_lines = 3 },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
