return {
  "stevearc/conform.nvim",
  cond = false, -- disabling this plugin for now;
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
    -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      mdx = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      svelte = { "svelte_fmt" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      svelte_fmt = {
        command = "prettier",
        args = {"--bracket-same-line", "true", "--plugin", "prettier-plugin-svelte", "$FILENAME"}
      }
    }
  }
}
