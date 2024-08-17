local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "flake8", "black" },
    rust = { "rustfmt " },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = "*",
  --   callback = function(args)
  --     require("conform").format { bufnr = args.buf }
  --   end,
  -- }),
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
